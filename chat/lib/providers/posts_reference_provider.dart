import 'package:chat/model/post.dart';
import 'package:chat/providers/firestore_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final postsReferenceProvider = Provider((ref) {
  final firestore = ref.read(firestoreProvider);
  return firestore.collection('post').withConverter(
        fromFirestore: (snapshot, _) => Post.fromFirestore(snapshot),
        toFirestore: (post, _) => post.toMap(),
      );
});
