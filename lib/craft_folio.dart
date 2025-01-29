import 'package:craftfolio/provider/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CraftFolio extends ConsumerWidget {
  const CraftFolio({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final cvAsync = ref.watch(cvProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Dev-Craftfolio")),
      body: cvAsync.when(
        data: (cv) => Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Name: ${cv.name}", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Text("Summary: ${cv.summary}"),
              SizedBox(height: 20),
              Text("Skills:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ...cv.skills["technical"]!.map((skill) => Text("- $skill")).toList(),
              SizedBox(height: 20),
              Text("Projects:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ...cv.projects.map((project) => Text("- ${project.name}: ${project.description}")).toList(),
            ],
          ),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text("Error: $err")),
      ),
    );
  }
}
