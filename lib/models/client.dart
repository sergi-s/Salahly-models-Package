import 'package:salahly_models/abstract_classes/user.dart';
import 'package:salahly_models/models/location.dart';

enum SubscriptionTypes { silver, gold, platinum }

class Client extends UserType {
  SubscriptionTypes subscription = SubscriptionTypes.silver;

  Client({
    String? name,
    required String? email,
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
    required this.subscription,
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

  Map<SubscriptionTypes, double> _subscriptionData = {
    SubscriptionTypes.silver: 4,
    SubscriptionTypes.gold: 50,
    SubscriptionTypes.platinum: 200
  };

  double? getSubscriptionRange() {
    return _subscriptionData.containsKey(subscription)
        ? _subscriptionData[subscription]
        : 0;
  }

  @override
  bool isValid() {
    return (super.isValid());
  }

  // Validation
  bool subscriptionValidate(int subscription) {
    return subscription > 0;
  }
}