import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  const ButtonsScreen({super.key});

  static const String name = 'buttons_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Buttons')),
      body: _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back_ios_new_rounded),
        onPressed: () {
          context.pop();
        },
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: SizedBox(
          child: Wrap(
            spacing: 10,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text('Elevated Button'),
              ),
              ElevatedButton(
                onPressed: null,
                child: Text('Elevated Button Disabled'),
              ),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.access_alarm_rounded),
                label: const Text('Elevated Button Icon'),
              ),
              FilledButton(
                onPressed: () {},
                child: const Text('Filled Button'),
              ),
              FilledButton.icon(
                onPressed: () {},
                label: const Text('Filled Button Icon'),
                icon: Icon(Icons.accessibility_new),
              ),
              OutlinedButton(
                onPressed: () {},
                child: const Text('Outline Button'),
              ),
              OutlinedButton.icon(
                onPressed: () {},
                label: const Text('Outline Button Icon'),
                icon: Icon(Icons.terminal),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('Outline Button Icon'),
              ),
              TextButton.icon(
                onPressed: () {},
                label: const Text('Outline Button Icon'),
                icon: Icon(Icons.account_box_outlined),
              ),

              // TODO CustomButton
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.app_registration_rounded),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.app_registration_rounded),
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(
                    color.primaryContainer,
                  ),
                  iconColor: WidgetStateProperty.all(
                    Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
