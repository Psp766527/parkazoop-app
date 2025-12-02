import 'package:json_annotation/json_annotation.dart';

part 'parking_spot_status.g.dart';

@JsonEnum(alwaysCreate: true)
enum ParkingSpotStatus {
  @JsonValue("AVAILABLE")
  available,

  @JsonValue("OCCUPIED")
  occupied,

  @JsonValue("RESERVED")
  reserved,

  @JsonValue("MAINTENANCE")
  maintenance,

  @JsonValue("OUT_OF_SERVICE")
  outOfService,

  @JsonValue("BLOCKED")
  blocked,
}

extension ParkingSpotStatusExtension on ParkingSpotStatus {
  String get description {
    switch (this) {
      case ParkingSpotStatus.available:
        return "Available for parking";
      case ParkingSpotStatus.occupied:
        return "Currently occupied";
      case ParkingSpotStatus.reserved:
        return "Reserved for a specific user";
      case ParkingSpotStatus.maintenance:
        return "Under maintenance";
      case ParkingSpotStatus.outOfService:
        return "Temporarily out of service";
      case ParkingSpotStatus.blocked:
        return "Blocked or restricted";
    }
  }

  bool get isAvailable => this == ParkingSpotStatus.available;

  bool get isOccupied =>
      this == ParkingSpotStatus.occupied || this == ParkingSpotStatus.reserved;

  bool get isOperational =>
      this != ParkingSpotStatus.maintenance &&
          this != ParkingSpotStatus.outOfService &&
          this != ParkingSpotStatus.blocked;

  bool get canBeReserved => this == ParkingSpotStatus.available;
}
