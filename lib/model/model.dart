import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


Firestore _firestore = Firestore.instance;




Future<QuerySnapshot> getAllDocuments() {
  return _firestore.collection('smartphone').getDocuments();
}
