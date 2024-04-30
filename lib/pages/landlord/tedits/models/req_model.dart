class MaintenanceRequest {
  final String name;
  final String profileImage;
  final String description;

  MaintenanceRequest({
    required this.name,
    required this.profileImage,
    required this.description,
  });

  factory MaintenanceRequest.fromMap(Map<String, dynamic> map) {
  return MaintenanceRequest(
    name: map['name'] ?? '',
    profileImage: map['image'] ?? '',
    description: map['description'] ?? '',
  );
}

}
