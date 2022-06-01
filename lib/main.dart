import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'config/app_router.dart';
import 'config/app_theme.dart';
import 'models/models.dart';
import 'presentation/blocs/cubits.dart';
import 'presentation/screens/screens.dart';
import 'presentation/blocs/blocs.dart';
import 'repositories/repositories.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => AuthRepository()),
        RepositoryProvider(create: (context) => DatabaseRepositry()),
        RepositoryProvider(create: (context) => StorageRepository()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthBloc(
              authRepository: context.read<AuthRepository>(),
            ),
          ),
          BlocProvider(
            create: (context) => SwipeBloc(
              authBloc: context.read<AuthBloc>(),
              databaseRepositry: context.read<DatabaseRepositry>(),
            ),
          ),
          BlocProvider<SignupCubit>(
            create: (context) => SignupCubit(
              authRepository: context.read<AuthRepository>(),
            ),
          ),
          BlocProvider<SigninCubit>(
            create: (context) => SigninCubit(
              authRepository: context.read<AuthRepository>(),
            ),
          ),
          BlocProvider<OnboardingBloc>(
            create: (context) => OnboardingBloc(
              databaseRepositry: context.read<DatabaseRepositry>(),
              storageRepository: context.read<StorageRepository>(),
            ),
          ),
          BlocProvider<MatchBloc>(
            create: (context) => MatchBloc(
              authBloc: context.read<AuthBloc>(),
              databaseRepositry: context.read<DatabaseRepositry>(),
            )..add(
                LoadMatch(userId: context.read<AuthBloc>().state.user!.uid),
              ),
          ),
          BlocProvider<ProfileBloc>(
            create: (context) => ProfileBloc(
              databaseRepositry: context.read<DatabaseRepositry>(),
              authBloc: context.read<AuthBloc>(),
            )..add(
                LoadProfile(userId: context.read<AuthBloc>().state.user!.uid),
              ),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: AppTheme.lightTheme,
          onGenerateRoute: AppRouter.onGenerateRoute,
          initialRoute: SplashScreen.routeName,
          // initialRoute: LoginScreen.routeName,
          // home: UserProfileScreen(),
        ),
      ),
    );
  }
}
