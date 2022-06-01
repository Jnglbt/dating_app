import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

import 'models.dart';

class Chat extends Equatable {
  final String? id;
  final String userId;
  final String matchedUser;
  // final List<Message> messages;

  const Chat({
    this.id,
    required this.userId,
    required this.matchedUser,
    // required this.messages,
  });

  @override
  List<Object?> get props => [
        id,
        userId,
        matchedUser,
      ];

  factory Chat.fromSnapshot(DocumentSnapshot snap) {
    return Chat(
      id: snap.id,
      userId: snap['userId'],
      matchedUser: snap['matchedUser'],
      // chat: snap['chat'],
    );
  }

  // static List<Chat> chats = [
  //   Chat(
  //     id: 1,
  //     userId: 1,
  //     matchedUserId: 2,
  //     messages: Message.messages
  //         .where((message) =>
  //             (message.senderId == 1 && message.receiverId == 2) ||
  //             (message.senderId == 2 && message.receiverId == 1))
  //         .toList(),
  //   ),
  //   Chat(
  //     id: 2,
  //     userId: 1,
  //     matchedUserId: 3,
  //     messages: Message.messages
  //         .where((message) =>
  //             (message.senderId == 1 && message.receiverId == 3) ||
  //             (message.senderId == 3 && message.receiverId == 1))
  //         .toList(),
  //   ),
  //   Chat(
  //     id: 3,
  //     userId: 1,
  //     matchedUserId: 5,
  //     messages: Message.messages
  //         .where((message) =>
  //             (message.senderId == 1 && message.receiverId == 5) ||
  //             (message.senderId == 5 && message.receiverId == 1))
  //         .toList(),
  //   ),
  //   Chat(
  //     id: 4,
  //     userId: 1,
  //     matchedUserId: 6,
  //     messages: Message.messages
  //         .where((message) =>
  //             (message.senderId == 1 && message.receiverId == 6) ||
  //             (message.senderId == 6 && message.receiverId == 1))
  //         .toList(),
  //   ),
  // ];
}
