import 'package:responsive_tutorial_app/config/assets.dart';

class Post {
  const Post({
    required this.date,
    required this.image,
    required this.user,
    required this.message,
    required this.likes,
    required this.comments,
    required this.saved,
  });

  final String date;
  final String image;
  final String user;
  final String message;
  final String likes;
  final String comments;
  final String saved;
}

final postElements = [
  Post(
    date: 'May 20',
    image: AssetsManager.image1,
    user: '@dreamtravels',
    message: 'Back to midnight sun, when the days never ended and...',
    likes: '7.2k',
    comments: '3.9k',
    saved: '102',
  ),
  Post(
    date: 'May 21',
    image: AssetsManager.image1,
    user: '@dreamtravels',
    message: 'You’ll leave the week with a warm heart, full of...',
    likes: '3.2k',
    comments: '4.9k',
    saved: '301',
  ),
  Post(
    date: 'May 29',
    image: AssetsManager.image1,
    user: '@dreamtravels',
    message: 'What a day to be alive! Well today is actually quite special...',
    likes: '4.2k',
    comments: '1.9k',
    saved: '401',
  ),
  Post(
    date: 'May 30',
    image: AssetsManager.image1,
    user: '@dreamtravels',
    message: 'ust finished a week sailing in Croatia with friends. After a...',
    likes: '2.2k',
    comments: '2.9k',
    saved: '987',
  ),
];
