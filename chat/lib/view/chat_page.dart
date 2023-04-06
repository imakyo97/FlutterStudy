import 'package:chat/main.dart';
import 'package:chat/model/post.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('チャット'),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot<Post>>(
              stream: postsReference.orderBy('createdAt').snapshots(),
              builder: (context, snapshot) {
                final docs = snapshot.data?.docs ?? [];
                return ListView.builder(
                  itemCount: docs.length,
                  itemBuilder: (context, index) {
                    final post = docs[index].data();
                    return Text(post.text);
                  },
                );
              },
            ),
          ),
          Center(
            child: TextFormField(
              onFieldSubmitted: ((text) {
                final user = FirebaseAuth.instance.currentUser!;

                final posterId = user.uid;
                final posterName = user.displayName!;
                final posterImageUrl = user.photoURL!;

                final newDocumentReference = postsReference.doc();

                final newPost = Post(
                  text: text,
                  createdAt: Timestamp.now(), // 投稿日時は現在とします
                  posterName: posterName,
                  posterImageUrl: posterImageUrl,
                  posterId: posterId,
                  reference: newDocumentReference,
                );

                newDocumentReference.set(newPost);
              }),
            ),
          ),
        ],
      ),
    );
  }
}
