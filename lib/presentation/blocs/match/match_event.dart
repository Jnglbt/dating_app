part of 'match_bloc.dart';

abstract class MatchEvent extends Equatable {
  const MatchEvent();

  @override
  List<Object> get props => [];
}

class LoadMatch extends MatchEvent {
  final String userId;

  const LoadMatch({required this.userId});

  @override
  List<Object> get props => [userId];
}

class UpdateMatch extends MatchEvent {
  final List<UserMatch> matches;

  final List<User> users;

  // const UpdateMatch({required this.users});
  const UpdateMatch({required this.matches, required this.users});

  // @override
  // List<Object> get props => [users];
  @override
  List<Object> get props => [matches];
}

class CreateChat extends MatchEvent {
  final String userId;
  final String matchedUser;

  const CreateChat({required this.userId, required this.matchedUser});

  @override
  List<Object> get props => [userId, matchedUser];
}
