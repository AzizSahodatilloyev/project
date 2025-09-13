class Api {
  Api._();

  /// URL
  static const String baseUrl = "https://fastapi-books-app.onrender.com";

  /// ENDPOINTS
  // auth
  static const String signUp = "$baseUrl/auth/signup";
  static const String verify = "$baseUrl/auth/verify";
  static const String logIn = "$baseUrl/auth/login";
  static const String forgotPassword = "$baseUrl/auth/forgot-password";
  static const String verifyPasswordResetOtp =
      "$baseUrl/auth/verify-password-reset-otp";
  static const String resetPassword = "$baseUrl/auth/reset-password";
}
