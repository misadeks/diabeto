import 'package:diabeto/repositories/auth/authRepository.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseAuthRepository{
  static final Supabase _supabase = Supabase.instance;
  // const SupabaseAuthRepository(this._supabase);

  static Future<AuthResponse> signInEmailAndPassword(String email, String password) async {
    final response = await _supabase.client.auth.signInWithPassword(
      email: email,
      password: password,
    );

    final userId = response.user?.id;
    if (userId == null) {
      throw UnimplementedError();
    }

    return response;
  }


  static Future<String> signUpEmailAndPassword(String email, String password) async {
    final response = await _supabase.client.auth.signUp(email: email, password: password);

    final userId = response.user?.id;
    if (userId == null) {
      throw UnimplementedError();
    }

    return userId;
  }

  static Future<void> signOut() async {
    await _supabase.client.auth.signOut();
    return;
  }
}