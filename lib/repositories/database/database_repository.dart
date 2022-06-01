import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dating_app/models/models.dart';
import 'package:dating_app/repositories/database/base_database_repository.dart';
import 'package:dating_app/repositories/storage/storage_repository.dart';

class DatabaseRepositry extends BaseDatabaseRepository {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  @override
  Stream<User> getUser(String userId) {
    return _firebaseFirestore
        .collection('users')
        .doc(userId)
        .snapshots()
        .map((snap) => User.fromSnapshot(snap));
  }

  @override
  Stream<List<User>> getUsers(String userId, String gender) {
    return _firebaseFirestore
        .collection('users')
        .where('gender', isNotEqualTo: gender)
        .snapshots()
        .map((snap) {
      return snap.docs.map((doc) => User.fromSnapshot(doc)).toList();
    });
  }

  @override
  Future<void> updateUserPictures(User user, String image) async {
    String downloadUrl = await StorageRepository().getDownloadUrl(user, image);

    return _firebaseFirestore.collection('users').doc(user.id).update({
      'imageUrls': FieldValue.arrayUnion([downloadUrl]),
    });
  }

  @override
  Future<void> createUser(User user) async {
    await _firebaseFirestore.collection('users').doc(user.id).set(user.toMap());
  }

  @override
  Future<void> updateUser(User user) {
    return _firebaseFirestore
        .collection('users')
        .doc(user.id)
        .update(user.toMap())
        .then((value) => print('User document updated.'));
  }

  @override
  Future<void> createMatch(String userId, String matchedUser) {
    return _firebaseFirestore.collection('matches').doc().set({
      'userId': userId,
      'matchedUser': matchedUser,
    });
  }

  @override
  Stream<User> getMatchedUser(String matchedUser) {
    return _firebaseFirestore
        .collection('users')
        .doc(matchedUser)
        .snapshots()
        .map((snap) => User.fromSnapshot(snap));
  }

  @override
  Stream<List<UserMatch>> getMatches(String userId) {
    print(userId);
    return _firebaseFirestore
        .collection('matches')
        .where('userId', isEqualTo: userId)
        .snapshots()
        .map((snap) {
      return snap.docs.map((doc) => UserMatch.fromSnapshot(doc)).toList();
    });
  }

  @override
  Future<void> createChat(String userId, String matchedUser) {
    print('UserId ' + userId);
    print('MatchedUser ' + matchedUser);
    return _firebaseFirestore.collection('chats').doc().set({
      'userId': userId,
      'matchedUser': matchedUser,
    });
    // return _firebaseFirestore
    //     .collection('chats')
    //     .where('userId', isEqualTo: userId)
    //     .where('matchedUser', isEqualTo: matchedUser)
    //     .get()
    //     .then((value) => print(value),
    //         onError: (e) => _firebaseFirestore.collection('chats').doc().set({
    //               'userId': userId,
    //               'matchedUser': matchedUser,
    //             }));
  }
}
