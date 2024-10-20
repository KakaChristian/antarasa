import 'package:get_storage/get_storage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// Environment variables and shared app constants.
abstract class Constants {
  static const String supabaseUrl = String.fromEnvironment(
    'SUPABASE_URL',
    defaultValue: 'https://pgjrynqgvnpjfnsvknzh.supabase.co',
  );

  static const String supabaseAnnonKey = String.fromEnvironment(
    'SUPABASE_ANNON_KEY',
    defaultValue:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InBnanJ5bnFndm5wamZuc3ZrbnpoIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjU3ODU2MTUsImV4cCI6MjA0MTM2MTYxNX0.v15TK3v6Q00PrqUB9PwxD6cRBWSHknJakwEVb0CU1AU',
  );

  // [GetStorage]
  static final getBox = GetStorage();
}

// [Supabase Client]
final supabase = Supabase.instance.client;
