class User {
  final int id;
  final String name;
  final String imageUrl;
  final bool isOnline;

  User({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.isOnline,
  });
}

// YOU - current user
final User currentUser = User(
  id: 0,
  name: 'Me',
  imageUrl: 'assets/images/nick-fury.jpg',
  isOnline: true,
);

// USERS
final User ironMan = User(
  id: 1,
  name: 'Nguyen A',
  imageUrl: 'assets/images/profile1.jpeg',
  isOnline: true,
);
final User captainAmerica = User(
  id: 2,
  name: 'Nguyen B',
  imageUrl: 'assets/images/profile2.jpg',
  isOnline: true,
);
final User hulk = User(
  id: 3,
  name: 'Nguyen C',
  imageUrl: 'assets/images/profile3.jpg',
  isOnline: false,
);
final User scarletWitch = User(
  id: 4,
  name: 'Nguyen D',
  imageUrl: 'assets/images/profile4.jpg',
  isOnline: false,
);
final User spiderMan = User(
  id: 5,
  name: 'Nguyen E',
  imageUrl: 'assets/images/profile5.jpg',
  isOnline: true,
);
final User blackWindow = User(
  id: 6,
  name: 'Nguyen F',
  imageUrl: 'assets/images/profile6.jpg',
  isOnline: false,
);
final User thor = User(
  id: 7,
  name: 'Nguyen G',
  imageUrl: 'assets/images/profile7.jpg',
  isOnline: false,
);
final User captainMarvel = User(
  id: 8,
  name: 'Nguyen H',
  imageUrl: 'assets/images/profile8.jpg',
  isOnline: false,
);