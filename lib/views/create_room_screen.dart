import 'package:flutter/material.dart';
import 'package:tictac/core/responsive/responsive.dart';
import 'package:tictac/resources/socket_methods.dart';
import 'package:tictac/views/widgets/custom_button_widget.dart';
import 'package:tictac/views/widgets/custom_text.dart';
import 'package:tictac/views/widgets/custom_textfield.dart';

class CreateRoomScreen extends StatefulWidget {
  const CreateRoomScreen({super.key});

  @override
  State<CreateRoomScreen> createState() => _CreateRoomScreenState();
}

class _CreateRoomScreenState extends State<CreateRoomScreen> {
  final TextEditingController _nameController = TextEditingController();
  final SocketMethods _socketMethods = SocketMethods();

  @override
  void initState() {
    super.initState();
    _socketMethods.createRoomSuccessListener(context);
  }

  @override
  void dispose() {
    _nameController.dispose();
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
            const CustomText(text: "Create Room", fontSize: 24),
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
            CustomButton(
                onPressed: () =>
                    _socketMethods.createRoom(_nameController.text),
                text: "Create Room"),
          ],
        ),
      ),
    ));
  }
}
