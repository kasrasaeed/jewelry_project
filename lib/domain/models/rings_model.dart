import '../abstract_models/rings.dart';

class RingsModel extends Rings {
  RingsModel.fromJson(Map<String, String> jsonData) {
    image = jsonData['product_image_url'];
    name = jsonData['product_name'];
    brand = jsonData['product_brand'];
    price = jsonData['product_price'];
  }
}
