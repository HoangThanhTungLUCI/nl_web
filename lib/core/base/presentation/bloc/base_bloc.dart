import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

class BaseBloc<E, S> extends Bloc<E, S> {
  BaseBloc(S initialState) : super(initialState);

  final PublishSubject<Object> _onAppErrorController = PublishSubject();

  Stream<Object> get onAppError => _onAppErrorController.stream;

  Sink<Object> get onAppErrorSink => _onAppErrorController.sink;

  @override
  Future<void> close() {
    _onAppErrorController.close();
    return super.close();
  }
}
