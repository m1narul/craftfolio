import 'package:craftfolio/provider/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CraftFolio extends ConsumerWidget {
  const CraftFolio({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final personalInfoAsyncValue = ref.watch(personalInfoProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Dev-Craftfolio')),
      body: Column(
        children: [
          // Personal Information
          personalInfoAsyncValue.when(
            data: (personalInfo) {
              return ListTile(
                title: Text(personalInfo['name']),
                subtitle: Text(personalInfo['email']),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(personalInfo['profile_image'] ?? ''),
                ),
              );
            },
            loading: () => const CircularProgressIndicator(),
            error: (error, stackTrace) => Text('Error: $error'),
          ),
        ],
      ),
    );
  }
}
