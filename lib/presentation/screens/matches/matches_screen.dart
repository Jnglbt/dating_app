import 'package:dating_app/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/blocs.dart';
import '../../widgets/widgets.dart';

class MatchesScreen extends StatelessWidget {
  static const String routeName = '/matches';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => MatchesScreen(),
      settings: RouteSettings(name: routeName),
    );
  }

  const MatchesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final inactiveMatches = UserMatch.matches
    //     .where((match) => match.userId == 1 && match.chat!.isEmpty)
    //     .toList();
    // final activeMatches = UserMatch.matches
    //     .where((match) => match.userId == 1 && match.chat!.isNotEmpty)
    //     .toList();

    return Scaffold(
      appBar: const CustomAppBar(
        title: 'MATCHES',
      ),
      body: BlocBuilder<MatchBloc, MatchState>(
        builder: (context, state) {
          if (state is MatchLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is MatchLoaded) {
            // print('Matches ' + state.users.toString());
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Your Likes',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    SizedBox(
                      height: 100,
                      child: state.users.isNotEmpty
                          ? ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: state.users.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    (context.read<MatchBloc>()).add(
                                      CreateChat(
                                          userId: state.matches[index].userId,
                                          matchedUser:
                                              state.matches[index].matchedUser),
                                    );
                                  },
                                  child: Column(
                                    children: [
                                      UserImageSmall(
                                          imageUrl:
                                              state.users[index].imageUrls[0]),
                                      Text(
                                        state.users[index].name,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline4!
                                            .copyWith(
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                      // UserImageSmall(
                                      //     imageUrl: inactiveMatches[index]
                                      //         .matchedUser
                                      //         .imageUrls[0]),
                                      // Text(
                                      //   inactiveMatches[index].matchedUser.name,
                                      //   style: Theme.of(context)
                                      //       .textTheme
                                      //       .headline4!
                                      //       .copyWith(
                                      //         fontWeight: FontWeight.bold,
                                      //       ),
                                      // ),
                                    ],
                                  ),
                                );
                              })
                          : Center(child: Text('No likes')),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'Your Chats',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    // ListView.builder(
                    //     // physics: const NeverScrollableScrollPhysics(),
                    //     shrinkWrap: true,
                    //     itemCount: inactiveMatches.length,
                    //     itemBuilder: (context, index) {
                    //       return InkWell(
                    //         onTap: () {
                    //           Navigator.pushNamed(context, '/chat',
                    //               arguments: activeMatches[index]);
                    //         },
                    //         child: Row(
                    //           children: [
                    //             UserImageSmall(
                    //                 imageUrl: activeMatches[index]
                    //                     .matchedUser
                    //                     .imageUrls[0]),
                    //             Expanded(
                    //               child: Column(
                    //                 crossAxisAlignment:
                    //                     CrossAxisAlignment.start,
                    //                 children: [
                    //                   Text(
                    //                     activeMatches[index].matchedUser.name,
                    //                     style: Theme.of(context)
                    //                         .textTheme
                    //                         .headline4!
                    //                         .copyWith(
                    //                           fontWeight: FontWeight.bold,
                    //                         ),
                    //                   ),
                    //                   const SizedBox(
                    //                     height: 5,
                    //                   ),
                    //                   Text(
                    //                     activeMatches[index]
                    //                         .chat![0]
                    //                         .messages[0]
                    //                         .message,
                    //                     style: Theme.of(context)
                    //                         .textTheme
                    //                         .bodyText2,
                    //                   ),
                    //                   const SizedBox(
                    //                     height: 10,
                    //                   ),
                    //                   Text(
                    //                     activeMatches[index]
                    //                         .chat![0]
                    //                         .messages[0]
                    //                         .timeString,
                    //                     style: Theme.of(context)
                    //                         .textTheme
                    //                         .bodySmall,
                    //                   ),
                    //                 ],
                    //               ),
                    //             ),
                    //           ],
                    //         ),
                    //       );
                    //     }),
                  ],
                ),
              ),
            );
          } else {
            return const Text('Something went wrong.');
          }
          // return SingleChildScrollView(
          //   child: Padding(
          //     padding: const EdgeInsets.all(20.0),
          //     child: Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         Text(
          //           'Your Likes',
          //           style: Theme.of(context).textTheme.headline6,
          //         ),
          //         SizedBox(
          //           height: 100,
          //           child: ListView.builder(
          //               scrollDirection: Axis.horizontal,
          //               shrinkWrap: true,
          //               itemCount: inactiveMatches.length,
          //               itemBuilder: (context, index) {
          //                 return Column(
          //                   children: [
          //                     UserImageSmall(
          //                         imageUrl: inactiveMatches[index]
          //                             .matchedUser
          //                             .imageUrls[0]),
          //                     Text(
          //                       inactiveMatches[index].matchedUser.name,
          //                       style: Theme.of(context)
          //                           .textTheme
          //                           .headline4!
          //                           .copyWith(
          //                             fontWeight: FontWeight.bold,
          //                           ),
          //                     ),
          //                   ],
          //                 );
          //               }),
          //         ),
          //         const SizedBox(
          //           height: 10.0,
          //         ),
          //         Text(
          //           'Your Chats',
          //           style: Theme.of(context).textTheme.headline6,
          //         ),
          //         ListView.builder(
          //             // physics: const NeverScrollableScrollPhysics(),
          //             shrinkWrap: true,
          //             itemCount: inactiveMatches.length,
          //             itemBuilder: (context, index) {
          //               return InkWell(
          //                 onTap: () {
          //                   Navigator.pushNamed(context, '/chat',
          //                       arguments: activeMatches[index]);
          //                 },
          //                 child: Row(
          //                   children: [
          //                     UserImageSmall(
          //                         imageUrl: activeMatches[index]
          //                             .matchedUser
          //                             .imageUrls[0]),
          //                     Expanded(
          //                       child: Column(
          //                         crossAxisAlignment: CrossAxisAlignment.start,
          //                         children: [
          //                           Text(
          //                             activeMatches[index].matchedUser.name,
          //                             style: Theme.of(context)
          //                                 .textTheme
          //                                 .headline4!
          //                                 .copyWith(
          //                                   fontWeight: FontWeight.bold,
          //                                 ),
          //                           ),
          //                           const SizedBox(
          //                             height: 5,
          //                           ),
          //                           Text(
          //                             activeMatches[index]
          //                                 .chat![0]
          //                                 .messages[0]
          //                                 .message,
          //                             style:
          //                                 Theme.of(context).textTheme.bodyText2,
          //                           ),
          //                           const SizedBox(
          //                             height: 10,
          //                           ),
          //                           Text(
          //                             activeMatches[index]
          //                                 .chat![0]
          //                                 .messages[0]
          //                                 .timeString,
          //                             style:
          //                                 Theme.of(context).textTheme.bodySmall,
          //                           ),
          //                         ],
          //                       ),
          //                     ),
          //                   ],
          //                 ),
          //               );
          //             }),
          //       ],
          //     ),
          //   ),
          // );
        },
      ),
    );
  }
}
