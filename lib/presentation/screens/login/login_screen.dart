import 'package:dating_app/presentation/widgets/custom_app_bar.dart';
import 'package:dating_app/repositories/database/database_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../repositories/repositories.dart';
import '../../blocs/cubits.dart';
import '../screens.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = '/login';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (context) => LoginScreen(),
    );
  }

  const LoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'ARROW',
        hasAction: false,
      ),
      body: BlocBuilder<SigninCubit, SigninState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Email',
                        contentPadding: EdgeInsets.only(bottom: 5.0, top: 12.5),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),

                        // enabledBorder: UnderlineInputBorder(
                        //   borderSide: BorderSide(
                        //     color: Colors.white,
                        //   ),
                        // ),
                      ),
                      onChanged: (value) {
                        context.read<SigninCubit>().emailChanged(value);
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Password',
                        contentPadding: EdgeInsets.only(bottom: 5.0, top: 12.5),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        // enabledBorder: UnderlineInputBorder(
                        //   borderSide: BorderSide(
                        //     color: Colors.white,
                        //   ),
                        // ),
                      ),
                      onChanged: (value) {
                        context.read<SigninCubit>().passwordChanged(value);
                      },
                    ),
                    Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        DecoratedBox(
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.blueGrey,
                              ),
                              borderRadius: BorderRadius.circular(5.0),
                              color: Colors.white),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              primary: Colors.transparent,
                            ),
                            onPressed: () async {
                              await context
                                  .read<SigninCubit>()
                                  .signinWithCredentials();

                              Navigator.pushNamedAndRemoveUntil(
                                context,
                                HomeScreen.routeName,
                                ModalRoute.withName('/home'),
                              );
                            },
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Text(
                                'LOGIN',
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        DecoratedBox(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.blueGrey,
                            ),
                            borderRadius: BorderRadius.circular(5.0),
                            gradient: const LinearGradient(colors: [
                              Colors.red,
                              Colors.blueGrey,
                            ]),
                          ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              primary: Colors.transparent,
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, '/onboarding');
                            },
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Text(
                                'SIGN UP',
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                            ),
                          ),
                        ),
                        // TextButton(
                        //   onPressed: () {
                        //     RepositoryProvider.of<AuthRepository>(context)
                        //         .signOut();
                        //   },
                        //   child: Text('Logout'),
                        // ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
