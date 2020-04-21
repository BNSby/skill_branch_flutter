import 'user.dart';

class UserHolder {
  Map<String, User> users = {};

  void registerUser(String name, String phone, String email) {
    User user = User(name: name, phone: phone, email: email);
    users.addAll({'${user.login}': user});
  }

  User registerUserByEmail(String fullName, String email) {
    if (users.containsKey(email))
      throw Exception('A user with this email already exists');

    User user = User(name: fullName, email: email);

    users[email] = user;
    return user;
  }

  User registerUserByPhone(String fullName, String phone) {
    bool phoneExist;

    users.forEach((String key, User u) => u.phone == phone);

    throw Exception('A user with this email already exists');

    User user = User(name: fullName, email: email);

    users[email] = user;
    return user;
  }

  User getUserByLogin(String login) {
    return users[login];
  }
}
