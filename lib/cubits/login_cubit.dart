import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:login_app/data_source/lgoin_data_source.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit()
      : super(
          LoginState(
            hasData: false,
            hasError: false,
            isLoading: false,
            loginIsEnable: false,
          ),
        );

  LoginDataSource loginDataSource = LoginDataSource();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  void login() async {
    emit(state.copyWith(
      isLoading: true,
      hasError: false,
      hasData: false,
      error: null,
    ));
    try {
      await loginDataSource.login(
        usernameController.text,
        passwordController.text,
      );
      emit(state.copyWith(
        isLoading: false,
        hasError: false,
        hasData: true,
        error: null,
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        hasError: true,
        hasData: false,
        error: e.toString(),
        loginIsEnable: !isUsernameOrPasswordIsEmpty,
      ));
    }
  }

  void updateLoginButton() {
    emit(state.copyWith(loginIsEnable: !isUsernameOrPasswordIsEmpty));
  }

  bool get isUsernameOrPasswordIsEmpty =>
      usernameController.text.isEmpty || passwordController.text.isEmpty;
}
