import 'package:bloc/bloc.dart';

class MyBlocObserver implements BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    print('Bloc ${bloc.runtimeType} has changed state: $change');
  }

  @override
  void onClose(BlocBase bloc) {
    print('Bloc ${bloc.runtimeType} is closed');
  }

  @override
  void onCreate(BlocBase bloc) {
    print('Bloc ${bloc.runtimeType} is created');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print('Error in Bloc ${bloc.runtimeType}: $error\nStackTrace: $stackTrace');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    print('Bloc ${bloc.runtimeType} received event: $event');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    print('Bloc ${bloc.runtimeType} transitioned: $transition');
  }
}
