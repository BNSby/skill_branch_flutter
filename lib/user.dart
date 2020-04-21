class User {
  String phone, name, email;

  User({String phone, this.name, String email})
      : this.phone = phone,
        this.email = _parseEmail(email);

  static String _parseEmail(String email) {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);

    if (!emailValid) throw Exception('Enter a valid email');

    return email;
  }

  String get login => email ?? name.split(' ')[0];
}
