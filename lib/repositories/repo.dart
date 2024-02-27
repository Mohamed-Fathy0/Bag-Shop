import 'package:shop_app/models/bag_model.dart';
import 'package:shop_app/models/dummy_data/bags.dart';

abstract class BagRepository {
  get();
}

class DummyBagRepository implements BagRepository {
  @override
  List<BagModel> get() {
    // Return dummy bags data
    return bags;
  }
}

class APiBagRepository implements BagRepository {
  @override
  Future<List<BagModel>> get() {
    return Future.delayed(const Duration(seconds: 1), () {
      return [
        BagModel(
          id: 0,
          name: "bag 1",
          image: "api_url/bag1.jpg",
          price: 50,
          description: "This is bag 1",
        ),
        // Add more bags here...
      ];
    });
  }
}
