import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:shop_app/models/bag_model.dart';
import 'package:shop_app/models/dummy_data/bags.dart'; // تأكد من أن المسار صحيحاً

part 'cart_model_view_state.dart';

class CartModelViewCubit extends Cubit<CartModelViewState> {
  CartModelViewCubit() : super(CartModelViewInitial());

  // Map to store favorite status for each BagModel
  Map<int, bool> cartStatus = {};

  // Map to store the number of each item in the cart
  Map<int, int> itemNumbersMap = {};

  // قم بتعريف القائمة بشكل صحيح وملء البيانات عند الحاجة
  List<BagModel> cartItems = [];

  List fetchCart() {
    return bagsCart; // استخدم bags بدلاً من bagsCart إذا لزم الأمر
  }

  void changeCart(int bagId) {
    cartStatus[bagId] = !(cartStatus[bagId] ?? false);
    emit(ChangeCartState());
    if (cartStatus[bagId] == true) {
      // استخدم bags بدلاً من bagsCart إذا لزم الأمر
      bagsCart.add(bags[bagId]);
      emit(AddedCartState());
    } else {
      bagsCart.removeWhere((bag) => bag.id == bagId);
      emit(RemovedCartState());
    }
  }

  void removeCart(int bagId) {
    bagsCart.removeWhere((bag) => bag.id == bagId);
    cartStatus[bagId] = !(cartStatus[bagId] ?? false);
    itemNumbersMap.remove(bagId); // Remove item number when removing from cart
    emit(RemovedCartState());
    print("object");
  }

  int getItemNumber(int bagId) {
    return itemNumbersMap[bagId] ?? 1; // Default to 1 if not found
  }

  void incrementItems(int bagId) {
    itemNumbersMap[bagId] = (itemNumbersMap[bagId] ?? 1) + 1;
    emit(IncrementItemsState());
  }

  void decrementItems(int bagId) {
    final currentCount = itemNumbersMap[bagId] ?? 1;
    if (currentCount > 1) {
      itemNumbersMap[bagId] = currentCount - 1;
      emit(DecrementItemsState());
    }
  }
}
