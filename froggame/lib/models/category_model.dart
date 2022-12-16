class Category {
  final String name;
  Category({required this.name});

  toJson() {
    return {
      'name': name,
    };
  }
}
