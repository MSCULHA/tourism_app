import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class FirebaseService {
  FirebaseService() {
    initFirebase();
  }

  initFirebase() async {
    final FirebaseApp app = await FirebaseApp.configure(
        name: 'TopicRead',
        options: Platform.isIOS
            ? const FirebaseOptions(
          googleAppID: '1:1009830851809:ios:8658d2b8af672428',
          gcmSenderID: '1009830851809',
          databaseURL: 'https://friendly-fire-add84.firebaseio.com',
        )
            : const FirebaseOptions(
          googleAppID: '1:10992283142:android:dabb7de80dbe29493a5d87',
          apiKey: 'AIzaSyA0vB4QrilWpvprIWUlHmyeG-5KJ4c3wps',
          databaseURL: 'https://friendly-fire-add84.firebaseio.com',
        ));
  }



  Stream<QuerySnapshot> getContent() {
    return Firestore.instance.collection('contents').document().collection("city").snapshots();

  }
  Stream<QuerySnapshot> getContents() {
    return Firestore.instance.collection('city').snapshots();

  }

}