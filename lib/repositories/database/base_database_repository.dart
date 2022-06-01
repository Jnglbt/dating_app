import '../../models/models.dart';

abstract class BaseDatabaseRepository {
  Stream<User> getUser(String userId);
  Stream<List<User>> getUsers(String userId, String gender);
  Future<void> createUser(User user);
  Future<void> updateUser(User user);
  Future<void> updateUserPictures(User user, String image);
  Future<void> createMatch(String userId, String matchedUser);
  Stream<User> getMatchedUser(String matchedUser);
  // List<User> getMatches(String userId);
  Stream<List<UserMatch>> getMatches(String userId);

  Future<void> createChat(String userId, String matchedUser);
}
