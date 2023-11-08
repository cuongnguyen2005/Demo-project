class ValidateUntils {
  //validate email
  static String? validateEmail(String? value) {
    // return null;
    if ((value ?? "").isEmpty) return "Tài khoản không được để trống";
    RegExp emailRegexp =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    // RegExp phoneRegexp = RegExp(r'^(03|05|07|08|09)+([0-9]{8})$');
    if (emailRegexp.hasMatch(value ?? "")) {
      return null;
    } else {
      return "Tài khoản sai định dạng";
    }
  }

  //Validate mật khẩu
  static String? validatePassword(String? value) {
    // return null;
    if ((value ?? "").isEmpty) return "Mật khẩu không được để trống";
    RegExp pwRegexp = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{6,}$');
    if (pwRegexp.hasMatch(value ?? "")) {
      return null;
    } else {
      return "Mật khẩu phải gồm 6 kí tự, 1 in hoa, in thường và số";
    }
  }

  //Validate name
  static String? validateName(String? value) {
    // return null;
    if ((value ?? "").isEmpty) return "Tên không được để trống";
    return null;
  }
}
