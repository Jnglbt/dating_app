import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String? id;
  final String name;
  final int age;
  final String gender;
  final List<dynamic> imageUrls;
  final List<dynamic> interests;
  final String bio;
  final String jobTitle;
  final String location;

  const User({
    required this.id,
    required this.name,
    required this.age,
    required this.gender,
    required this.imageUrls,
    required this.interests,
    required this.bio,
    required this.jobTitle,
    required this.location,
  });

  @override
  List<Object?> get props =>
      [id, name, age, gender, imageUrls, bio, jobTitle, location];

  factory User.fromSnapshot(DocumentSnapshot snap) {
    return User(
      id: snap.id,
      name: snap['name'],
      age: snap['age'],
      gender: snap['gender'],
      imageUrls: snap['imageUrls'],
      interests: snap['interests'],
      bio: snap['bio'],
      jobTitle: snap['jobTitle'],
      location: snap['location'],
    );

    // return user;
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'age': age,
      'gender': gender,
      'imageUrls': imageUrls,
      'interests': interests,
      'bio': bio,
      'jobTitle': jobTitle,
      'location': location,
    };
  }

  User copyWith({
    String? id,
    String? name,
    int? age,
    String? gender,
    List<dynamic>? imageUrls,
    List<dynamic>? interests,
    String? bio,
    String? jobTitle,
    String? location,
  }) {
    return User(
        id: id ?? this.id,
        name: name ?? this.name,
        age: age ?? this.age,
        gender: gender ?? this.gender,
        imageUrls: imageUrls ?? this.imageUrls,
        interests: interests ?? this.interests,
        bio: bio ?? this.bio,
        jobTitle: jobTitle ?? this.jobTitle,
        location: location ?? this.location);
  }

  static List<User> users = [
    const User(
      id: '1',
      name: 'John',
      age: 25,
      gender: 'Male',
      imageUrls: [
        'https://images.unsplash.com/photo-1653338769272-20a354a2721f?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687',
        'https://images.unsplash.com/photo-1653338507618-abca3334676d?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687',
        'https://images.unsplash.com/photo-1653338769211-1f83f15a73d6?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687',
        'https://images.unsplash.com/photo-1649458223566-3aa999113216?ixlib=rb-1.2.1&raw_url=true&q=80&fm=jpg&crop=entropy&cs=tinysrgb&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687',
      ],
      interests: ['Music', 'Politics', 'Hiking'],
      bio:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus interdum posuere lorem at elementum. Donec lacinia aliquet eleifend. Donec fringilla eleifend pellentesque. Nunc euismod diam vitae ipsum interdum tempus. Proin pharetra purus nec nunc pulvinar, sed facilisis mauris venenatis. Donec et cursus nunc, pharetra dapibus lacus. Aliquam at faucibus tortor. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae;',
      jobTitle: 'Job Title Here',
      location: 'Milan',
    ),
    const User(
      id: '2',
      name: 'Test2',
      age: 25,
      gender: 'Female',
      imageUrls: [
        'https://images.unsplash.com/photo-1626781236781-d25e17759caf?ixlib=rb-1.2.1&raw_url=true&q=80&fm=jpg&crop=entropy&cs=tinysrgb&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687',
        'https://images.unsplash.com/photo-1653338507618-abca3334676d?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687',
        'https://images.unsplash.com/photo-1653338769211-1f83f15a73d6?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687',
        'https://images.unsplash.com/photo-1649458223566-3aa999113216?ixlib=rb-1.2.1&raw_url=true&q=80&fm=jpg&crop=entropy&cs=tinysrgb&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687',
      ],
      interests: ['Music', 'Politics', 'Hiking'],
      bio:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus interdum posuere lorem at elementum. Donec lacinia aliquet eleifend. Donec fringilla eleifend pellentesque. Nunc euismod diam vitae ipsum interdum tempus. Proin pharetra purus nec nunc pulvinar, sed facilisis mauris venenatis. Donec et cursus nunc, pharetra dapibus lacus. Aliquam at faucibus tortor. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae;',
      jobTitle: 'Job Title Here',
      location: 'Milan',
    ),
    const User(
      id: '3',
      name: 'Test3',
      age: 25,
      gender: 'Female',
      imageUrls: [
        'https://images.unsplash.com/photo-1636308600707-e19abecd6246?ixlib=rb-1.2.1&raw_url=true&q=80&fm=jpg&crop=entropy&cs=tinysrgb&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687',
        'https://images.unsplash.com/photo-1653338507618-abca3334676d?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687',
        'https://images.unsplash.com/photo-1653338769211-1f83f15a73d6?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687',
        'https://images.unsplash.com/photo-1649458223566-3aa999113216?ixlib=rb-1.2.1&raw_url=true&q=80&fm=jpg&crop=entropy&cs=tinysrgb&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687',
      ],
      interests: ['Music', 'Politics', 'Hiking'],
      bio:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus interdum posuere lorem at elementum. Donec lacinia aliquet eleifend. Donec fringilla eleifend pellentesque. Nunc euismod diam vitae ipsum interdum tempus. Proin pharetra purus nec nunc pulvinar, sed facilisis mauris venenatis. Donec et cursus nunc, pharetra dapibus lacus. Aliquam at faucibus tortor. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae;',
      jobTitle: 'Job Title Here',
      location: 'Milan',
    ),
    const User(
      id: '4',
      name: 'Test4',
      age: 25,
      gender: 'Female',
      imageUrls: [
        'https://images.unsplash.com/photo-1647529077611-cfed43c1ca12?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=715',
        'https://images.unsplash.com/photo-1653338507618-abca3334676d?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687',
        'https://images.unsplash.com/photo-1653338769211-1f83f15a73d6?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687',
        'https://images.unsplash.com/photo-1649458223566-3aa999113216?ixlib=rb-1.2.1&raw_url=true&q=80&fm=jpg&crop=entropy&cs=tinysrgb&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687',
      ],
      interests: ['Music', 'Politics', 'Hiking'],
      bio:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus interdum posuere lorem at elementum. Donec lacinia aliquet eleifend. Donec fringilla eleifend pellentesque. Nunc euismod diam vitae ipsum interdum tempus. Proin pharetra purus nec nunc pulvinar, sed facilisis mauris venenatis. Donec et cursus nunc, pharetra dapibus lacus. Aliquam at faucibus tortor. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae;',
      jobTitle: 'Job Title Here',
      location: 'Milan',
    ),
    const User(
      id: '5',
      name: 'Test5',
      age: 25,
      gender: 'Female',
      imageUrls: [
        'https://images.unsplash.com/photo-1642303894914-adf2d2630f20?ixlib=rb-1.2.1&raw_url=true&q=80&fm=jpg&crop=entropy&cs=tinysrgb&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=715',
        'https://images.unsplash.com/photo-1653338507618-abca3334676d?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687',
        'https://images.unsplash.com/photo-1653338769211-1f83f15a73d6?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687',
        'https://images.unsplash.com/photo-1649458223566-3aa999113216?ixlib=rb-1.2.1&raw_url=true&q=80&fm=jpg&crop=entropy&cs=tinysrgb&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687',
      ],
      interests: ['Music', 'Politics', 'Hiking'],
      bio:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus interdum posuere lorem at elementum. Donec lacinia aliquet eleifend. Donec fringilla eleifend pellentesque. Nunc euismod diam vitae ipsum interdum tempus. Proin pharetra purus nec nunc pulvinar, sed facilisis mauris venenatis. Donec et cursus nunc, pharetra dapibus lacus. Aliquam at faucibus tortor. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae;',
      jobTitle: 'Job Title Here',
      location: 'Milan',
    ),
    const User(
      id: '6',
      name: 'Test6',
      age: 25,
      gender: 'Female',
      imageUrls: [
        'https://images.unsplash.com/photo-1645037087033-a1c0b28e0f6a?ixlib=rb-1.2.1&raw_url=true&q=80&fm=jpg&crop=entropy&cs=tinysrgb&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=715',
        'https://images.unsplash.com/photo-1653338507618-abca3334676d?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687',
        'https://images.unsplash.com/photo-1653338769211-1f83f15a73d6?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687',
        'https://images.unsplash.com/photo-1649458223566-3aa999113216?ixlib=rb-1.2.1&raw_url=true&q=80&fm=jpg&crop=entropy&cs=tinysrgb&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687',
      ],
      interests: ['Music', 'Politics', 'Hiking'],
      bio:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus interdum posuere lorem at elementum. Donec lacinia aliquet eleifend. Donec fringilla eleifend pellentesque. Nunc euismod diam vitae ipsum interdum tempus. Proin pharetra purus nec nunc pulvinar, sed facilisis mauris venenatis. Donec et cursus nunc, pharetra dapibus lacus. Aliquam at faucibus tortor. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae;',
      jobTitle: 'Job Title Here',
      location: 'Milan',
    ),
    const User(
      id: '7',
      name: 'Test7',
      age: 25,
      gender: 'Female',
      imageUrls: [
        'https://images.unsplash.com/photo-1635713150362-ed0cd425e697?ixlib=rb-1.2.1&raw_url=true&q=80&fm=jpg&crop=entropy&cs=tinysrgb&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=715',
        'https://images.unsplash.com/photo-1653338507618-abca3334676d?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687',
        'https://images.unsplash.com/photo-1653338769211-1f83f15a73d6?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687',
        'https://images.unsplash.com/photo-1649458223566-3aa999113216?ixlib=rb-1.2.1&raw_url=true&q=80&fm=jpg&crop=entropy&cs=tinysrgb&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687',
      ],
      interests: ['Music', 'Politics', 'Hiking'],
      bio:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus interdum posuere lorem at elementum. Donec lacinia aliquet eleifend. Donec fringilla eleifend pellentesque. Nunc euismod diam vitae ipsum interdum tempus. Proin pharetra purus nec nunc pulvinar, sed facilisis mauris venenatis. Donec et cursus nunc, pharetra dapibus lacus. Aliquam at faucibus tortor. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae;',
      jobTitle: 'Job Title Here',
      location: 'Milan',
    ),
    const User(
      id: '8',
      name: 'Test8',
      age: 25,
      gender: 'Female',
      imageUrls: [
        'https://images.unsplash.com/photo-1626154655746-15094e79e03e?ixlib=rb-1.2.1&raw_url=true&q=80&fm=jpg&crop=entropy&cs=tinysrgb&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=715',
        'https://images.unsplash.com/photo-1653338507618-abca3334676d?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687',
        'https://images.unsplash.com/photo-1653338769211-1f83f15a73d6?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687',
        'https://images.unsplash.com/photo-1649458223566-3aa999113216?ixlib=rb-1.2.1&raw_url=true&q=80&fm=jpg&crop=entropy&cs=tinysrgb&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687',
      ],
      interests: ['Music', 'Politics', 'Hiking'],
      bio:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus interdum posuere lorem at elementum. Donec lacinia aliquet eleifend. Donec fringilla eleifend pellentesque. Nunc euismod diam vitae ipsum interdum tempus. Proin pharetra purus nec nunc pulvinar, sed facilisis mauris venenatis. Donec et cursus nunc, pharetra dapibus lacus. Aliquam at faucibus tortor. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae;',
      jobTitle: 'Job Title Here',
      location: 'Milan',
    ),
    const User(
      id: '9',
      name: 'Test9',
      age: 25,
      gender: 'Female',
      imageUrls: [
        'https://images.unsplash.com/photo-1650310219845-4238f9929c15?ixlib=rb-1.2.1&raw_url=true&q=80&fm=jpg&crop=entropy&cs=tinysrgb&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=715',
        'https://images.unsplash.com/photo-1653338507618-abca3334676d?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687',
        'https://images.unsplash.com/photo-1653338769211-1f83f15a73d6?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687',
        'https://images.unsplash.com/photo-1649458223566-3aa999113216?ixlib=rb-1.2.1&raw_url=true&q=80&fm=jpg&crop=entropy&cs=tinysrgb&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687',
      ],
      interests: ['Music', 'Politics', 'Hiking'],
      bio:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus interdum posuere lorem at elementum. Donec lacinia aliquet eleifend. Donec fringilla eleifend pellentesque. Nunc euismod diam vitae ipsum interdum tempus. Proin pharetra purus nec nunc pulvinar, sed facilisis mauris venenatis. Donec et cursus nunc, pharetra dapibus lacus. Aliquam at faucibus tortor. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae;',
      jobTitle: 'Job Title Here',
      location: 'Milan',
    ),
    const User(
      id: '10',
      name: 'Test10',
      age: 25,
      gender: 'Female',
      imageUrls: [
        'https://images.unsplash.com/photo-1651192390749-66c7b038b1b4?ixlib=rb-1.2.1&raw_url=true&q=80&fm=jpg&crop=entropy&cs=tinysrgb&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=715',
        'https://images.unsplash.com/photo-1653338507618-abca3334676d?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687',
        'https://images.unsplash.com/photo-1653338769211-1f83f15a73d6?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687',
        'https://images.unsplash.com/photo-1649458223566-3aa999113216?ixlib=rb-1.2.1&raw_url=true&q=80&fm=jpg&crop=entropy&cs=tinysrgb&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687',
      ],
      interests: ['Music', 'Politics', 'Hiking'],
      bio:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus interdum posuere lorem at elementum. Donec lacinia aliquet eleifend. Donec fringilla eleifend pellentesque. Nunc euismod diam vitae ipsum interdum tempus. Proin pharetra purus nec nunc pulvinar, sed facilisis mauris venenatis. Donec et cursus nunc, pharetra dapibus lacus. Aliquam at faucibus tortor. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae;',
      jobTitle: 'Job Title Here',
      location: 'Milan',
    ),
    const User(
      id: '11',
      name: 'Test11',
      age: 25,
      gender: 'Female',
      imageUrls: [
        'https://images.unsplash.com/photo-1646061633551-6e8a1e09b72b?ixlib=rb-1.2.1&raw_url=true&q=80&fm=jpg&crop=entropy&cs=tinysrgb&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=715',
        'https://images.unsplash.com/photo-1653338507618-abca3334676d?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687',
        'https://images.unsplash.com/photo-1653338769211-1f83f15a73d6?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687',
        'https://images.unsplash.com/photo-1649458223566-3aa999113216?ixlib=rb-1.2.1&raw_url=true&q=80&fm=jpg&crop=entropy&cs=tinysrgb&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687',
      ],
      interests: ['Music', 'Politics', 'Hiking'],
      bio:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus interdum posuere lorem at elementum. Donec lacinia aliquet eleifend. Donec fringilla eleifend pellentesque. Nunc euismod diam vitae ipsum interdum tempus. Proin pharetra purus nec nunc pulvinar, sed facilisis mauris venenatis. Donec et cursus nunc, pharetra dapibus lacus. Aliquam at faucibus tortor. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae;',
      jobTitle: 'Job Title Here',
      location: 'Milan',
    ),
    const User(
      id: '12',
      name: 'Test12',
      age: 25,
      gender: 'Female',
      imageUrls: [
        'https://images.unsplash.com/photo-1646061776773-ef4274bdce4d?ixlib=rb-1.2.1&raw_url=true&q=80&fm=jpg&crop=entropy&cs=tinysrgb&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=715',
        'https://images.unsplash.com/photo-1653338507618-abca3334676d?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687',
        'https://images.unsplash.com/photo-1653338769211-1f83f15a73d6?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687',
        'https://images.unsplash.com/photo-1649458223566-3aa999113216?ixlib=rb-1.2.1&raw_url=true&q=80&fm=jpg&crop=entropy&cs=tinysrgb&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687',
      ],
      interests: ['Music', 'Politics', 'Hiking'],
      bio:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus interdum posuere lorem at elementum. Donec lacinia aliquet eleifend. Donec fringilla eleifend pellentesque. Nunc euismod diam vitae ipsum interdum tempus. Proin pharetra purus nec nunc pulvinar, sed facilisis mauris venenatis. Donec et cursus nunc, pharetra dapibus lacus. Aliquam at faucibus tortor. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae;',
      jobTitle: 'Job Title Here',
      location: 'Milan',
    ),
  ];
}
