class HydraMember {
  int id;
  int eeCatId;
  String name;
  String slug;
  List<dynamic> categoriesItem;

  HydraMember({
    //required this.type,
    required this.id,
    required this.eeCatId,
    required this.name,
    required this.slug,
    required this.categoriesItem,
  });

  factory HydraMember.fromJson(Map<String, dynamic> json) {
    return HydraMember(
      //type: json['@type'],
      id: json['id'],
      eeCatId: json['eeCatId'],
      name: json['name'],
      categoriesItem:
          (json['categories'].map((e) => CategoriesItem.fromJson(e)).toList()),
      slug: json['slug'],
    );
  }
}

class CategoriesItem {
  int id;
  int eeCatId;
  String name;
  String slug;
 // String? imageUrl;
  List<dynamic> categories;

  CategoriesItem({
    required this.id,
    required this.name,
    required this.slug,
    required this.eeCatId,
    // this.imageUrl,
    required this.categories,
  });

  factory CategoriesItem.fromJson(Map<String, dynamic> json) {
    return CategoriesItem(
      name: json['name'],
      id: json['id'],
      slug: json['slug'],
      eeCatId: json['eeCatId'],
      // imageUrl: json['imageUrl'] as String,
      categories:
          (json['categories'].map((e) => Categories.fromJson(e)).toList()),
    );
  }
}

class Categories {
  int id;
  String name;
  String slug;
  int eeCatId;
  // String? imageUrl;

  Categories({
    required this.id,
    required this.name,
    required this.slug,
    required this.eeCatId,
   // this.imageUrl,
  });

  factory Categories.fromJson(Map<String, dynamic> json) {
    return Categories(
      name: json['name'],
      id: json['id'],
      slug: json['slug'],
      eeCatId: json['eeCatId'],
      // imageUrl: json['imageUrl']as String,
    );
  }
}
