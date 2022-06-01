import 'package:dating_app/presentation/blocs/auth/auth_bloc.dart';
import 'package:dating_app/presentation/screens/login/login_screen.dart';
import 'package:dating_app/presentation/screens/onboarding/onboarding_screen.dart';
import 'package:dating_app/repositories/auth/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/models.dart';
import '../../blocs/blocs.dart';
import '../../widgets/widgets.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  static const String routeName = '/profile';

  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (context) {
          print(BlocProvider.of<AuthBloc>(context).state.status);
          return (BlocProvider.of<AuthBloc>(context).state.status ==
                  AuthStatus.unauthenticated)
              ? LoginScreen()
              : ProfileScreen();
        });
  }

  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'PROFILE'),
      body: SingleChildScrollView(
        child: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            if (state is ProfileLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is ProfileLoaded) {
              final User user = state.user;
              return Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  UserImage.medium(
                    url: user.imageUrls[0],
                    child: Container(
                      height: MediaQuery.of(context).size.height / 3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        gradient: LinearGradient(
                          colors: [
                            Colors.blueGrey.withOpacity(0.1),
                            Colors.blueGrey.withOpacity(0.9),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 50.0),
                          child: Text(
                            user.name,
                            style:
                                Theme.of(context).textTheme.headline3!.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TitleWithIcon(
                          title: 'Biography',
                          icon: Icons.edit,
                        ),
                        Text(
                          user.bio,
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    height: 1.5,
                                  ),
                        ),
                        const TitleWithIcon(
                          title: 'Pictures',
                          icon: Icons.edit,
                        ),
                        SizedBox(
                          height: 125,
                          child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: user.imageUrls.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(right: 5.0),
                                  child: UserImage.small(
                                    width: 100,
                                    url: user.imageUrls[index],
                                    border: Border.all(
                                      color: Colors.blueGrey,
                                    ),
                                  ),
                                );
                              }),
                        ),
                        const TitleWithIcon(
                          title: 'Location',
                          icon: Icons.edit,
                        ),
                        Text(
                          user.location,
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    height: 1.5,
                                  ),
                        ),
                        const TitleWithIcon(
                          title: 'Interests',
                          icon: Icons.edit,
                        ),
                        Row(
                          children: [
                            InterestPlate(text: user.interests[0]),
                          ],
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      RepositoryProvider.of<AuthRepository>(context).signOut();
                      Navigator.pushNamedAndRemoveUntil(context,
                          LoginScreen.routeName, ModalRoute.withName('/login'));
                    },
                    child: const Center(
                      child: Text('Sign out'),
                    ),
                  ),
                ],
              );
            } else {
              return const Text('Something went wrong.');
            }
          },
        ),
      ),
    );
  }
}
