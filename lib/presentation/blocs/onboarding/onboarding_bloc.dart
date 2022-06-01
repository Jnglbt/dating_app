import 'package:bloc/bloc.dart';
import 'package:dating_app/repositories/database/database_repository.dart';
import 'package:dating_app/repositories/storage/storage_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

import '../../../models/models.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  final DatabaseRepositry _databaseRepositry;
  final StorageRepository _storageRepository;

  OnboardingBloc(
      {required DatabaseRepositry databaseRepositry,
      required StorageRepository storageRepository})
      : _databaseRepositry = databaseRepositry,
        _storageRepository = storageRepository,
        super(OnboardingLoading()) {
    on<StartOnboarding>((_onStartOnboarding));
    on<UpdateUser>((_onUpdateUser));
    on<UpdateUserImages>((_onUpdateUserImages));
  }

  void _onStartOnboarding(
      StartOnboarding event, Emitter<OnboardingState> emit) async {
    await _databaseRepositry.createUser(event.user);

    emit(
      OnboardingLoaded(user: event.user),
    );
  }

  void _onUpdateUser(UpdateUser event, Emitter<OnboardingState> emit) {
    if (state is OnboardingLoaded) {
      _databaseRepositry.updateUser(event.user);
      emit(OnboardingLoaded(user: event.user));
    }
  }

  void _onUpdateUserImages(
      UpdateUserImages event, Emitter<OnboardingState> emit) async {
    final state = this.state;
    if (state is OnboardingLoaded) {
      User user = state.user;

      await _storageRepository.uploadImage(user, event.image);

      _databaseRepositry.getUser(user.id!).listen((user) {
        add(UpdateUser(user: user));
      });
    }
  }
}
