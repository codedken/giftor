import 'package:giftor/models/participant.dart';

import '../my_packages/my_packages.dart';

import '../models/group/group.dart';
import '../models/person/person.dart';
import '../models/my_shared_preferences.dart';

import '../providers/auth_provider.dart';

class GroupProvider with ChangeNotifier {
  final _db = FirebaseFirestore.instance;
  String _usersCollection = 'users';
  String _groups = 'groups';
  String _members = 'members';
  AuthProvider? _authProvider;
  final _userData = MySharedPreferences.userData;
  List<Group> _allGroupsList = [];
  List<Group> filteredList = [];
  List<Participant> allParticipants = [];
  List<Participant> filteredParticipants = [];

  //create new group
  Future<void> createGroup(String? userId, Group group) async {
    try {
      await _db.collection(_groups).doc(group.id).set(group.toJson());
      await addMember(userId, group.id);
    } catch (e) {
      throw e;
    }
    notifyListeners();
  }

  //fetch group field
  Future<List<dynamic>> fetchGroupsField(String? userId) async {
    final _docRef = _db.collection(_usersCollection).doc(userId);
    final docSnapshot = await _docRef.get();
    return docSnapshot.get(_groups);
  }

  //fetch all user groups
  Future<void> fetchAllUserGroups(String? userId) async {
    List<dynamic> groupIds = await fetchGroupsField(userId);
    final staticGroupCollSnapshot = await _db.collection(_groups).get();
    List<Group> collGroup = [];
    if (!groupIds.isEmpty) {
      for (String groupId in groupIds) {
        final selectedGroup = staticGroupCollSnapshot.docs
            .firstWhere((group) => group.id == groupId);

        final userData = await _db
            .collection(_usersCollection)
            .doc(selectedGroup.get('creatorId'))
            .get();
        final name = userData.get('name');
        collGroup.insert(
          0,
          Group(
            id: selectedGroup.get('id'),
            title: selectedGroup.get('title'),
            creatorId: selectedGroup.get('creatorId'),
            creatorName: name,
            createdAt: DateTime.parse(selectedGroup.get('createdAt')),
            purpose: selectedGroup.get('purpose'),
          ),
        );
      }
    }
    _allGroupsList = collGroup;
    filteredList = _allGroupsList;
    notifyListeners();
  }

  List<Group> get allGroupsList {
    return [..._allGroupsList];
  }

  Future<bool> isMemberExists(String userId, String groupId) async {
    final membersColl =
        _db.collection(_groups).doc(groupId).collection(_members);
    final memberQueryColl = await membersColl.get();
    List<String> members = memberQueryColl.docs.map((e) => e.id).toList();
    if (members.contains(userId)) {
      return true;
    } else {
      return false;
    }
  }

  Future<Group> getGroup(String? groupId) async {
    final group = await _db.collection(_groups).doc(groupId).get();
    return Group(
      id: group.get('id'),
      creatorId: group.get('creatorId'),
      title: group.get('title'),
      creatorName: group.get('creatorName'),
      purpose: group.get('purpose'),
      createdAt: DateTime.parse(group.get('createdAt')),
    );
  }

  Future<void> addMember(String? userId, String? groupId) async {
    final membersColl =
        _db.collection(_groups).doc(groupId).collection(_members);

    try {
      if (MySharedPreferences.exists(_userData)) {
        Person person = MySharedPreferences.getUser(_userData);
        Person member = Person(
          id: userId,
          email: person.email,
          name: person.name,
          phoneNo: person.phoneNo,
          imageUrl: person.imageUrl,
          isSelected: false,
          selectedUserId: null,
        );

        await membersColl.doc(userId).set(member.toJson());
      }

      final result = await updateGroupList(userId, groupId);
      if (result != false) {
        final group = await getGroup(groupId);
        _allGroupsList.add(group);
        filteredList = _allGroupsList;
      } else {
        throw 'error';
      }
    } on FirebaseException catch (e) {
      throw e;
    } catch (e) {
      throw e;
    }
    notifyListeners();
  }

  //update groups
  Future<bool?> updateGroupList(String? userId, String? groupId) async {
    final _docRef = _db.collection(_usersCollection).doc(userId);
    final docSnapshot = await _docRef.get();
    List groups = docSnapshot.get(_groups);
    if (!groups.contains(groupId)) {
      _docRef.update({
        _groups: FieldValue.arrayUnion([groupId]),
      });
      return true;
    } else {
      return false;
    }
  }

