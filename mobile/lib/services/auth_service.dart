import 'dart:convert';

import 'package:http/http.dart'
    as http;

import 'package:shared_preferences/shared_preferences.dart';

class AuthService {

  static const String baseUrl =
      "http://10.0.2.2:3000";

  static Future<dynamic> login(
    String email,
    String password,
  ) async {

    final response =
        await http.post(

      Uri.parse(
        "$baseUrl/auth/login",
      ),

      headers: {
        "Content-Type":
            "application/json",
      },

      body: jsonEncode({

        "name": email,
        "password": password,
      }),
    );

    if (response.statusCode == 200) {

      final data =
          jsonDecode(response.body);

      final prefs =
          await SharedPreferences
              .getInstance();

      await prefs.setString(
        "token",
        data["token"],
      );

      await prefs.setString(
        "name",
        data["user"]["name"],
      );

      await prefs.setString(
        "role",
        data["user"]["role"],
      );

      return data;
    }

    return null;
  }

  static Future<void> logout()
  async {

    final prefs =
        await SharedPreferences
            .getInstance();

    await prefs.remove("token");
  }
}