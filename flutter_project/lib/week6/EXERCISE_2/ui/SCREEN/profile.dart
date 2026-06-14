import 'package:flutter/material.dart';
import '../THEME/theme.dart';
import '../../data/profile_data.dart';

class ProfileApp extends StatelessWidget {
  const ProfileApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary.withAlpha(100),
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text(
          'CADT student Profile',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,

          children: [
            const SizedBox(height: 40),
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage(chamroenProfile.avatarUrl),
            ),
            const SizedBox(height: 20),
            Text(chamroenProfile.name),
            const SizedBox(height: 20),
            Text(chamroenProfile.position),
            // toDo
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  ...chamroenProfile.tiles.map(
                    (items) => ProfileTile(
                      icon: items.icon,
                      title: items.title,
                      data: items.value,
                    ),
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

// ----------------------//
class ProfileTile extends StatelessWidget {
  const ProfileTile({
    super.key,
    required this.icon,
    required this.title,
    required this.data,
  });

  final IconData icon;
  final String title;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: ListTile(
          leading: Icon(icon, color: AppColors.primary),
          title: Text(title),
          subtitle: Text(data),
        ),
      ),
    );
  }
}
