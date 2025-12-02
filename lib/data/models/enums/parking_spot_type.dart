import 'package:json_annotation/json_annotation.dart';

@JsonEnum(alwaysCreate: true)
enum ParkingSpotType {
  @JsonValue("STANDARD")
  standard,

  @JsonValue("HANDICAP")
  handicap,

  @JsonValue("ELECTRIC_VEHICLE")
  electricVehicle,

  @JsonValue("MOTORCYCLE")
  motorcycle,

  @JsonValue("TRUCK")
  truck,

  @JsonValue("LOADING_ZONE")
  loadingZone,

  @JsonValue("TIME_LIMITED")
  timeLimited,

  @JsonValue("RESERVED")
  reserved,
}

extension ParkingSpotTypeExtension on ParkingSpotType {
  String get description {
    switch (this) {
      case ParkingSpotType.standard:
        return "Standard parking spot";
      case ParkingSpotType.handicap:
        return "Accessible parking spot";
      case ParkingSpotType.electricVehicle:
        return "Electric vehicle charging spot";
      case ParkingSpotType.motorcycle:
        return "Motorcycle parking spot";
      case ParkingSpotType.truck:
        return "Truck parking spot";
      case ParkingSpotType.loadingZone:
        return "Loading zone";
      case ParkingSpotType.timeLimited:
        return "Time-limited parking spot";
      case ParkingSpotType.reserved:
        return "Reserved parking spot";
    }
  }
}
