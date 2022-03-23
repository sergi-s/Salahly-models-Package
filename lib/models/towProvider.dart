import 'package:salahly_models/abstract_classes/user.dart';
import 'package:salahly_models/models/location.dart';

class TowProvider extends UserType {
  String? nationalID;
  bool? isAccepted;
  double? rating;
  bool? isAvailable;

  List<TowDriver> towDriver = [];

  TowProvider({
    String? name,
    required String? email,
    this.rating,
    String? id,
    DateTime? birthDay,
    String? createdDate,
    AccountState? userState,
    Gender? gender,
    Type? type,
    String? avatar,
    String? address,
    String? phoneNumber,
    CustomLocation? loc,
    this.isAccepted,
    this.nationalID,
  }) : super(
            name: name,
            email: email,
            id: id,
            birthDay: birthDay,
            createdDate: createdDate,
            state: userState,
            gender: gender,
            type: type,
            avatar: avatar,
            loc: loc,
            phoneNumber: phoneNumber);

  @override
  set setPassword(String value) {
    super.setPassword = value;
  }

  @override
  bool isValid() {
    return (super.isValid() && nationalIDValidate(nationalID!));
  }

  // Validation
  bool nationalIDValidate(String id) {
    return id.length > 0;
  }
}

class TowDriver {
  String nationalID;
  bool isAccepted;
  String name;
  DateTime hireDate;

  TowDriver(this.nationalID, this.isAccepted, this.name, this.hireDate);
}
