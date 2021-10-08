class TextValidators {
  static String? emailValidator(String? value) {
    if (value == null) {
      return 'Ingresa tu correo electronico';
    }
    if (value.isEmpty) {
      return 'Ingresa tu correo electronico';
    }
    if (_validateEmail(value)) {
      return 'Ingresa un correo valido';
    }
    return null;
  }

  static String? documentValidator(String? value) {
    if (value == null) {
      return 'Ingresa tu numero de identificacion';
    } else if (value.isEmpty) {
      return 'Ingresa tu numero de identificacion';
    } else if (value.length < 6) {
      return 'Revisa numero de identificacion';
    }
    return null;
  }

  static String? passwordValidator(String? value) {
    if (value == null) {
      return 'Ingresa tu contraseña';
    }
    if (value.isEmpty) {
      return 'Ingresa tu contraseña';
    }
    if (value.length < 4) {
      return 'La contraseña debe tener 4 caracteres';
    }
    return null;
  }

  static String? nameValidator(String? value) {
    if (value == null) {
      return 'Ingresa tus nombres';
    }
    if (value.isEmpty) {
      return 'Ingresa tus nombres';
    }
    if (value.length < 3) {
      return 'Tu nombre debe ser mayor a 3 caracteres';
    }
    return null;
  }

  static String? numberCardValidator(String? value) {
    if (value == null) {
      return 'Ingresa tu numero de tarjeta';
    }
    if (value.isEmpty) {
      return 'Ingresa tu numero de tarjeta';
    }
    if (value.length < 16) {
      return 'Revisa tu numero de tarjeta';
    }
    return null;
  }

  static String? cvvCardValidator(String? value) {
    if (value == null) {
      return 'Ingresa tu CVV';
    }
    if (value.isEmpty) {
      return 'Ingresa tu CVV';
    }
    if (value.length < 3) {
      return 'Revisa tu CVV';
    }
    return null;
  }

  static String? phoneValidator(String? value, {int maxLength = 10}) {
    if (value == null) {
      return 'Ingresa numero de telefono';
    }
    if (value.isEmpty) {
      return 'Ingresa numero de telefono';
    }
    if (value.length < maxLength) {
      return 'Revisa numero de telefono';
    }
    return null;
  }

  static bool _validateEmail(String? value) {
    if (value == null) return false;
    const String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    final RegExp regex = RegExp(pattern);
    return !regex.hasMatch(value);
  }
}