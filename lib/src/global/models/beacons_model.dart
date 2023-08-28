class Product {
  Product({
    required this.id,
    required this.name,
    this.sku,
    this.description,
    required this.websiteLink,
    required this.price,
    required this.regularPrice,
    required this.salePrice,
    this.stock,
    required this.stockStatus,
    required this.totalSales,
    required this.img,
    required this.avgRating,
    required this.gallaryImages,
    this.attributes,
  });

  int id;
  String name;
  String? sku;
  String? description;
  String websiteLink;
  String price;
  String regularPrice;
  String salePrice;
  dynamic stock;
  String stockStatus;
  double totalSales;
  String img;
  int avgRating;
  List<String>? gallaryImages;
  dynamic attributes;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    name: json["name"],
    sku: json["sku"],
    description: json["description"],
    websiteLink: json["website_link"],
    price: json["price"],
    regularPrice: json["regular_price"],
    salePrice: json["sale_price"],
    stock: json["stock"] ?? '',
    stockStatus: json["stock_status"],
    totalSales: json["total_sales"].toDouble(),
    img: json["img"] == null
        ? 'https://www.asimetrica.org/wp-content/uploads/2019/03/no-imagen.jpg'
        : parseURL(json["img"]),
    avgRating: json["avg_rating"],
    gallaryImages:
    json["gallary_images"] == null ? null : List<String>.from(json["gallary_images"].map((x) => x)),
    attributes: json["attributes"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "sku": sku,
    "description": description,
    "website_link": websiteLink,
    "price": price,
    "regular_price": regularPrice,
    "sale_price": salePrice,
    "stock": stock,
    "stock_status": stockStatus,
    "total_sales": totalSales,
    "img": img,
    "avg_rating": avgRating,
    "gallary_images": gallaryImages == null ? [''] : List<dynamic>.from(gallaryImages!.map((x) => x)),
    "attributes": attributes,
  };

  static String parseURL(String s) {
    String noImage = 'https://www.asimetrica.org/wp-content/uploads/2019/03/no-imagen.jpg';
    if (s.contains('á') ||
        s.contains('é') ||
        s.contains('í') ||
        s.contains('ó') ||
        s.contains('ú') ||
        s.contains('Á') ||
        s.contains('É') ||
        s.contains('Í') ||
        s.contains('Ó') ||
        s.contains('Ú') ||
        s.contains('ñ') ||
        s.contains('Ñ')) {
      return noImage;
    }

    return s;
  }
}
