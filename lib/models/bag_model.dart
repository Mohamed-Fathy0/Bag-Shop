// ignore_for_file: public_member_api_docs, sort_constructors_first
class BagModel {
  final int id;
  final String name;
  final String image;
  final String description;
  bool isFav;
  final int price;
  BagModel({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    this.isFav = false,
    required this.price,
  });
}
