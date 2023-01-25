﻿//every other provider in the future must abide to this interface
import 'package:taosil_app/services/auth/auth_user.dart';

abstract class AuthProvider {
  AuthUser? get currentUser;
  Future<AuthUser> logIn({required String email, required String password});
  //
  Future<AuthUser> createUser(
      {required String email, required String password});
  //
  Future<void> logOut();
  //
  Future<void> sendEmailVerification();
  //
  Future<void> initialize();
  //
  Future<void> sendPasswordReset({required String toEmail});
}
