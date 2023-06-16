import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginStart>(_onLoginStart);
  }

  Future<void> _onLoginStart(LoginStart event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
    if (event.email == "1") {
      await Future.delayed(Duration(seconds: 1));
      emit(LoginFailure(error: "Heheh"));
      return;
    }
    try {
      await signInWithCredentials(event.email, event.password);
      emit(LoginSuccess());
    } catch (e) {
      emit(LoginFailure(error: e.toString()));
    }
  }

  Future<void> signInWithCredentials(String email, String password) async {
    // Call authentication service/API
    // Fake call:
    bool isAuthenticated = await Future.delayed(Duration(seconds: 1), () => true);

    if (!isAuthenticated) {
      throw Exception('Failed to authenticate');
    }
  }
}

