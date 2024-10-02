class OrderData {
  final int id;
  final String email;
  final String image;
  final String name;
  const OrderData(
      {required this.id,
      required this.email,
      required this.image,
      required this.name});

  factory OrderData.fromJson(Map<String, dynamic> json) {
    return OrderData(
        id: json['id'],
        email: json['email'],
        image: json['image'],
        name: json['name']);
  }
}
