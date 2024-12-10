import 'package:supabase_flutter/supabase_flutter.dart';
import '../logger/logger.dart';

class ApiService {
  final SupabaseClient _supabase = Supabase.instance.client;

  // Fetch personal information
  Future<Map<String, dynamic>> fetchPersonalInformation() async {
    try {
      final PostgrestMap response = await _supabase
          .from('personal_information')
          .select()
          .single();  // Only fetch one record (assuming you have only one)

      // Check for errors in the response
      if (response.isEmpty) {
        Logger.logError('Error fetching personal information: $response');
        throw Exception('Failed to load personal information');
      }

      // Log the successful response
      Logger.logInfo('Fetched personal information: $response');

      // Return the fetched data (ensure it's a Map<String, dynamic>)
      return response;
    } catch (e) {
      // Handle errors (network, parsing, etc.)
      Logger.logError('An error occurred: $e');
      throw Exception('Failed to load personal information');
    }
  }
}
