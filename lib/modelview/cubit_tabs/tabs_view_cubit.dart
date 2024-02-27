import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'tabs_view_state.dart';

class TabsViewCubit extends Cubit<TabsViewState> {
  TabsViewCubit() : super(TabsViewInitial());
  int index = 0;
  set setIndex(int i) {
    emit(TabsChangedState());
    index = i;
  }

  int getIndex() {
    return index;
  }
}
