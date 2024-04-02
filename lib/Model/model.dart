
class Breed {
  final String name;
  final BreedImage? image;

  Breed({
    required this.name,
    this.image,
  });

  factory Breed.fromJson(Map<String, dynamic> json) {
    return Breed(
      name: json['name'],
      image: json['image'] != null ? BreedImage.fromJson(json['image']) : null,
    );
  }
}

class BreedImage {
  final String? url;
  final int? height;
  final String? id;
  final int? width;

  BreedImage({
    this.url,
    this.height,
    this.id,
    this.width,
  });

  factory BreedImage.fromJson(Map<String, dynamic> json) {
    return BreedImage(
      url: json['url'],
      height: json['height'],
      id: json['id'],
      width: json['width'],
    );
  }
}

typedef CatBreed = List<Breed>;

