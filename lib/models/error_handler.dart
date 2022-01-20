enum AuthResultStatus {
  successful,
  emailAlreadyExists,
  wrongPassword,
  invalidEmail,
  userNotFound,
  userDisabled,
  operationNotAllowed,
  tooManyRequests,
  undefined,
}

class AuthExceptionHandler {
  static getExceptionStatus(e) {
    print(e.code);
    var status;
    switch (e.code) {
      case "invalid-email":
        status = AuthResultStatus.invalidEmail;
        break;
      case "wrong-password":
        status = AuthResultStatus.wrongPassword;
        break;
      case "user-not-found":
        status = AuthResultStatus.userNotFound;
        break;
      case "user-disabled":
        status = AuthResultStatus.userDisabled;
        break;
      case "too-many-requests":
        status = AuthResultStatus.tooManyRequests;
        break;
      case "operation-not-allowed":
        status = AuthResultStatus.operationNotAllowed;
        break;
      case "email-already-in-use":
        status = AuthResultStatus.emailAlreadyExists;
        break;
      default:
        status = AuthResultStatus.undefined;
    }
    return status;
  }

  ///
  /// Accepts AuthExceptionHandler.errorType
  ///
  static generateExceptionMessage(AuthResultStatus exceptionCode) {
    String errorMessage;
    switch (exceptionCode) {
      case AuthResultStatus.invalidEmail:
        errorMessage = "invalid email address";
        break;
      case AuthResultStatus.wrongPassword:
        errorMessage = "wrong password";
        break;
      case AuthResultStatus.userNotFound:
        errorMessage = "user does not exist";
        break;
      case AuthResultStatus.userDisabled:
        errorMessage = "user with this email has been disabled";
        break;
      case AuthResultStatus.tooManyRequests:
        errorMessage = "too many requests. Try again after 1 minute";
        break;
      case AuthResultStatus.operationNotAllowed:
        errorMessage = "Email and Password sign-in is not enabled";
        break;
      case AuthResultStatus.emailAlreadyExists:
        errorMessage = "user already exists";
        break;
      default:
        errorMessage = "an unknown error occurred";
    }

    return errorMessage;
  }
}
