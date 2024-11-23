
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:networking/Model/model.dart';

class GridHomePage extends StatefulWidget {
  const GridHomePage({Key? key}) : super(key: key);

  @override
  State<GridHomePage> createState() => _GridHomePageState();
}

class _GridHomePageState extends State<GridHomePage> {
  List<Welcome> catImages = [];
  @override
  void initState() {
    super.initState();
    fetchRandomCatImages().then((images){
      if (images != null) {
        setState(() {
          catImages = images;
        });
      } else {

      }
    });
  }
  Future<List<Welcome>?> fetchRandomCatImages() async {
    String url = "https://api.thecatapi.com/v1/images/search?limit=30";
    try {
      Dio dio = Dio();
      Response response = await dio.get(url);
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        List<Welcome> images = data.map((item) => Welcome.fromJson(item)).toList();
        return images;
      } else {
        return null;
      }
    } catch (error){
      return null;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cat Images Gallerie"),
      ),
          body: Container(
            color: Colors.brown,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10.0,
                childAspectRatio: 1,
              ),
              padding: const EdgeInsets.all(10.0),
              itemCount: catImages.length,
              itemBuilder: (context, index) {
                return CachedNetworkImage(imageUrl: catImages[index].url,
                fit: BoxFit.cover,
                 placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                 errorWidget: (context, url, error) => const Icon(Icons.error),
                );
              }
            ),
          ),
    );
  }
}
