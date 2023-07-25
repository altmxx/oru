// ignore_for_file: public_member_api_docs, sort_constructors_first
class Product {
  String id;
  String deviceCondition;
  String storage;
  String imageUrl;
  String location;
  String model;
  String listingDate;
  String price;

  Product({
    required this.id,
    required this.deviceCondition,
    required this.storage,
    required this.imageUrl,
    required this.location,
    required this.model,
    required this.listingDate,
    required this.price,
  });

  factory Product.fromJson(json) {
    return Product(
        id: json['_id'],
        deviceCondition: json['deviceCondition'],
        storage: json['deviceStorage'],
        imageUrl: json['defaultImage']['fullImage'],
        location: json['listingLocation'],
        model: json['model'],
        listingDate: json['listingDate'],
        price: json['listingNumPrice']);
  }
}
