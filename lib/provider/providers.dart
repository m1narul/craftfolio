import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../service/api_service.dart';

// Provider for personal information
final personalInfoProvider = FutureProvider<Map<String, dynamic>>((ref) async {
  final apiService = ApiService();  // Create ApiService instance
  return apiService.fetchPersonalInformation();
});

