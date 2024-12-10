import 'package:fpdart/fpdart.dart';

import '../models/credentials.dart';

class LoginDataSource {
  // Mock login method - now accepts Credentials model
  Either<String, String> login(Credentials credentials) {
    if (credentials.username == "test" && credentials.password == "password") {
      return Right("Login successful!");
    } else {
      return Left("Invalid username or password.");
    }
  }
}
