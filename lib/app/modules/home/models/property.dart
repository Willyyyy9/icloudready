class Property {
  final int id;
  final String name;
  final String status;
  final String address;
  final String image;
  final int numberOfRooms;
  final int numberOfBathrooms;
  final int area;
  final String type;
  final int price;

  Property({
    required this.id,
    required this.name,
    required this.status,
    required this.address,
    required this.image,
    required this.numberOfRooms,
    required this.numberOfBathrooms,
    required this.area,
    required this.type,
    required this.price,
  });

  factory Property.fromJson(Map<String, dynamic> json) {
    return Property(
      id: json['id'] as int,
      name: json['name'] as String,
      status: json['status'] as String,
      address: json['address'] as String,
      image: json['image'] as String,
      numberOfRooms: json['number_of_rooms'] as int,
      numberOfBathrooms: json['number_of_bathrooms'] as int,
      area: json['area'] as int,
      type: json['type'] as String,
      price: json['price'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'status': status,
      'address': address,
      'image': image,
      'number_of_rooms': numberOfRooms,
      'number_of_bathrooms': numberOfBathrooms,
      'area': area,
      'type': type,
      'price': price,
    };
  }
}
