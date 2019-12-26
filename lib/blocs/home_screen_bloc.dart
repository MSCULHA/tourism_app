import 'dart:async';

import 'package:tourism_app/blocs/bloc_provider.dart';
import 'package:rxdart/rxdart.dart';

class HomeScreenBloc implements BlocBase {

  StreamController<bool> contentSelectedController = PublishSubject<bool>();

  Function(bool) get updateFlightSelection => contentSelectedController.sink.add;

  Stream<bool> get isFlightSelectedStream => contentSelectedController.stream;

  @override
  void dispose() {
    print('disposed home screen bloc');
    contentSelectedController.close();
  }
}