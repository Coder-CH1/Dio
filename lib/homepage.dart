import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Gridhomepage extends StatefulWidget {
  const Gridhomepage({Key? key}) : super(key: key);

  @override
  State<Gridhomepage> createState() => _GridhomepageState();
}

class _GridhomepageState extends State<Gridhomepage> {
  List<String> catImages = [];

  @override
  void initState() {
    super.initState();
    fetchCatImages().then((images) {
      setState(() {
        catImages = images;
      });
    });
  }

  Future<List<String>> fetchCatImages() async {
    final String apiUrl = 'https://api.thecatapi.com/v1/breeds';

    try {
      Dio dio = Dio();
      Response response = await dio.get(apiUrl);
      if (response.statusCode == 200) {
        List<dynamic> breedsData = response.data;
        List<String> imageUrls = breedsData
            .map((breed) => breed['image'] != null ? breed['image']['url'] : null)
            .where((url) => url != null)
            .cast<String>()
            .toList();
        return imageUrls;
      } else {
        print('Failed to fetch cat images. Status code: ${response.statusCode}');
        return [];
      }
    } catch (error) {
      print('Error: $error');
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Pix Gallerie"),
        ),
        body: Container(
          color: Colors.grey,
          child: GridView.count(
            crossAxisCount: 3,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            padding: EdgeInsets.all(10.0),
            children: List.generate(catImages.length, (index) {
              return CachedNetworkImage(
                imageUrl: catImages[index],
                fit: BoxFit.cover,
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              );
            }),
          ),
        ),
      ),
    );
  }
}
