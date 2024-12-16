
class ProductModel {
  int? id;
  String? status;
  String? name;
  String? arName;
  String? categoryName;
  String? categorySlug;
  String? categoryNameAr;
  String? slug;
  String? sku;
  String? salePrice;
  String? price;
  MainImage? mainImg;
  String? type;
  String? availability;

  ProductModel({
    this.id,
    this.status,
    this.name,
    this.arName,
    this.categoryName,
    this.categorySlug,
    this.categoryNameAr,
    this.slug,
    this.sku,
    this.salePrice,
    this.price,
    this.mainImg,
    this.type,
    this.availability,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] as int?,
      status: json['status'] as String?,
      name: json['name'] as String?,
      arName: json['ar_name'] as String?,
      categoryName: json['category_name'] as String?,
      categorySlug: json['category_slug'] as String?,
      categoryNameAr: json['category_name_ar'] as String?,
      slug: json['slug'] as String?,
      sku: json['sku'] as String?,
      salePrice: json['sale_price'] as String?,
      price: json['price'] as String?,
      mainImg: json['main_img'] != null
          ? MainImage.fromJson(json['main_img'])
          : null,
      type: json['type'] as String?,
      availability: json['availability'] as String?,
    );
  }
}

class MainImage {
  String? src;
  String? alt;
  String? caption;
  String? title;

  MainImage({this.src, this.alt, this.caption, this.title});

  factory MainImage.fromJson(Map<String, dynamic> json) {
    return MainImage(
      src: json['src'] as String?,
      alt: json['alt'] as String?,
      caption: json['caption'] as String?,
      title: json['title'] as String?,
    );
  }
}