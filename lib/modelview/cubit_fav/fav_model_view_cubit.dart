import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:shop_app/models/dummy_data/bags.dart';

part 'fav_model_view_state.dart';

class FavModelViewCubit extends Cubit<FavModelViewState> {
  FavModelViewCubit() : super(FavModelViewInitial());

  Map<int, bool> favStatus =
      {}; // Map to store favorite status for each BagModel

  void changeFav(int bagId) {
    favStatus[bagId] = !(favStatus[bagId] ?? false);
    emit(ChangeFavState());
    if (favStatus[bagId] == true) {
      bagsFav.add(bags[bagId]);
      emit(AddedFavState());
    } else {
      bagsFav.removeWhere((bag) => bag.id == bagId);
      emit(RemovedFavState());
    }
  }
}
