enum ParkingSessionStatus {
  ACTIVE,
  COMPLETED,
  CANCELLED,
  EXPIRED,
  VIOLATION,
}

extension ParkingSessionStatusExtension on ParkingSessionStatus {
  /// Description text equivalent to your Java enum descriptions
  String get description {
    switch (this) {
      case ParkingSessionStatus.ACTIVE:
        return "Active parking session";
      case ParkingSessionStatus.COMPLETED:
        return "Completed parking session";
      case ParkingSessionStatus.CANCELLED:
        return "Cancelled parking session";
      case ParkingSessionStatus.EXPIRED:
        return "Expired parking session";
      case ParkingSessionStatus.VIOLATION:
        return "Parking violation detected";
    }
  }

  /// Equivalent of Java isActive()
  bool get isActive => this == ParkingSessionStatus.ACTIVE;

  /// Equivalent of Java isCompleted()
  bool get isCompleted => this == ParkingSessionStatus.COMPLETED;

  /// Equivalent of Java isTerminated()
  bool get isTerminated =>
      this == ParkingSessionStatus.COMPLETED ||
      this == ParkingSessionStatus.CANCELLED ||
      this == ParkingSessionStatus.EXPIRED ||
      this == ParkingSessionStatus.VIOLATION;
}
