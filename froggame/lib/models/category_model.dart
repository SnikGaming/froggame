class Category {
  final String name;
  final String img;
  final int createddate;
  Category({required this.name, required this.img, required this.createddate});

  toJson() {
    return {'name': name, 'img': img, 'createddate': createddate};
  }
}
