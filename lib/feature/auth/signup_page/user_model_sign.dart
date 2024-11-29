class UserModelSignUp {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String role="USER";
  UserModelSignUp({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    // required this.role,
  });

  toMap() {
    return {
      "firstName": firstName,
      "lastName":lastName,
      "email":email,
      "password": password,
      "role":role
    };
  }
}