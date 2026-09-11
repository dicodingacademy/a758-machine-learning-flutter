class HouseDetail {
  final double floors;
  final double bedrooms;
  final double bathrooms;
  final double sqftLot;

  HouseDetail({
    required this.floors,
    required this.bedrooms,
    required this.bathrooms,
    required this.sqftLot,
  });

  List<double> get values => [floors, bedrooms, bathrooms, sqftLot];

  @override
  String toString() {
    return 'HouseDetail(floors: $floors, bedrooms: $bedrooms, bathrooms: $bathrooms, sqftLot: $sqftLot)';
  }
}
