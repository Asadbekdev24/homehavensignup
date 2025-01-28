import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:home_haven_clean/features/auth/domain/usecases/login_usecase.dart';

class AuthProvider extends ChangeNotifier {
  final LoginUsecase loginUsecase;

  AuthProvider({required this.loginUsecase});

  bool isLoading = false;

  Future<bool> loginWithPhone({
    required String phoneNumber,
    required String password,
  }) async {
    isLoading = true;
    notifyListeners();
    log("data in usecase: $phoneNumber, $password");
    final result = await loginUsecase.call(
      phoneNumber: phoneNumber,
      password: password,
    );
    isLoading = false;

    notifyListeners();

    return result;
  }

  // TODO register uchun method yozib ichida register usecaseni chaqirib ishlatinglar.
}
