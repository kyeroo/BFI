import 'dart:convert';

import 'package:http/http.dart'
    as http;

class TpsrService {

  static const String baseUrl =
      "http://10.0.2.2:3000";

  static Future<List<dynamic>>
      getComposter() async {

    final response =
        await http.get(

      Uri.parse(
        "$baseUrl/tpsr/composter",
      ),

      headers: {

        /// GANTI TOKEN INI
        "Authorization":
            "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6Mywicm9sZSI6IlRQU1IiLCJpYXQiOjE3Nzg5MTQ2MDksImV4cCI6MTc3OTUxOTQwOX0.2oflYz6dj-AyivJiNKNgAyFjmSr0RKz9MS1Snp2SkSA",
      },
    );

    return jsonDecode(response.body);
  }
}