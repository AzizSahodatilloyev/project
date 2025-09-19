class BooksModel {
  final int id;
  final String title;
  final double price;
  final String image;
  final String description;
  final String author;
  final String category;
  final double rating;
  final int reviewCount;
  final String publisher;
  final String publishedDate;
  final String language;
  final int pageCount;
  final String isbn;
  final String vendor;
  final bool specialOffer;
  final String stockStatus;
  final bool offer;
  final double discount;
  final bool topOfWeek;

  BooksModel({
    required this.id,
    required this.title,
    required this.price,
    required this.image,
    required this.description,
    required this.author,
    required this.category,
    required this.rating,
    required this.reviewCount,
    required this.publisher,
    required this.publishedDate,
    required this.language,
    required this.pageCount,
    required this.isbn,
    required this.vendor,
    required this.specialOffer,
    required this.stockStatus,
    required this.offer,
    required this.discount,
    required this.topOfWeek,
  });

  factory BooksModel.fromJson(Map<String, dynamic> json) {
    return BooksModel(
      id: json['id'] ?? -1,
      title: json['title'] ?? '',
      price: json['price'] ?? 0,
      image: json['image'] ?? '',
      description: json['description'] ?? '',
      author: json['author'] ?? '',
      category: json['category'] ?? '',
      rating: json['rating'] ?? 0,
      reviewCount: json['reviewCount'] ?? 0,
      publisher: json['publisher'] ?? '',
      publishedDate: json['publishedDated'] ?? '',
      language: json['language'] ?? '',
      pageCount: json['pageCount'] ?? 0,
      isbn: json['isbn'] ?? '',
      vendor: json['vendor'],
      specialOffer: json['specialOffer'] ?? false,
      stockStatus: json['stockStatus'] ?? '',
      offer: json['offer'] ?? false,
      discount: json['discount'] ?? 0,
      topOfWeek: json['topOfWeek'] ?? false,
    );
  }
}
