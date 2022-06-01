import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/models.dart';
import '../../blocs/swipe/swipe_bloc.dart';
import '../../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => HomeScreen(),
      settings: RouteSettings(name: routeName),
    );
  }

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'DISCOVER',
      ),
      body: BlocBuilder<SwipeBloc, SwipeState>(
        builder: (context, state) {
          if (state is SwipeLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is SwipeLoaded) {
            var userCount = state.users.length;

            return Column(
              children: [
                InkWell(
                  onDoubleTap: () {
                    Navigator.pushNamed(context, '/user',
                        arguments: state.users[0]);
                  },
                  child: Draggable<User>(
                    axis: Axis.horizontal,
                    data: state.users[0],
                    feedback: UserCard(user: state.users[0]),
                    childWhenDragging: (userCount > 1)
                        ? UserCard(user: state.users[1])
                        : Container(),
                    onDragEnd: (drag) {
                      if (drag.velocity.pixelsPerSecond.dx < 0) {
                        (context.read<SwipeBloc>()).add(
                          SwipeLeft(user: state.users[0]),
                        );
                        print('Swiped left');
                      } else {
                        (context.read<SwipeBloc>()).add(
                          SwipeRight(user: state.users[0]),
                        );
                        print('Swiped right');
                      }
                    },
                    child: UserCard(user: state.users[0]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 60,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          (context.read<SwipeBloc>()).add(
                            SwipeLeft(user: state.users[0]),
                          );
                        },
                        child: const ChoiceButton(
                          width: 60,
                          height: 60,
                          size: 25,
                          color: Colors.red,
                          icon: Icons.clear_rounded,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          (context.read<SwipeBloc>()).add(
                            SwipeRight(user: state.users[0]),
                          );
                        },
                        child: const ChoiceButton(
                          width: 80,
                          height: 80,
                          size: 30,
                          color: Colors.white,
                          hasGradient: true,
                          icon: Icons.favorite,
                        ),
                      ),
                      const ChoiceButton(
                        width: 60,
                        height: 60,
                        size: 25,
                        color: Colors.red,
                        icon: Icons.watch_later,
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
          if (state is SwipeError) {
            print(state);
            return Center(
              child: Text(
                'There aren\'t any more users.',
                style: Theme.of(context).textTheme.headline4!.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                    ),
              ),
            );
          } else {
            return const Text('Something went wrong.');
          }
        },
      ),
    );
  }
}
