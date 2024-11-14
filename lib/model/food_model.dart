class FoodModel {
  final String name;
  final String imgurl;
  final String category;
  final int price;
  final String description;
  final String portionSize;
  final String ingredients;

  FoodModel(
      {required this.name,
      required this.imgurl,
      required this.category,
      required this.price,
      required this.description,
      required this.portionSize,
      required this.ingredients});
}
