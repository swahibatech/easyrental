class HouseModel {
  final String image;
  final String name;
  final String city;
  final double rating;

  HouseModel({
    required this.image,
    required this.name,
    required this.city,
    required this.rating,
  });
}

List<HouseModel> popular = [
  HouseModel(
    image: 'tsholo.jpg',
    name: 'A 3 Bedroom House',
    city: 'Tsholofelo East ,Gaborone',
    rating: 4.5,
  ),
  HouseModel(
    image: 'm1.jpg',
    name: '5 BedRoom House',
    city: 'Maruapula, Gaborone',
    rating: 4.3,
  ),
];

List<HouseModel> recommendation = [
  HouseModel(
    image: 'block7.jpg',
    name: '3 Bedhouse',
    city: 'Block 8',
    rating: 4.0,
  ),
  HouseModel(
    image: 'mogodi.jpg',
    name: '2 Bedroom House',
    city: 'Mogoditshane',
    rating: 4.1,
  ),
  HouseModel(
    image: '1.jpg',
    name: '3 Bedroom House',
    city: 'Maruapula',
    rating: 4.3,
  ),
];
