import 'package:flutter/material.dart';
import 'package:majet/core/constants/app_colors.dart';

class RightDrawer extends StatelessWidget {
  final VoidCallback onClose;
  final double width;
  final String? userName; // <-- add this

  const RightDrawer({
    Key? key,
    required this.onClose,
    this.width = 250,
    this.userName, // <-- optional username
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Overlay to detect taps outside
        GestureDetector(
          onTap: onClose,
          child: Container(
            color: Colors.black54, // semi-transparent overlay
          ),
        ),

        // Drawer content
        Align(
          alignment: Alignment.centerRight,
          child: Material(
            color: primaryColorLight, // Drawer background color
            child: Container(
              width: width,
              height: double.infinity,
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  if (userName != null) // <-- show username if passed
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Text(
                        'Hello, $userName',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: lightGrey,
                        ),
                      ),
                    ),
                  ListTile(
                    leading: const Icon(Icons.person, color: lightGrey),
                    title: const Text('Profile',
                        style: TextStyle(color: lightGrey)),
                    onTap: () {
                      print('Profile clicked');
                      onClose();
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings, color: lightGrey),
                    title: const Text('Settings',
                        style: TextStyle(color: lightGrey)),
                    onTap: () {
                      print('Settings clicked');
                      onClose();
                    },
                  ),
                  const Spacer(),
                  ListTile(
                    leading: const Icon(Icons.logout, color: lightGrey),
                    title: const Text('Logout',
                        style: TextStyle(color: lightGrey)),
                    onTap: () {
                      print('Logout clicked');
                      onClose();
                    },
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
