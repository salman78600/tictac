import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tictac/config/routes/routes.dart';
import 'package:tictac/core/utils/colors.dart';
import 'package:tictac/provider/room_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RoomProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: bgColor,
        ),
        initialRoute: AppRoutes.main,
        onGenerateRoute: AppRoutes.generateRoute,
      ),
    );
  }
}
