import 'package:salahly_models/models/towProvider.dart';
import 'package:salahly_models/models/client.dart';
import 'package:salahly_models/models/location.dart';
import 'package:salahly_models/models/mechanic.dart';
import 'package:salahly_models/models/report.dart';
import 'package:salahly_models/models/car.dart';

enum RequestType { RSA, WSA, TTA }

class RSA {
  RSAStates _state = RSAStates.created;
  CustomLocation? _location; // lazm yt2sm le long w lat
  String? _rsaID;
  Report? _report;
  Car? _car;

  ///
  RequestType? _requestType;

  ///
  String? _problemDescription;
  Client? _user;
  TowProvider? _towProvider;
  Mechanic? _mechanic;
  DateTime? _estimatedTime;

  ///
  List<Mechanic>? _nearbyMechanics; // not included in FB
  List<TowProvider>? _nearbyProviders; // not included in FB

  CustomLocation? _dropOffLocation;

  ///
  RSA({
    Report? report,
    Mechanic? mechanic,
    TowProvider? towProvider,
    RSAStates? state,
    String? problemDescription,
    List<Mechanic>? nearbyMechanics,
    List<TowProvider>? nearbyProviders,
    CustomLocation? location,
    String? rsaID,
    Client? user,
    DateTime? estimatedTime,
    CustomLocation? dropOffLocation,
    Car? car,
    RequestType? requestType,
  }) {
    _report = report ?? _report;
    _mechanic = mechanic ?? _mechanic;
    _towProvider = towProvider ?? _towProvider;
    _state = state ?? _state;
    _problemDescription = problemDescription ?? problemDescription;
    _nearbyMechanics = nearbyMechanics ?? _nearbyMechanics;
    _nearbyProviders = nearbyProviders ?? _nearbyProviders;
    _location = location ?? _location;
    _rsaID = rsaID ?? _rsaID;
    _user = user ?? _user;
    _estimatedTime = estimatedTime ?? _estimatedTime;
    _dropOffLocation = dropOffLocation ?? _dropOffLocation;
    _car = car ?? _car;
    _requestType = requestType ?? _requestType;
  }

  RSA copyWith({
    Report? report,
    Mechanic? mechanic,
    TowProvider? provider,
    RSAStates? state,
    String? problemDescription,
    List<Mechanic>? nearbyMechanics,
    List<TowProvider>? nearbyProviders,
    CustomLocation? location,
    String? rsaID,
    Client? user,
    DateTime? estimatedTime,
    CustomLocation? dropOffLocation,
    Car? car,
    RequestType? requestType,
  }) =>
      RSA(
        report: report ?? _report,
        mechanic: mechanic ?? _mechanic,
        towProvider: provider ?? _towProvider,
        state: state ?? _state,
        problemDescription: problemDescription ?? _problemDescription,
        nearbyMechanics: nearbyMechanics ?? _nearbyMechanics,
        nearbyProviders: nearbyProviders ?? _nearbyProviders,
        location: location ?? _location,
        rsaID: rsaID ?? _rsaID,
        user: user ?? _user,
        estimatedTime: estimatedTime ?? _estimatedTime,
        dropOffLocation: dropOffLocation ?? _dropOffLocation,
        car: car ?? _car,
        requestType: requestType ?? _requestType,
      );

  //Getters
  CustomLocation? get location => _location;

  String? get problemDescription => _problemDescription;

  Client? get user => _user;

  TowProvider? get towProvider => _towProvider;

  Mechanic? get mechanic => _mechanic;

  DateTime? get estimatedTime => _estimatedTime;

  List<Mechanic>? get nearbyMechanics => _nearbyMechanics;

  List<TowProvider>? get nearbyProviders => _nearbyProviders;

  RequestType? get requestType => _requestType;

  RSAStates get state => _state;

  String? get rsaID => _rsaID;

  CustomLocation? get dropOffLocation => _dropOffLocation;

  Car? get car => _car;

  Report? get report => _report;

  static String stateToString(RSAStates state) {
    return (state.toString()).isNotEmpty
        ? (state.toString()).substring(10)
        : "";
    // deletes "RSAStates." at the beginning
  }

  static String requestTypeToString(RequestType requestType) {
    return (requestType.toString()).isNotEmpty
        ? (requestType.toString().substring(12))
        : "";
  }

  static RequestType? stringToRequestType(String id) {
    if (id == RSA.requestTypeToString(RequestType.RSA)) {
      return RequestType.RSA;
    } else if (id == RSA.requestTypeToString(RequestType.WSA)) {
      return RequestType.WSA;
    } else if (id == RSA.requestTypeToString(RequestType.TTA)) {
      return RequestType.TTA;
    }
    return null;
  }

  static RSAStates stringToState(String id) {
    if (id == RSA.stateToString(RSAStates.waitingForMechanicResponse)) {
      return RSAStates.waitingForMechanicResponse;
    } else if (id == RSA.stateToString(RSAStates.waitingForProviderResponse)) {
      return RSAStates.waitingForProviderResponse;
    } else if (id == RSA.stateToString(RSAStates.requestingRSA)) {
      return RSAStates.requestingRSA;
    } else if (id == RSA.stateToString(RSAStates.failedToRequestRSA)) {
      return RSAStates.failedToRequestRSA;
    } else if (id == RSA.stateToString(RSAStates.created)) {
      return RSAStates.created;
    } else if (id == RSA.stateToString(RSAStates.done)) {
      return RSAStates.done;
    } else if (id == RSA.stateToString(RSAStates.mechanicConfirmed)) {
      return RSAStates.mechanicConfirmed;
    } else if (id == RSA.stateToString(RSAStates.providerConfirmed)) {
      return RSAStates.providerConfirmed;
    } else if (id == RSA.stateToString(RSAStates.waitingForArrival)) {
      return RSAStates.waitingForArrival;
    } else if (id == RSA.stateToString(RSAStates.confirmedArrival)) {
      return RSAStates.confirmedArrival;
    }
    return RSAStates.canceled;
  }
}
/*
 RSA_refactored
  RSA_state_management_and_RSA_confirmation_screen_v1
  for_sergi
  main
  my-location-feature
  my-location-incomplete
  nearby_locations
  nearby_locations+create_RSA

 */

enum RSAStates {
  canceled,

  // searchingForNearbyMechanic,// started searching                               App state
  // userChoosingMechanic,// list loaded (at least 1) and user choosing            App state
  // userChoseMechanic,// chose mechanic                                           RSA state
  // searchingForNearbyProvider,// started searching                               App state
  // userChoosingProvider,// list loaded (at least 1) and user choosing            App state
  // userChoseProvider,// chose provider                                           RSA state

  requestingRSA,
  failedToRequestRSA,
  created, // created RSA on DB

  waitingForMechanicResponse, //
  mechanicConfirmed,
  waitingForProviderResponse,
  providerConfirmed,
  waitingForArrival,
  confirmedArrival,
  done
}
