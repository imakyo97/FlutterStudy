import 'package:cloud_firestore/cloud_firestore.dart';

import 'model/post.dart';

final postsReference =
    FirebaseFirestore.instance.collection('post').withConverter(
          fromFirestore: (snapshot, _) => Post.fromFirestore(snapshot),
          toFirestore: (post, _) => post.toMap(),
        );
