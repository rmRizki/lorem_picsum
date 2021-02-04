class Photo {
  int id;
  String author;
  int width;
  int height;
  String url;
  String downloadUrl;

  Photo({
    this.id,
    this.author,
    this.width,
    this.height,
    this.url,
    this.downloadUrl,
  });

  Photo.fromJson(Map<String, dynamic> json) {
    id = int.parse(json['id']);
    author = json['author'];
    width = json['width'];
    height = json['height'];
    url = json['url'];
    downloadUrl = json['download_url'];
  }
}
