class TPlatformException implements Exception {
  final String message;

  TFormatException(
      [this.message =
          'An unexpected format error occurred. Please check your input.']);

  factory TFormatException.fromMessage(String message) {
    return TFormatException(message);
  }

  factory TFormatException.fromCode(String code) {
    switch (code) {
      case 'invalid-email-format':
        return const TFormatException(
            'The email address format is invalid. Please enter a valid email.');
      case 'invalid-phone-number-format':
        return const TFormatException(
            'The provided phone number format is invalid. Please enter a valid number.');
      case 'invalid-date-format':
        return const TFormatException(
            'The date format format is invalid. Please enter a valid date.');
      case 'invalid-url-format':
        return const TFormatException(
            'The URL format format is invalid. Please enter a valid URL.');
      case 'invalid-credit-card-format':
        return const TFormatException(
            'The credit card format format is invalid. Please enter a valid credit card.');
      case 'invalid-card-card-format':
        return const TFormatException(
            'The credit card format format is invalid. Please enter a valid credit card.');
    }
  }
}
