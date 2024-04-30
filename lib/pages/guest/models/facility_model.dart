class FacilityModel {
  final String image;
  final String name;

  FacilityModel({
    required this.image,
    required this.name,
  });
}

List<FacilityModel> modernHouseFacilities = [
  FacilityModel(
    image: 't5.jpg',
    name: 'Led Sitting room',
  ),
  FacilityModel(
    image: 'te.jpg',
    name: 'Kitchen',
  ),
  FacilityModel(
    image: 't4.jpg',
    name: 'Woodern Door',
  ),
];
