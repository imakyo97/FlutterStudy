import 'package:chat/references.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final postsProvider = StreamProvider((ref) {
  return postsReference.orderBy('createdAt').snapshots();
});
