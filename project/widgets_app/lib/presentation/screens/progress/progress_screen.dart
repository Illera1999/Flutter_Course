import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});
  static const String name = 'progress_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Progress Indicator')),
      body: _ProgressView(),
    );
  }
}

class _ProgressView extends StatelessWidget {
  const _ProgressView();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: const [
          SizedBox(height: 20),
          Text('Circular Progress Indicator'),
          SizedBox(height: 20),
          CircularProgressIndicator(
            strokeWidth: 2,
            backgroundColor: Colors.black45,
          ),

          SizedBox(height: 20),
          Text('Circular y Linear Controlado'),
          SizedBox(height: 20),
          _ControlledProgresIndicator(),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}

class _ControlledProgresIndicator extends StatelessWidget {
  const _ControlledProgresIndicator();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Stream.periodic(const Duration(milliseconds: 100), (value) {
        return (value * 2) / 100;
      }).takeWhile((value) => value < 100),
      builder: (context, snapshot) {
        final progressValue = snapshot.data ?? 0;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                value: progressValue,
                strokeWidth: 2,
                backgroundColor: Colors.black45,
              ),
              const SizedBox(width: 20),
              Expanded(child: LinearProgressIndicator(value: progressValue)),
            ],
          ),
        );
      },
    );
  }
}
