import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'craft_folio.dart';
import 'logger/logger.dart'; // Import the new homepage widget
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  // Ensure Flutter bindings are initialized before running any async code
  WidgetsFlutterBinding.ensureInitialized();
  // Load the configuration before running the app
  await dotenv.load(mergeWith: Platform.environment); // Load .env file
  // Load Local the configuration before running the app
  //await dotenv.load();
  await Supabase.initialize(
    url: dotenv.env['APIURL'] ?? 'No API Key',
    // Access the updated URL
    anonKey:
        dotenv.env['ANONKEY'] ?? 'No API Key', // Access the updated anon key
  );

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
