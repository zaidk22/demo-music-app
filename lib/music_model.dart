
class Music{
  final String title;
  final String description;
  final String url;
  final String image;
  Music({
    required this.description,
    required this.image,
    required this.title,
    required this.url
});

  static List<Music> songs = [
    Music(description: "description", image: "image", title: "title", url: "url"),
    Music(description: "description", image: "image", title: "title", url: "url"),
    Music(description: "description", image: "image", title: "title", url: "url"),
    Music(description: "description", image: "image", title: "title", url: "url"),
  ];


}