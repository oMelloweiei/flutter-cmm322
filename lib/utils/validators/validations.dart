class Validator {
  static String? validateEmptyText(String? fieldName, String? value) {
    if (value == null || value.isEmpty) {
      print('$fieldName is required');
      return '$fieldName is required';
    }

    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      print('Email is required');
      return 'E-mail is required';
    }

    final emailRegExp = RegExp(r"[\w\.-]+@[a-zA-Z]+\.[a-zA-Z]+");

    if (!emailRegExp.hasMatch(value)) {
      return "Invalid email address";
    }

    return null; // Return null if validation passes
  }

  static String? validatePassword(
    String? password,
  ) {
    if (password == null || password.isEmpty) {
      print('Email is required');
      return 'Password is required';
    }

    if (password.length < 6) {
      return 'Password much be at least at 6 characters long.';
    }

    //Check Uppercase
    if (!password.contains(RegExp(r'[A-Z]'))) {
      return 'Password much be contain at least one uppercase letter.';
    }

    //Check numbers
    if (!password.contains(RegExp(r'[0-9]'))) {
      return 'Password much be contain at least one number letter.';
    }

    //Check for special characters
    if (!password.contains(RegExp(r'[!@#$%^&*(),_.?":{}|<>]'))) {
      return 'Password much be contain at least one special characters letter.';
    }
    return null;
  }

  static String? validateConfirmpassword(
      String? confirmpassword, String? password) {
    if (confirmpassword == null || confirmpassword.isEmpty) {
      return 'Confirm password is required';
    }

    if (confirmpassword != password) {
      return "Password do not match";
    }
    return null;
  }
}
