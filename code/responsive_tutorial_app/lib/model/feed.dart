import 'package:responsive_tutorial_app/config/assets.dart';

class Feed {
  final String avatar;
  final String user;
  final String time;
  final String label;

  Feed({
    required this.avatar,
    required this.user,
    required this.time,
    required this.label,
  });
}

final feedActivity = [
  Feed(
      avatar: AssetsManager.avatar1,
      user: '@DercoMerci',
      time: '2 min ago',
      label:
          'Commented “Yes, I have been there and I would love to go there again! Do you...'),
  Feed(
      avatar: AssetsManager.avatar2,
      user: '@MiaMore',
      time: '9 min ago',
      label: 'Started following you'),
  Feed(
      avatar: AssetsManager.avatar3,
      user: '@RinaMenol',
      time: '11 min ago',
      label: 'Started following you'),
  Feed(
      avatar: AssetsManager.avatar4,
      user: '@CoryToms',
      time: '8 min ago',
      label: 'Commented “Where did you find this location?”'),
  Feed(
      avatar: AssetsManager.avatar5,
      user: '@IngaV',
      time: '7 min ago',
      label: 'Started following you'),
  Feed(
      avatar: AssetsManager.avatar6,
      user: '@HouseHoleJohn',
      time: '22 min ago',
      label: 'Started following you'),
  Feed(
      avatar: AssetsManager.avatar7,
      user: '@Smith420',
      time: '21 min ago',
      label:
          'Commented “ What airline do you always fly with? I’m a Delta man myself but you ...”'),
  Feed(
      avatar: AssetsManager.avatar8,
      user: '@DracoMango',
      time: '32 min ago',
      label: 'Started following you'),
  Feed(
      avatar: AssetsManager.avatar9,
      user: '@UPSDiversUS',
      time: '32 min ago',
      label:
          'Commented “ I love your conent, Let’s chat and find a way we can create content together.”'),
  Feed(
      avatar: AssetsManager.avatar10,
      user: '@HeroKing',
      time: '35 min ago',
      label: 'Liked a photo of you'),
  Feed(
      avatar: AssetsManager.avatar10,
      user: '@HeroKing',
      time: '36 min ago',
      label: 'Started following you'),
];
