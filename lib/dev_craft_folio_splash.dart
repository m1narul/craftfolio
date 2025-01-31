import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'craft_folio.dart';

final loadingProvider = StateProvider<bool>((ref) => true);

class DevCraftFolioSplash extends ConsumerStatefulWidget {
  const DevCraftFolioSplash({super.key});

  @override
  _DevCraftFolioSplash createState() => _DevCraftFolioSplash();
}

class _DevCraftFolioSplash extends ConsumerState<DevCraftFolioSplash> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      ref.read(loadingProvider.notifier).state = false;
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const CraftFolio()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(loadingProvider);

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
              opacity: isLoading ? 1.0 : 0.0,
              duration: const Duration(seconds: 2),
              child: Image.asset(
                'assets/logo.png', // Replace with your logo
                width: 150,
              ),
            ),
            const SizedBox(height: 20),
            isLoading
                ? const CircularProgressIndicator(
                    color: Colors.white,
                  )
                : const Text(
                    'Welcome!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
