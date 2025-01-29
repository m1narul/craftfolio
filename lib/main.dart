import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'craft_folio.dart';

void main() async {
  // Ensure Flutter bindings are initialized before running any async code
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: DevCraftFolio()));
}

class DevCraftFolio extends StatelessWidget {
  const DevCraftFolio({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dev-Craftfolio',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const CraftFolio(), // Updated homepage widget
    );
  }
}
