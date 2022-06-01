import 'dart:async';

import 'package:dating_app/repositories/database/database_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/models.dart';
import '../blocs.dart';

part 'swipe_event.dart';
part 'swipe_state.dart';

class SwipeBloc extends Bloc<SwipeEvent, SwipeState> {
  final AuthBloc _authBloc;
  final DatabaseRepositry _databaseRepositry;
  StreamSubscription? _authSubscription;

  String? userId;

  SwipeBloc(
      {required AuthBloc authBloc,
      required DatabaseRepositry databaseRepositry})
      : _authBloc = authBloc,
        _databaseRepositry = databaseRepositry,
        super(SwipeLoading()) {
    on<LoadUser>(_onLoadUsers);

    on<SwipeLeft>(_onSwipeLeft);

    on<SwipeRight>(_onSwipeRight);

    on<UpdateHome>(_onUpdateHome);

    _authSubscription = _authBloc.stream.listen((state) {
      if (state.status == AuthStatus.authenticated) {
        userId = state.user!.uid;
        add(
          LoadUser(userId: userId!),
        );
      }
    });
  }

  void _onLoadUsers(LoadUser event, Emitter<SwipeState> emit) {
    _databaseRepositry.getUsers(event.userId, 'Male').listen((users) {
      // print('$users');
      add(UpdateHome(users: users));
    });
  }

  void _onSwipeLeft(SwipeLeft event, Emitter<SwipeState> emit) {
    if (state is SwipeLoaded) {
      final state = this.state as SwipeLoaded;
      print('UserId ' + userId.toString());
      _databaseRepositry.createMatch(userId!, event.user.id!);
      print('State users ' + state.users.toString());
      List<User> users = List.from(state.users)..remove(event.user);
      print(users);

      if (users.isNotEmpty) {
        emit(SwipeLoaded(users: users));
      } else {
        emit(SwipeError());
      }
    }
  }

  void _onSwipeRight(SwipeRight event, Emitter<SwipeState> emit) {
    if (state is SwipeLoaded) {
      final state = this.state as SwipeLoaded;
      List<User> users = List.from(state.users)..remove(event.user);

      if (users.isNotEmpty) {
        emit(SwipeLoaded(users: users));
      } else {
        emit(SwipeError());
      }
    }
  }

  void _onUpdateHome(UpdateHome event, Emitter<SwipeState> emit) {
    if (event.users != null) {
      emit(SwipeLoaded(users: event.users!));
    } else {
      emit(SwipeError());
    }
  }

  @override
  Future<void> close() async {
    _authSubscription?.cancel();
    super.close();
  }
}
