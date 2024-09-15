import 'package:kewsa/imports_bindings.dart';

// part 'dashboard_state.dart';

class DashboardCubit extends Cubit<int> {
  DashboardCubit() : super(0);

  void change(int index) {
    emit(index);
  }
}
