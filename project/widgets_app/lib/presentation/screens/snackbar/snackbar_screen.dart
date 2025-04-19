import 'package:flutter/material.dart';

class SnackBarScreen extends StatelessWidget {
  const SnackBarScreen({super.key});
  static const String name = 'snackbar_screen';

  void showCustomSnackBar(BuildContext context) {

    final snackbar = SnackBar(
      content: const Text('Hola Mundo'),
      duration: const Duration(seconds: 1),
      action: SnackBarAction(
        label: 'Ok',
        onPressed: () {
          // Do something
        },
      ),
    );

    ScaffoldMessenger.of(context)
    ..clearSnackBars()
    ..showSnackBar(snackbar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Snackbars y diálogos')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showCustomSnackBar(context);
        },
        label: Text('Mostart Snackbar'),
        icon: Icon( Icons.remove_red_eye_outlined),
      ),
    );
  }
}
