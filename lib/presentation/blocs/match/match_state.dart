part of 'match_bloc.dart';

abstract class MatchState extends Equatable {
  const MatchState();

  @override
  List<Object> get props => [];
}

class MatchLoading extends MatchState {}

class MatchLoaded extends MatchState {
  final List<UserMatch> matches;

  final List<User> users;

  // const MatchLoaded({required this.users});
  const MatchLoaded({required this.matches, required this.users});

  // @override
  // List<Object> get props => [users];
  @override
  List<Object> get props => [matches];
}

class ChatCreated extends MatchState {}

class Error extends MatchState {}
