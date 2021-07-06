import 'package:flutter_relive_klearningpro/models/ProductsModel.dart';

class BrandModel {
  int count;
  String next;
  String previous;
  List<Results> results;

  BrandModel({required this.count, required this.next, required this.previous, required this.results});


/*  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['next'] = this.next;
    data['previous'] = this.previous;
    if (this.results != null) {
      data['results'] = this.results.map((v) => v.toJson()).toList();
    }
    return data;
  }
}



class Results {
  String name;
  String slug;
  String imageUrl;

  Results({required this.name, required this.slug, required this.imageUrl});

  Results.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    slug = json['slug'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['image_url'] = this.imageUrl;
    return data;
  }

 */
}