  Future<bool> isGroupExists(String? groupId) async {
    QuerySnapshot querySnapshot = await _db.collection(_groups).get();
    List<String> docs = querySnapshot.docs.map((doc) => doc.id).toList();
    if (docs.contains(groupId)) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> fetchAllGroupMember(String? groupId) async {
    List<Participant> participant = [];
    final members =
        await _db.collection(_groups).doc(groupId).collection(_members).get();
    for (int i = 0; members.docs.length > i; i++) {
      if (members.docs[i].get('selectedUserId') != null) {
        final user = await _authProvider!
            .findById(members.docs[i].get('selectedUserId'));
        if (!participant.isEmpty &&
            participant[0].id! == _authProvider!.getCurrentUserId) {
          participant.insert(
              1,
              Participant(
                id: members.docs[i].get('id'),
                name: members.docs[i].get('name'),
                imgUrl: members.docs[i].get('imageUrl'),
                pickedUserImgUrl: user.imageUrl,
                pickedUserName: user.name,
              ));
        } else {
          participant.insert(
              0,
              Participant(
                id: members.docs[i].get('id'),
                name: members.docs[i].get('name'),
                imgUrl: members.docs[i].get('imageUrl'),
                pickedUserImgUrl: user.imageUrl,
                pickedUserName: user.name,
              ));
        }
      } else {
        if (!participant.isEmpty &&
            participant[0].id! == _authProvider!.getCurrentUserId) {
          participant.insert(
            1,
            Participant(
              id: members.docs[i].get('id'),
              name: members.docs[i].get('name'),
              imgUrl: members.docs[i].get('imageUrl'),
            ),
          );
        } else {
          participant.insert(
            0,
            Participant(
              id: members.docs[i].get('id'),
              name: members.docs[i].get('name'),
              imgUrl: members.docs[i].get('imageUrl'),
            ),
          );
        }
      }
    }
    allParticipants = participant;
    filteredParticipants = allParticipants;
    notifyListeners();
  }

  void setAuth(AuthProvider auth) {
    _authProvider = auth;
  }

  Future<List<PersonSelect>> getUnSelectedMembers(String? id) async {
    List<PersonSelect> persons = [];
    final members = await _db
        .collection(_groups)
        .doc(id)
        .collection(_members)
        .where(
          'isSelected',
          isEqualTo: false,
        )
        .where('email', isNotEqualTo: _authProvider!.getCurrentUserEmail)
        .get();

    for (int i = 0; i < members.docs.length; i++) {
      final person = PersonSelect(
        id: members.docs[i].get('id'),
        email: members.docs[i].get('email'),
        imageUrl: members.docs[i].get('imageUrl'),
        name: members.docs[i].get('name'),
      );
      persons.add(person);
    }
    return persons;
  }

  Future<String?> getSelectedId(String? groupId) async {
    final userData = await _db
        .collection(_groups)
        .doc(groupId)
        .collection(_members)
        .doc(_authProvider!.getCurrentUserId)
        .get();

    final selectedId = userData.get('selectedUserId');
    if (selectedId == null) {
      return null;
    } else {
      return selectedId;
    }
  }

  Future<void> updateAfterSelection({
    String? selectedId,
    String? groupId,
  }) async {
    final users = _db.collection(_groups).doc(groupId).collection(_members);
    await users.doc(_authProvider!.getCurrentUserId).update({
      'selectedUserId': selectedId,
    });

    await users.doc(selectedId).update({
      'isSelected': true,
    });
    await fetchAllGroupMember(groupId);
    notifyListeners();
  }

  Future<void> deleteGroup(Group group) async {
    final usersCol = _db.collection(_usersCollection);
    final groupCol = _db.collection(_groups);

    final userDocs = await usersCol.get();

    WriteBatch _batchWrite = _db.batch();

    userDocs.docs.forEach((doc) {
      List userGroups = doc.get(_groups);
      if (userGroups.contains(group.id)) {
        _batchWrite.update(doc.reference, {
          _groups: FieldValue.arrayRemove([group.id]),
        });
      }
    });
    await groupCol.doc(group.id).collection(_members).get().then(
          (value) => value.docs.forEach(
            (element) {
              _batchWrite.delete(element.reference);
            },
          ),
        );
    _batchWrite.delete(groupCol.doc(group.id));
    await _batchWrite.commit();
    _allGroupsList.remove(group);
    filteredList = _allGroupsList;
    notifyListeners();
  }

  Future<void> filterGroup(String value, String userId) async {
    if (!value.isEmpty) {
      filteredList = _allGroupsList
          .where(
            (group) => group.title!.toLowerCase().contains(
                  value.toLowerCase(),
                ),
          )
          .toList();
    } else {
      filteredList = _allGroupsList;
    }
    notifyListeners();
  }

  Future<void> filterParticipants(String value) async {
    if (!value.isEmpty) {
      filteredParticipants = allParticipants
          .where(
            (user) => user.name!.toLowerCase().contains(
                  value.toLowerCase(),
                ),
          )
          .toList();
    } else {
      filteredParticipants = allParticipants;
    }
    notifyListeners();
  }
}
