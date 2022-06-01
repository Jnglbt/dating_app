import 'package:dating_app/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

import '../../../models/models.dart';

class ChatScreen extends StatelessWidget {
  static const String routeName = '/chat';

  static Route route({required UserMatch userMatch}) {
    return MaterialPageRoute(
      builder: (_) => ChatScreen(userMatch: userMatch),
      settings: RouteSettings(name: routeName),
    );
  }

  final UserMatch userMatch;

  const ChatScreen({Key? key, required this.userMatch}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: (Colors.grey[100])!,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.blueGrey,
        ),
        title: Column(
          children: [
            CircleAvatar(
              radius: 15,
              // backgroundImage: NetworkImage(userMatch.matchedUser.imageUrls[0]),
              backgroundImage: NetworkImage(
                  'https://images.unsplash.com/photo-1653338769272-20a354a2721f?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687'),
            ),
            Text(
              // userMatch.matchedUser.name,
              'test',
              style: Theme.of(context).textTheme.headline4!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            )
          ],
        ),
      ),
      // body: Column(
      //   children: [
      //     Expanded(
      //       child: SingleChildScrollView(
      //         child: userMatch.chat != null
      //             ? ListView.builder(
      //                 shrinkWrap: true,
      //                 itemCount: userMatch.chat![0].messages.length,
      //                 itemBuilder: (context, index) {
      //                   return ListTile(
      //                     title: userMatch.chat![0].messages[index].senderId ==
      //                             1
      //                         ? Align(
      //                             alignment: Alignment.topRight,
      //                             child: Container(
      //                               padding: const EdgeInsets.all(8.0),
      //                               decoration: BoxDecoration(
      //                                   borderRadius: const BorderRadius.all(
      //                                     Radius.circular(8.0),
      //                                   ),
      //                                   color: Colors.grey[100]),
      //                               child: Text(
      //                                 // userMatch
      //                                 //     .chat![0].messages[index].message,
      //                                 style: Theme.of(context)
      //                                     .textTheme
      //                                     .headline4!
      //                                     .copyWith(
      //                                       fontWeight: FontWeight.normal,
      //                                     ),
      //                               ),
      //                             ),
      //                           )
      //                         : Align(
      //                             alignment: Alignment.topLeft,
      //                             child: Row(
      //                               children: [
      //                                 CircleAvatar(
      //                                   radius: 15,
      //                                   // backgroundImage: NetworkImage(
      //                                   //     userMatch.matchedUser.imageUrls[0]),
      //                                   backgroundImage: NetworkImage(
      //                                       'https://images.unsplash.com/photo-1653338769272-20a354a2721f?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687'),
      //                                 ),
      //                                 const SizedBox(
      //                                   width: 10.0,
      //                                 ),
      //                                 Container(
      //                                   padding: const EdgeInsets.all(8.0),
      //                                   decoration: const BoxDecoration(
      //                                       borderRadius: BorderRadius.all(
      //                                         Radius.circular(8.0),
      //                                       ),
      //                                       color: Colors.blueGrey),
      //                                   child: Text(
      //                                     userMatch
      //                                         .chat![0].messages[index].message,
      //                                     style: Theme.of(context)
      //                                         .textTheme
      //                                         .headline4!
      //                                         .copyWith(
      //                                           fontWeight: FontWeight.normal,
      //                                         ),
      //                                   ),
      //                                 ),
      //                               ],
      //                             ),
      //                           ),
      //                   );
      //                 },
      //               )
      //             : Container(),
      //       ),
      //     ),
      //     Container(
      //       padding: const EdgeInsets.all(20.0),
      //       height: 100,
      //       child: Row(
      //         children: [
      //           Container(
      //             decoration: const BoxDecoration(
      //               shape: BoxShape.circle,
      //               color: Colors.blueGrey,
      //             ),
      //             child: IconButton(
      //               onPressed: () {},
      //               icon: const Icon(Icons.send_outlined),
      //             ),
      //           ),
      //           const Expanded(
      //             child: TextField(
      //               decoration: InputDecoration(
      //                 filled: true,
      //                 fillColor: Colors.white,
      //                 hintText: 'Type here...',
      //                 contentPadding: EdgeInsets.only(left: 20.0, bottom: 5.0),
      //                 focusedBorder: OutlineInputBorder(
      //                   borderSide: BorderSide(
      //                     color: Colors.white,
      //                   ),
      //                 ),
      //                 enabledBorder: UnderlineInputBorder(
      //                   borderSide: BorderSide(
      //                     color: Colors.white,
      //                   ),
      //                 ),
      //               ),
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //   ],
      // ),
      body: Container(),
    );
  }
}
