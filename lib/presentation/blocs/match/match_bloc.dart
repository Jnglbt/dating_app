import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../models/models.dart';
import '../../../repositories/repositories.dart';
import '../blocs.dart';

part 'match_event.dart';
part 'match_state.dart';

class MatchBloc extends Bloc<MatchEvent, MatchState> {
  final AuthBloc _authBloc;
  final DatabaseRepositry _databaseRepositry;
  StreamSubscription? _authSubscription;

  MatchBloc(
      {required AuthBloc authBloc,
      required DatabaseRepositry databaseRepositry})
      : _authBloc = authBloc,
        _databaseRepositry = databaseRepositry,
        super(MatchLoading()) {
    on<LoadMatch>(_onLoadMatches);
    on<UpdateMatch>(_onUpdateMatch);
    on<CreateChat>(_onCreateChat);

    _authSubscription = _authBloc.stream.listen((state) {
      print('Match bloc ' + state.toString());
      if (state.user != null) {
        print(state.user!.uid);
        add(
          LoadMatch(userId: state.user!.uid),
        );
      }
    });
  }

  void _onLoadMatches(LoadMatch event, Emitter<MatchState> emit) {
    // List<dynamic> likes = _databaseRepositry.getLikes(event.userId);
    print('Load matches');
    List<User> matchedUsers = [];
    // List<User> users = _databaseRepositry.getMatches(event.userId);
    // print(_databaseRepositry.getMatches(event.userId));
    // add(UpdateMatch(users: users));
    _databaseRepositry.getMatches(event.userId).listen((matches) {
      print('$matches');
      for (var match in matches) {
        _databaseRepositry
            .getMatchedUser(match.matchedUser)
            .listen((matchedUser) {
          matchedUsers.add(matchedUser);
        });
      }

      add(UpdateMatch(matches: matches, users: matchedUsers));
    });
  }

  void _onUpdateMatch(UpdateMatch event, Emitter<MatchState> emit) {
    emit(MatchLoaded(matches: event.matches, users: event.users));
    // emit(MatchLoaded(users: event.users));
  }

  void _onCreateChat(CreateChat event, Emitter<MatchState> emit) {
    print('Create chat');
    _databaseRepositry.createChat(event.userId, event.matchedUser);
  }

  @override
  Future<void> close() async {
    _authSubscription?.cancel();
    super.close();
  }
}
