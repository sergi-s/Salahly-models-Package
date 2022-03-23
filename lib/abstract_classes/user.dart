import 'package:salahly_models/models/location.dart';

enum AccountState { active, block }
enum Gender { none, male, female }
enum Type { client, mechanic, provider, admin }

abstract class UserType {
  String? name;
  String? id;
  String? avatar;
  DateTime? birthDay;
  String? createdDate;
  String? email;
  String? _password;
  String? phoneNumber;
  String? address;
  CustomLocation? loc;

  Gender? gender;
  Type? type;
  AccountState? state;

  UserType({
    this.id,
    required this.name,
    required this.email,
    this.birthDay,
    this.createdDate,
    this.state,
    this.gender,
    this.type,
    this.avatar,
    this.loc,
    this.phoneNumber,
  });

  String get password => _password!;

  set setPassword(String value) {
    _password = value;
  }

  bool isValid() {
    return (emailValidate(email!) &&
        nameValidate(name!) &&
        passValidate(password));
  }

  //Validation

  bool emailValidate(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)$")
        .hasMatch(email);
  }

  bool nameValidate(String name) {
    return RegExp(
            r"^([a-zA-Z]{2,}\s[a-zA-Z]{1,}'?-?[a-zA-Z]{2,}\s?([a-zA-Z]{1,})?)")
        .hasMatch(name);
  }

  bool passValidate(String password) {
    return RegExp(r"^(?=.?[A-Z])(?=.?[a-z])(?=.?[0-9])(?=.?[#?!@$%^&*-]).{8,}$")
        .hasMatch(password);

    /*At least one upper case English letter, (?=.?[A-Z])
    At least one lower case English letter, (?=.*?[a-z])
    At least one digit, (?=.*?[0-9])
    At least one special character, (?=.?[#?!@$%^&-])
    Minimum eight in length .{8,} (with the anchors)
    @            */
  }
}
