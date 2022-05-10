import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'navigator_bar_state.dart';

class NavigatorBarCubit extends Cubit<NavigatorBarState> {
  NavigatorBarCubit() : super(NavigatorBarInitial());
}
