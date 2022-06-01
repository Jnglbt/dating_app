import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../repositories/repositories.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final bool hasAction;

  const CustomAppBar({
    Key? key,
    required this.title,
    this.hasAction = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Row(
        children: [
          Expanded(
            child: SvgPicture.asset(
              'assets/images/logo.svg',
              height: 50,
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              title,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
        ],
      ),
      actions: hasAction
          ? [
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/matches');
                },
                icon: const Icon(
                  Icons.message,
                  color: Colors.blueGrey,
                ),
              ),
              IconButton(
                onPressed: () {
                  // RepositoryProvider.of<AuthRepository>(context).signOut();
                  Navigator.pushNamed(context, '/profile');
                },
                icon: const Icon(
                  Icons.person,
                  color: Colors.blueGrey,
                ),
              ),
            ]
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
