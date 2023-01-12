import 'package:smart_spoon_app/models/data.dart';

abstract class DataState {}

class InitDataState extends DataState {}

class LoadingDataState extends DataState {}

class ErrorDataState extends DataState {
  final String message;
  ErrorDataState(this.message);
}

class ResponseDataState extends DataState {
  List<Data> data;
  ResponseDataState(this.data);
}
