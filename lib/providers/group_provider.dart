import '../my_packages/my_packages.dart';

import '../models/group/group.dart';
import '../models/person/person.dart';
import '../models/my_shared_preferences.dart';

class GroupProvider with ChangeNotifier {
  final _db = FirebaseFirestore.instance;
  String _usersCollection = 'users';
  String _groups = 'groups';
  String _members = 'members';
  final _userData = MySharedPreferences.userData;
  List<Group> _allGroupsList = [];

  //create new group
  Future<void> createGroup(String? userId, Group group) async {
    try {
      String _id = nanoid(6);
      await _db.collection(_groups).doc(_id).set(group.toJson());
      await addMember(userId, _id);
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
    for (String groupId in groupIds) {
      final selectedGroup = staticGroupCollSnapshot.docs
          .firstWhere((group) => group.id == groupId);

      final userData = await _db
          .collection(_usersCollection)
          .doc(selectedGroup.get('creatorId'))
          .get();
      final name = userData.get('name');
      collGroup.add(Group(
        title: selectedGroup.get('title'),
        creatorId: selectedGroup.get('creatorId'),
        creatorName: name,
        createdAt: DateTime.parse(selectedGroup.get('createdAt')),
        purpose: selectedGroup.get('purpose'),
      ));
    }
    _allGroupsList = collGroup;
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

  Future<Group> getGroup(String groupId) async {
    final group = await _db.collection(_groups).doc(groupId).get();
    return Group(
      creatorId: group.get('creatorId'),
      title: group.get('title'),
      creatorName: group.get('creatorName'),
      purpose: group.get('purpose'),
      createdAt: DateTime.parse(group.get('createdAt')),
    );
  }

  Future<void> addMember(String? userId, String groupId) async {
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
    print(docs);
    print(groupId);
    if (docs.contains(groupId)) {
      return true;
    } else {
      return false;
    }
  }
}
