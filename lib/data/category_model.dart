class CategoryModel{
  final int? id;
  final String? title;
  final String? description;
  final String? image;
  final String url;

  const CategoryModel({this.id, this.title, this.description, this.image, required this.url});

  @override
  bool operator ==(Object other) {
    if(identical(this, other)) return true;
    return other is CategoryModel && other.url == url;
  }

  @override
  int get hashCode => url.hashCode;

}