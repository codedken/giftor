import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/person/person.dart';
import '../models/my_shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  final _db = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  final _storage = FirebaseStorage.instance;
  final String _usersCollection = 'users',
      _email = 'email',
      _name = 'name',
      _phoneNo = 'phoneNo',
      _createdAt = 'createdAt',
      _imageUrl = 'imageUrl',
      _groups = 'groups';

  UploadTask? task;

//sign-in only registered user
  Future<void> signIn(String email, String password) async {
    try {
      UserCredential res = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final userData =
          await _db.collection(_usersCollection).doc(res.user!.uid).get();

      Person person = Person.saveLocally(
        id: res.user!.uid,
        email: userData.get(_email),
        name: userData.get(_name),
        phoneNo: userData.get(_phoneNo),
        imageUrl: userData.get(_imageUrl),
      );

      await MySharedPreferences.setUser(
        key: MySharedPreferences.userData,
        person: person,
      );
    } on FirebaseAuthException catch (e) {
      throw e;
    } catch (e) {
      throw e;
    }
  }

//register new user
  Future<void> register({
    @required String? email,
    @required String? password,
    @required File? file,
    @required Person? person,
  }) async {
    try {
      final response = await _auth.createUserWithEmailAndPassword(
        email: email!,
        password: password!,
      );

      final folder = '$_usersCollection/${response.user!.uid}';

      final task = uploadPhoto(folder, file);

      final snapshot = await task!.whenComplete(() {});
      String photoUrl = await snapshot.ref.getDownloadURL();

      person = Person.user(
        email: person!.email,
        name: person.name,
        phoneNo: person.phoneNo,
        imageUrl: photoUrl,
        groups: [],
        createdAt: DateTime.now(),
      );

      uploadUserData(response, person);
    } on FirebaseException catch (e) {
      throw e;
    } catch (e) {
      throw e;
    }
  }

  //get a user
  Future<Person> findById(String id) async {
    Person? person;
    try {
      final user = await _db.collection(_usersCollection).doc(id).get();
      person = Person.user(
        email: user.get(_email),
        name: user.get(_name),
        phoneNo: user.get(_phoneNo),
        imageUrl: user.get(_imageUrl),
        groups: user.get(_groups),
        createdAt: user.get(_createdAt),
      );
    } on FirebaseException catch (e) {
      throw e;
    }

    return person;
  }

//Sign out current user
  Future<void> logout() async {
    if (_auth.currentUser != null) await _auth.signOut();
    await MySharedPreferences.clearPrefs();
    notifyListeners();
  }

  Future<void> notify() async {
    notifyListeners();
  }

//upload user profile photo
  UploadTask? uploadPhoto(String? destination, File? file) {
    try {
      task = _storage.ref(destination).putFile(file!);
      return task;
    } catch (e) {
      throw e;
    }
  }

//upload user details
  void uploadUserData(UserCredential response, Person person) async {
    try {
      await _db
          .collection(_usersCollection)
          .doc(response.user!.uid)
          .set(person.toJson());
    } on FirebaseException catch (e) {
      throw e;
    }
  }

  String? get getCurrentUserId {
    if (_auth.currentUser != null) {
      return _auth.currentUser!.uid;
    }
    return null;
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getUserData(
      String userId) async {
    final _docRef = _db.collection(_usersCollection).doc(userId);
    final _docSnapshot = _docRef.get();
    return _docSnapshot;
  }

  bool isMe(String? id) {
    if (_auth.currentUser != null && _auth.currentUser!.uid == id) {
      return true;
    }
    return false;
  }
}
