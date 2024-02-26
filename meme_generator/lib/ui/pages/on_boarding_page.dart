import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Хочешь создать мем?',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextButton(
                  onPressed: () => context.goNamed('generate'),
                  child: const Text('Генерировать'),
                ),
                const SizedBox(width: 16),
                TextButton(
                  onPressed: (){},
                  child: const Text('Загрузить'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }


}