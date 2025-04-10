import 'package:flutter/material.dart';
import 'package:tictac/core/responsive/responsive.dart';
import 'package:tictac/resources/socket_methods.dart';
import 'package:tictac/views/widgets/custom_button_widget.dart';
import 'package:tictac/views/widgets/custom_text.dart';
import 'package:tictac/views/widgets/custom_textfield.dart';

class JoinRoomScreen extends StatefulWidget {
  const JoinRoomScreen({super.key});

  @override
  State<JoinRoomScreen> createState() => _JoinRoomScreenState();
}

class _JoinRoomScreenState extends State<JoinRoomScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _gameIdController = TextEditingController();
  final SocketMethods _socketMethods = SocketMethods();

  @override
  void initState() {
    super.initState();
    _socketMethods.joinRoomSuccessListener(context);
    _socketMethods.updatePlayersStateListener(context);
    _socketMethods.errorOccuredListener(context);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _gameIdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Responsive(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CustomText(text: "Join Room", fontSize: 24),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            CustomTextfield(
                isReadOnly: false,
                hintText: "Enter Your Name",
                controller: _nameController),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            CustomTextfield(
                isReadOnly: false,
                hintText: "Enter Game ID",
                controller: _gameIdController),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            CustomButton(
                onPressed: () => _socketMethods.joinRoom(
                    _nameController.text, _gameIdController.text),
                text: "Join"),
          ],
        ),
      ),
    ));
  }
}
