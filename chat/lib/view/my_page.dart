import 'package:chat/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

class MyPage extends ConsumerWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider).value;
    return Scaffold(
      appBar: AppBar(title: const Text('マイページ')),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(user?.photoURL ?? ''),
              radius: 40,
            ),
            Text(
              user?.displayName ?? '',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerLeft,
              child: Text('ユーザーID：${user?.uid ?? ''}'),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text('登録日：${user?.metadata.creationTime ?? ''}'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => didTapSignOut(
                ref,
                Navigator.of(context),
              ),
              child: const Text('サインアウト'),
            ),
          ],
        ),
      ),
    );
  }

  void didTapSignOut(WidgetRef ref, NavigatorState navigator) async {
    await GoogleSignIn().signOut();
    await ref.read(firebaseAuthProvider).signOut();
    navigator.pop();
  }
}
