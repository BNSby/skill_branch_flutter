import '../string_util.dart';

enum LoginType { email, phone }

class User with UserUtils {
  String phone, email, _lastName, _firstName;
  LoginType _type;
  List<User> friends = [];

  factory User({String phone, String name, String email}) {
    if (name.isEmpty) throw Exception('user name is empty');

    return User._(
        firstName: _getFirstName(name),
        lastName: _getLastName(name),
        email: email != null ? parseEmail(email) : '',
        phone: phone != null ? parsePhone(phone) : '');
  }

  User._({
    String firstName,
    String lastName,
    String phone,
    String email,
  })  : _firstName = firstName,
        _lastName = lastName,
        this.phone = phone,
        this.email = email {
    _type = email != null ? LoginType.email : LoginType.phone;
  }

  String get login => _type == LoginType.phone ? phone : email;

  String get name => [_firstName, _lastName].join(' ');

  static String parseEmail(String email) {
    bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);

    if (!emailValid) throw Exception('Enter a valid email');

    return email;
  }

  static String parsePhone(String phone) {
    if (phone.isEmpty || phone == null) throw Exception("Enter don't empty phone number");

    RegExp pattern = RegExp(r"[^+\d]");
    String cleanPhone = phone.replaceAll(pattern, '');
    bool phoneValid = RegExp(r"^(?:[+0])?\d{11}").hasMatch(cleanPhone);

    if (!phoneValid) throw Exception('Enter a valid email');

    return cleanPhone;
  }

  static String _getFirstName(String name) => ''.capitalize(name.split(' ')[0]);

  static String _getLastName(String name) => ''.capitalize(name.split(' ')[1]);

  void addFriend(Iterable<User> friend) {
    friends.addAll(friend);
  }

  void removeFriend(User user) {
    friends.remove(user);
  }

  @override
  bool operator ==(Object object) {
    if (object == null) return false;

    if (object is User) {
      return _firstName == object._firstName &&
          _lastName == object._lastName &&
          (phone == object.phone || email == object.email);
    }

    return false;
  }

  @override
  String toString() {
    return """
    name: $name
    email: $email
    friends: ${friends.toList()}
    """;
  }
}
