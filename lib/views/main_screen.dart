import 'package:flutter/material.dart';
import 'package:tictac/config/routes/routes.dart';
import 'package:tictac/core/responsive/responsive.dart';
import 'package:tictac/views/widgets/custom_button_widget.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  void createRoom(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.createRoom);
  }

  void joinRoom(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.createRoom);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Responsive(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomButton(
              onPressed: () => createRoom(context),
              text: 'Create Room',
            ),
            SizedBox(
              height: 20,
            ),
            CustomButton(
              onPressed: () => joinRoom(context),
              text: 'Join Room',
            ),
          ],
        ),
      ),
    ));
  }
}
