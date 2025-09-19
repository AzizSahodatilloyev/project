import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:project/core/api/api.dart';
import 'package:project/core/services/error_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepo {
  Future<String> signUp({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      final response = await http.post(
        Uri.parse(Api.signUp),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode({"email": email, "password": password, "name": name}),
      );
      final data = jsonDecode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return data['msg'];
      }
      throw parseDjangoError(data);
    } catch (e) {
      rethrow;
    }
  }

  Future<String> verify({required String email, required String otp}) async {
    try {
      final response = await http.post(
        Uri.parse(Api.verify),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode({"email": email, "otp": otp}),
      );
      final data = jsonDecode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return data['msg'];
      }
      throw parseDjangoError(data);
    } catch (e) {
      rethrow;
    }
  }

  Future<String> logIn({
    required String email,
    required String password,
  }) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      final response = await http.post(
        Uri.parse(Api.logIn),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode({"email": email, "password": password}),
      );
      final data = jsonDecode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final token = data['access_token'] ?? data['token'] ?? '';
        if (token.isEmpty) throw Exception("No token in response");
        await prefs.setString('token', token);
        return token;
      } else {
        throw parseDjangoError(data);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<String> forgotPassword({required String email}) async {
    try {
      final response = await http.post(
        Uri.parse(Api.forgotPassword),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode({"email": email}),
      );
      final data = jsonDecode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return data['msg'];
      }
      throw parseDjangoError(data);
    } catch (e) {
      rethrow;
    }
  }

  Future<String> verifyForgotPassword({
    required String email,
    required String otp,
  }) async {
    try {
      final response = await http.post(
        Uri.parse(Api.verifyPasswordResetOtp),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode({"email": email, "otp": otp}),
      );
      final data = jsonDecode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return data['reset_token'];
      }
      throw parseDjangoError(data);
    } catch (e) {
      rethrow;
    }
  }

  Future<String> newPassword({
    required String resetToken,
    required String newPassword,
  }) async {
    try {
      final response = await http.post(
        Uri.parse(Api.resetPassword),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode({
          'resetToken': resetToken,
          'newPassword': newPassword,
        }),
      );
      final data = jsonDecode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return data['reset_token'];
      }
      throw parseDjangoError(data);
    } catch (e) {
      rethrow;
    }
  }
}
