class LocationPointModel {
  final double lat;
  final double long;
  final double? zoom;

  LocationPointModel({
    required this.lat,
    required this.long,
    this.zoom,
  });
}
