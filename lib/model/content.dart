import 'package:cloud_firestore/cloud_firestore.dart';


class Content {
  final String contentName;
  final String contentImage;
  final bool isPremium;
  final String contentDescription;
  final List contentText;
  final String content1;
  final List tipContent;
  final List todoContent;
  final List  sight;
  final List cultures;
  final List localDished;
  final List culture;

  Content.fromMap(Map<String, dynamic> map)
      :assert(map['isPremium'] != null),
        assert(map['contentDescription'] != null),
        assert(map['contentImage'] != null),
        assert(map['tipContent'] != null),
        assert(map['contentName'] != null),
        assert(map['todo'] != null),
        assert(map['contentText'] != null),
        assert(map['Sightseeing'] != null),
        assert(map['Local Dished'] != null),
        assert(map['Social Areas'] != null),
        assert(map['Cultural Activities'] != null),




      content1 = map['tipContent1'],
        isPremium = map['isPremium'],
        contentDescription = map['contentDescription'],
        contentImage = map['contentImage'],
        contentName = map['contentName'],
        contentText = map['contentText'],
        todoContent = map['todo'],
        tipContent = map['tipContent'],
        sight = map['Sightseeing'],
        cultures = map['Social Areas'],
        culture = map['Cultural Activities'],
        localDished = map['Local Dished'];

  Content.fromSnapshot(DocumentSnapshot snapshot) : this.fromMap(snapshot.data);

}


