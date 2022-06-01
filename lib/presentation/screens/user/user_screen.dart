import '../../widgets/interest_plate.dart';
import '../../widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../../../models/user_model.dart';

class UserScreen extends StatelessWidget {
  static const String routeName = '/user';

  static Route route({required User user}) {
    return MaterialPageRoute(
      builder: (_) => UserScreen(user: user),
      settings: RouteSettings(name: routeName),
    );
  }

  final User user;
  const UserScreen({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 2,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 40.0),
                    child: Hero(
                      tag: 'user_image',
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            image: DecorationImage(
                                image: NetworkImage(user.imageUrls[0]),
                                fit: BoxFit.cover)),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 60),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          ChoiceButton(
                            color: Colors.red,
                            icon: Icons.clear_rounded,
                          ),
                          ChoiceButton(
                            width: 80,
                            height: 80,
                            size: 30,
                            color: Colors.white,
                            hasGradient: true,
                            icon: Icons.favorite,
                          ),
                          ChoiceButton(
                            color: Colors.red,
                            icon: Icons.watch_later,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${user.name}, ${user.age}',
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Text(
                    '${user.jobTitle}',
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    'About',
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${user.bio}',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          height: 2,
                        ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Location',
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${user.location}',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          height: 2,
                        ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Interests',
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: user.interests
                        .map((interest) => InterestPlate(text: interest))
                        .toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
