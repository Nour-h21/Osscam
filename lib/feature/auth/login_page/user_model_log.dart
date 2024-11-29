class UserModelLogIn {
  final String email1;
  final String password1;
  // final String role="USER";
  UserModelLogIn({
    required this.email1,
    required this.password1,
    //required this.role,
  });

  toMap() {
    return {
      "email": email1,
      "password": password1,
      // "role":role
    };
  }
}
