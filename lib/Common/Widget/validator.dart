class Validator {
  static String? validateName({required String? name}) {
    if (name == null) {
      return null;
    }

    if (name.isEmpty) {
      return 'Enter Your Name';
    }

    return null;
  }

  // ignore: non_constant_identifier_names
  // static String? validateMobile_No({required String? mobile_no}) {
  //   if (mobile_no == null) {
  //     return null;
  //   }
  //
  //   if (mobile_no.isEmpty) {
  //     return 'Enter Your Mobile_no';
  //   } else if (mobile_no.length <= 10) {
  //     return 'Enter a mobile_no with length at least 10';
  //   }
  //
  //   return null;
  // }

  static String? validateEmail({required String? email}) {
    if (email == null) {
      return null;
    }

    RegExp emailRegExp = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$",
    );

    if (email.isEmpty) {
      return 'Enter Your Email_id';
    } else if (!emailRegExp.hasMatch(email)) {
      return 'Enter a correct email';
    }

    return null;
  }

  static String? validatePassword({required String? password}) {
    if (password == null) {
      return null;
    }

    if (password.isEmpty) {
      return 'Enter Your Password';
    } else if (password.length < 6) {
      return 'Enter a password with length at least 6';
    }

    return null;
  }
}
