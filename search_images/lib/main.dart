import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:search_images/model/pixabay_info.dart';
import 'package:search_images/provider/pixabay_provider.dart';
import 'package:share_plus/share_plus.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
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

class SearchImagePage extends ConsumerStatefulWidget {
  const SearchImagePage({Key? key}) : super(key: key);

  @override
  SearchImagePageState createState() => SearchImagePageState();
}

class SearchImagePageState extends ConsumerState<SearchImagePage> {
  void didTapImage(
      {required List<PixabayInfo> hits, required int index}) async {
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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(pixabayProvider.notifier).fetchPixabayImages('月');
    });
  }

  @override
  Widget build(BuildContext context) {
    final pixabayImages = ref.watch(pixabayProvider);
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
            ref.read(pixabayProvider.notifier).fetchPixabayImages(value);
          },
        ),
      ),
      body: Stack(
        children: [
          GridView.builder(
            itemCount: (pixabayImages.value?.hits ?? []).length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemBuilder: ((context, index) {
              if ((pixabayImages.value?.hits ?? [])[index].previewURL != null) {
                return InkWell(
                  onTap: () => didTapImage(
                      hits: (pixabayImages.value?.hits ?? []), index: index),
                  child: ImageItem(
                    hits: (pixabayImages.value?.hits ?? []),
                    index: index,
                  ),
                );
              }
              return const SizedBox();
            }),
          ),
          if (pixabayImages.isLoading)
            const Center(child: CircularProgressIndicator()),
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
