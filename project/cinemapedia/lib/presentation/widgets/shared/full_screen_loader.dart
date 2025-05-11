import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});

  Stream<String> get streamMessages {
    final messages = <String>[
      'Cargando...',
      'Espere un momento...',
      'Estamos preparando todo...',
      'Casi listo...',
      'Un momento por favor...',
      'Estamos trabajando en ello...',
      'Todo estará listo pronto...',
      'Estamos en ello...',
    ];
    return Stream.periodic(const Duration(milliseconds: 1200), (x) {
      return messages[x];
    }).take(messages.length);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Cargando...'),
          const SizedBox(height: 10),
          CircularProgressIndicator(),
          const SizedBox(height: 10),
          StreamBuilder(
            stream: streamMessages,
            builder: (context, snapshot) {
              if ( !snapshot.hasData) {
                return const Text('Cargando...');
              }
              return Text(snapshot.data!);
            },
          ),
        ],
      ),
    );
  }
}
