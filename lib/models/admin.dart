import 'package:salahly_models/abstract_classes/user.dart';
import 'package:salahly_models/models/location.dart';
import 'package:salahly_models/models/car.dart';

class Admin extends UserType {
  Map<String, bool>? accessPrivilege = {};

  Admin({
    String? name,
    String? email,
    String? id,
    DateTime? birthDay,
    DateTime? createdDate,
    AccountState? userState,
    Gender? gender,
    Type? type,
    String? avatar,
    CustomLocation? loc,
    String? phoneNumber,
    List<Car>? cars,
    String? address,
    Map<String, bool>? accessPrivilege,
  }) : super(
            name: name,
            email: email,
            id: id,
            birthDay: birthDay,
            createdDate: createdDate,
            userState: userState,
            gender: gender,
            type: type,
            avatar: avatar,
            loc: loc,
            phoneNumber: phoneNumber,
            address: address);

  Admin copyWith({
    String? name,
    String? email,
    String? id,
    DateTime? birthDay,
    DateTime? createdDate,
    AccountState? userState,
    Gender? gender,
    Type? type,
    String? avatar,
    CustomLocation? loc,
    String? phoneNumber,
    List<Car>? cars,
    String? address,
    Map<String, bool>? accessPrivilege,
  }) =>
      Admin(
        name: name ?? this.name,
        email: email ?? this.email,
        id: id ?? this.id,
        birthDay: birthDay ?? this.birthDay,
        createdDate: createdDate ?? this.createdDate,
        userState: userState ?? this.userState,
        gender: gender ?? this.gender,
        type: type ?? this.type,
        avatar: avatar ?? this.avatar,
        loc: loc ?? this.loc,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        address: address ?? this.address,
        accessPrivilege: accessPrivilege ?? this.accessPrivilege,
      );

  @override
  bool isValid() {
    return (super.isValid()
        // && subscriptionValidate(subscription)
        );
  }

  // Validation
  bool subscriptionValidate(int subscription) {
    return subscription > 0;
  }
}
