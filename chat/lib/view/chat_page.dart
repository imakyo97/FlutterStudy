import 'package:chat/main.dart';
import 'package:chat/model/post.dart';
import 'package:chat/view/my_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const MyPage();
                  },
                ),
              );
            },
            child: CircleAvatar(
              backgroundImage:
                  NetworkImage(FirebaseAuth.instance.currentUser!.photoURL!),
            ),
          )
        ],
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
                    return PostWidget(post: post);
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

class PostWidget extends StatelessWidget {
  const PostWidget({
    Key? key,
    required this.post,
  }) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(
              post.posterImageUrl,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      post.posterName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      DateFormat('MM/dd HH:mm').format(post.createdAt.toDate()),
                      style: const TextStyle(fontSize: 10),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: FirebaseAuth.instance.currentUser!.uid ==
                                post.posterId
                            ? Colors.amber[100]
                            : Colors.blue[100],
                      ),
                      child: Text(post.text),
                    ),
                    if (FirebaseAuth.instance.currentUser!.uid == post.posterId)
                      IconButton(
                        onPressed: () {
                          // 削除は reference に対して delete() を呼ぶだけでよい。
                          post.reference.delete();
                        },
                        icon: const Icon(Icons.delete),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
