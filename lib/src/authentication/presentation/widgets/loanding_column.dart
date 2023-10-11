import 'package:flutter/material.dart';

class LoandingColumn extends StatelessWidget {
  final String message;

  const LoandingColumn({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(),
          const SizedBox(
            height: 10.0,
          ),
          Text('$message...')
        ],
      ),
    );
  }
}
