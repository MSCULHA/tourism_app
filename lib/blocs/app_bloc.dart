import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tourism_app/api/services.dart';
import 'package:tourism_app/blocs/bloc_provider.dart';
import 'package:tourism_app/model/content.dart';

class AppBloc implements BlocBase {
  FirebaseService firebaseService;
  List<String> contents = List();
  StreamController<List<String>> contentsController = StreamController<List<String>>();
  StreamSink<List<String>> get addContentsList => contentsController.sink;
  Stream<List<String>> get contentsStream => contentsController.stream;

String category;
  AppBloc() {
    firebaseService = FirebaseService();

    firebaseService.getContent().listen((event) {
      print('content updated from firestore');
      addContent(event.documents);
    });
  }

  addContent(List<DocumentSnapshot> snapshots) {
    contents?.clear();
    for (int i = 0; i < snapshots.length; i++) {
      final Content content = Content.fromSnapshot(snapshots[i]);
      contents.add(content.contentName);
    }
    addContentsList.add(contents);
  }


  @override
  void dispose() {
    print('disposed app bloc');
    contentsController.close();
  }
}


