import 'package:dating_app/presentation/widgets/user_image_small.dart';
import 'package:flutter/material.dart';

import '../../models/user_model.dart';
import 'widgets.dart';

class UserCard extends StatelessWidget {
  final User user;

  const UserCard({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'user_image',
      child: Padding(
        padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
        child: SizedBox(
          height: MediaQuery.of(context).size.height / 1.5,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              UserImage.large(
                height: MediaQuery.of(context).size.height / 1.5,
                // width: MediaQuery.of(context).size.width,
                url: user.imageUrls[0],
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 4,
                    blurRadius: 4,
                    offset: const Offset(3, 3),
                  )
                ],
              ),
              // Container(
              //   decoration: BoxDecoration(
              //     image: DecorationImage(
              //       fit: BoxFit.cover,
              //       image: NetworkImage(user.imageUrls[0]),
              //     ),
              //     borderRadius: BorderRadius.circular(5.0),
              //     boxShadow: [
              //       BoxShadow(
              //         color: Colors.grey.withOpacity(0.5),
              //         spreadRadius: 4,
              //         blurRadius: 4,
              //         offset: const Offset(3, 3),
              //       )
              //     ],
              //   ),
              // ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    gradient: const LinearGradient(
                      colors: [
                        Color.fromARGB(200, 0, 0, 0),
                        Color.fromARGB(0, 0, 0, 0),
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    )),
              ),
              Positioned(
                bottom: 30,
                left: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${user.name}, ${user.age}',
                      style: Theme.of(context).textTheme.headline5!.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Text(
                      '${user.jobTitle}',
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                    SizedBox(
                      height: 70,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: user.imageUrls.length,
                          itemBuilder: (context, index) {
                            return (index < user.imageUrls.length + 1)
                                ? UserImage.small(
                                    url: user.imageUrls[index],
                                    margin:
                                        const EdgeInsets.only(top: 8, right: 8),
                                  )
                                : Container(
                                    width: 35,
                                    height: 35,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                    ),
                                    child: const Icon(
                                      Icons.info_outline,
                                      size: 25,
                                    ),
                                  );
                          }),
                    )
                    // Row(
                    //   children: [
                    //     UserImage.small(
                    //       url: user.imageUrls[1],
                    //       margin: const EdgeInsets.only(top: 8, right: 8),
                    //     ),
                    //     UserImage.small(
                    //       url: user.imageUrls[2],
                    //       margin: const EdgeInsets.only(top: 8, right: 8),
                    //     ),
                    //     UserImage.small(
                    //       url: user.imageUrls[3],
                    //       margin: const EdgeInsets.only(top: 8, right: 8),
                    //     ),
                    //     const SizedBox(
                    //       width: 10,
                    //     ),
                    //     Container(
                    //       width: 35,
                    //       height: 35,
                    //       decoration: const BoxDecoration(
                    //         shape: BoxShape.circle,
                    //         color: Colors.white,
                    //       ),
                    //       child: const Icon(
                    //         Icons.info_outline,
                    //         size: 25,
                    //       ),
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
