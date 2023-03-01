import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:search_images/api/api_client.dart';
import 'package:search_images/model/pixabay_info.dart';
import 'package:share_plus/share_plus.dart';

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
  bool isLoding = false;

  void featchImage({String q = '月'}) async {
    setState(() {
      isLoding = true;
    });
    ApiClient(dio: Dio()).fetchPixabayImages(q: q).then(
      (pixabayImages) {
        setState(() {
          isLoding = false;
          hits = pixabayImages.hits;
        });
      },
    );
  }

  void didTapImage({required int index}) async {
    if (hits[index].previewURL != null) {
      final imageURL = hits[index].previewURL!;
      final imageBytes =
          (await NetworkAssetBundle(Uri.parse(imageURL)).load(imageURL))
              .buffer
              .asUint8List();
      final xFile = XFile.fromData(imageBytes);
      await Share.shareXFiles([xFile], text: 'Image Shared');
    }
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
      body: Stack(
        children: [
          GridView.builder(
            itemCount: hits.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemBuilder: ((context, index) {
              if (hits[index].previewURL != null) {
                return InkWell(
                  onTap: () => didTapImage(index: index),
                  child: ImageItem(
                    hits: hits,
                    index: index,
                  ),
                );
              }
              return const SizedBox();
            }),
          ),
          if (isLoding) const Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }
}

class ImageItem extends StatelessWidget {
  const ImageItem({
    Key? key,
    required this.hits,
    required this.index,
  }) : super(key: key);

  final List<PixabayInfo> hits;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.network(
          hits[index].previewURL!,
          fit: BoxFit.cover,
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Container(
            color: Colors.white,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.thumb_up_alt_outlined,
                  size: 16,
                ),
                Text(
                  hits[index].likes.toString(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
