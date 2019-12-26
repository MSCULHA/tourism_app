import 'package:cloud_firestore/cloud_firestore.dart';


class Content {


  final String cityName;

  Content.fromMap(Map<String, dynamic> map)
        :
         assert(map['cityName'] != null),


        cityName = map['cityName'];

  Content.fromSnapshot(DocumentSnapshot snapshot) : this.fromMap(snapshot.data);

}


