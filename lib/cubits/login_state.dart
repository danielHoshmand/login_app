// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_cubit.dart';

class LoginState {
  final bool isLoading;
  final bool hasError;
  final bool hasData;
  final String? error;
  final bool loginIsEnable;

  LoginState({
    required this.isLoading,
    required this.hasError,
    required this.hasData,
    this.error,
    required this.loginIsEnable,
  });

  LoginState copyWith({
    bool? isLoading,
    bool? hasError,
    bool? hasData,
    String? error,
    bool? loginIsEnable,
  }) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      hasError: hasError ?? this.hasError,
      hasData: hasData ?? this.hasData,
      error: error ?? this.error,
      loginIsEnable: loginIsEnable ?? this.loginIsEnable,
    );
  }
}
