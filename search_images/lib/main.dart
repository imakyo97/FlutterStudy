import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:search_images/api/api_client.dart';
import 'package:search_images/model/pixabay_info.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SearchImagePage(),
    );
  }
}

class SearchImagePage extends StatefulWidget {
  const SearchImagePage({super.key});

  @override
  State<SearchImagePage> createState() => _SearchImagePageState();
}

class _SearchImagePageState extends State<SearchImagePage> {
  List<PixabayInfo> hits = [];

  void featchImage({String q = '月'}) async {
    final pixabayImages = await ApiClient(dio: Dio()).fetchPixabayImages(q: q);
    setState(() {
      hits = pixabayImages.hits;
    });
  }

  @override
  void initState() {
    super.initState();
    featchImage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.all(10),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
          ),
          onSubmitted: (value) {
            featchImage(q: value);
          },
        ),
      ),
      body: GridView.builder(
        itemCount: hits.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: ((context, index) {
          if (hits[index].previewURL != null) {
            return Image.network(
              hits[index].previewURL!,
              fit: BoxFit.cover,
            );
          }
          return const SizedBox();
        }),
      ),
    );
  }
}
