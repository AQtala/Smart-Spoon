import 'package:bloc/bloc.dart';
import 'package:smart_spoon_app/blocs/data_state.dart';
import 'package:smart_spoon_app/services/data_service.dart';

class DataCubit extends Cubit<DataState> {
  final DataService _dataService;
  DataCubit(this._dataService) : super(InitDataState());

  Future<void> fetchData() async {
    emit(LoadingDataState());
    try {
      final response = await _dataService.getAll();
      emit(ResponseDataState(response));
    } catch (e) {
      print(e);
      emit(ErrorDataState(e.toString()));
    }
  }
}
