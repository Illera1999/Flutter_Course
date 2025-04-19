import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: (){
                showAboutDialog(
                  context: context,
                  children: [
                    const Text('Licencias usadas'),
                  ]
                  );
              },
              child: Text('Licencias usadas') ,
            ),
            FilledButton.tonal(
              onPressed: () => openDialog(context),
              child: Text('Mostrar Dialogo') ,
            )
          ],
        ),
      ),
    );
  }
}



void openDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return AlertDialog(
        title: const Text('Hola Mundo'),
        content: const Text('Soy un dialogo'),
        actions: [
          TextButton(
            onPressed: () {
              context.pop();
            },
            child: const Text('Cancelar'),
          ),
          FilledButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Aceptar'),
          ),
        ],
      );
    },
  );
}