import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:home_haven_clean/core/common/app/services/injcetion_container.dart';
import 'package:home_haven_clean/core/utils/constants/network_constants.dart';
import 'package:home_haven_clean/core/utils/constants/prefs_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

sealed class AuthRemoteDataSource {
  Future<bool> login({
    required String phoneNumber,
    required String password,
  });

  // TODO signUp abstract methodini yozinglar
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  Dio dio = getIt<Dio>();

  AuthRemoteDataSourceImpl();

  @override
  Future<bool> login({
    required String phoneNumber,
    required String password,
  }) async {
    log("data in data source: $phoneNumber, $password");

    final url = "${NetworkConstants.authUrl}/signin";
    final data = {
      "phone_number": phoneNumber,
      "email": "",
      "auth_method": "phone-number",
      "password": password,
    };

    try {
      final response =
          await dio.post(url, data: jsonEncode(data), options: Options());
      log(response.data.toString());
      if (response.statusCode == 201) {
        log(response.statusCode.toString());
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString(
            PrefsKeys.tokenKey, response.data["data"]["access_token"]);
        log(response.data["data"]["access_token"]);
        return true;
      }
      return false;
    } catch (e) {
      log("Error happened: while logging in: $e");
      throw Exception(e);
    }
  }

  // TODO signup methodini implementationini yozinglar.
}
