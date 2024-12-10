import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'craft_folio.dart';
import 'dart:html'; // Import the HTML package to access window object

void main() async {
  // Ensure Flutter bindings are initialized before running any async code
  WidgetsFlutterBinding.ensureInitialized();

  // Check if running in the web platform
  if (kIsWeb) {
    // Access the environment variables injected by GitHub Actions
    String? apiUrl = window.localStorage['APIURL']; // Or use any method for accessing passed env variables
    String? anonKey = window.localStorage['ANONKEY'];

    if (apiUrl != null && anonKey != null) {
      // Initialize Supabase or other services with the API and anon key
      await Supabase.initialize(
        url: apiUrl,
        anonKey: anonKey,
      );
    } else {
      print('API URL or Anon Key is not available');
    }
  }

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
