
// class ReviewModel{
//
//   int _id;
//   int _productId;
//   int _customerId;
//   String _comment;
//   String _attachment;
//   int _rating;
//   int _status;
//   String _createdAt;
//   String _updatedAt;
//   Product _product;
//   Customer _customer;
//
//   ReviewModel({
//     int id,
//     int productId,
//     int customerId,
//     String comment,
//     String attachment,
//     int rating,
//     int status,
//     String createdAt,
//     String updatedAt,
//     Product product,
//     Customer customer,}){
//     this._id = id;
//     this._productId = productId;
//     this._customerId = customerId;
//     this._comment = comment;
//     this._attachment = attachment;
//     this._rating = rating;
//     this._status = status;
//     this._createdAt = createdAt;
//     this._updatedAt = updatedAt;
//     this._product = product;
//     this._customer = customer;
//
// }
//
//   int get id => _id;
//   int get productId => _productId;
//   int get customerId =>_customerId;
//   String get comment => _comment;
//   String get attachment =>_attachment;
//   int get rating => _rating;
//   int get status => _status;
//   String get createdAt => _createdAt;
//   String get updatedAt => _updatedAt;
//   Product get product => _product;
//   Customer get customer => _customer;
//
//
//   ReviewModel.fromJson(Map<String, dynamic> json){
//     _id = json['id'];
//     _productId = json['product_id'];
//     _customerId = json['customer_id'];
//     _comment = json['comment'];
//     _attachment = json['attachment'];
//     _rating = json['rating'];
//     _status = json['status'];
//     _createdAt = json['created_at'];
//     _updatedAt = json['updated_at'];
//     _customer = json['customer'];
//     _product = json['product'];
//
//     Map<String, dynamic> toJson() {
//       final Map<String, dynamic> data = new Map<String, dynamic>();
//       data['id'] = this._id;
//       data['product_id'] = this._productId;
//       data['customer_id'] = this._customerId;
//       data['comment'] = this._comment;
//       data['attachment'] = this._attachment;
//       data['rating'] = this._rating;
//       data['status'] = this._status;
//       data['created_at'] = this._createdAt;
//       data['updated_at'] = this._updatedAt;
//       data['customer'] = this._customer;
//       data['product'] = this._product;
//       return data;
//
//     }
//
//
//   }
//
//
//
//
// }
// class Customer {
//   Customer({
//     this.id,
//     this.name,
//     this.fName,
//     this.lName,
//     this.phone,
//     this.image,
//     this.email,
//     this.emailVerifiedAt,
//     this.createdAt,
//     this.updatedAt,
//     this.streetAddress,
//     this.country,
//     this.city,
//     this.zip,
//     this.houseNo,
//     this.apartmentNo,
//     this.cmFirebaseToken,
//     this.isActive,
//     this.loginMedium,
//     this.socialId,
//     this.isPhoneVerified,
//     this.temporaryToken,
//   });
//
//   int id;
//   dynamic name;
//   String fName;
//   String lName;
//   String phone;
//   String image;
//   String email;
//   dynamic emailVerifiedAt;
//   dynamic createdAt;
//   dynamic updatedAt;
//   dynamic streetAddress;
//   dynamic country;
//   dynamic city;
//   dynamic zip;
//   dynamic houseNo;
//   dynamic apartmentNo;
//   String cmFirebaseToken;
//   int isActive;
//   dynamic loginMedium;
//   dynamic socialId;
//   int isPhoneVerified;
//   dynamic temporaryToken;
//
//   factory Customer.fromJson(Map<String, dynamic> json) => Customer(
//     id: json["id"],
//     name: json["name"],
//     fName: json["f_name"],
//     lName: json["l_name"],
//     phone: json["phone"],
//     image: json["image"],
//     email: json["email"],
//     emailVerifiedAt: json["email_verified_at"],
//     createdAt: json["created_at"],
//     updatedAt: json["updated_at"],
//     streetAddress: json["street_address"],
//     country: json["country"],
//     city: json["city"],
//     zip: json["zip"],
//     houseNo: json["house_no"],
//     apartmentNo: json["apartment_no"],
//     cmFirebaseToken: json["cm_firebase_token"],
//     isActive: json["is_active"],
//     loginMedium: json["login_medium"],
//     socialId: json["social_id"],
//     isPhoneVerified: json["is_phone_verified"],
//     temporaryToken: json["temporary_token"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "name": name,
//     "f_name": fName,
//     "l_name": lName,
//     "phone": phone,
//     "image": image,
//     "email": email,
//     "email_verified_at": emailVerifiedAt,
//     "created_at": createdAt,
//     "updated_at": updatedAt,
//     "street_address": streetAddress,
//     "country": country,
//     "city": city,
//     "zip": zip,
//     "house_no": houseNo,
//     "apartment_no": apartmentNo,
//     "cm_firebase_token": cmFirebaseToken,
//     "is_active": isActive,
//     "login_medium": loginMedium,
//     "social_id": socialId,
//     "is_phone_verified": isPhoneVerified,
//     "temporary_token": temporaryToken,
//   };
// }
//
// class Product {
//   Product({
//     this.id,
//     this.addedBy,
//     this.userId,
//     this.name,
//     this.slug,
//     this.categoryIds,
//     this.brandId,
//     this.unit,
//     this.minQty,
//     this.refundable,
//     this.images,
//     this.thumbnail,
//     this.featured,
//     this.flashDeal,
//     this.videoProvider,
//     this.videoUrl,
//     this.colors,
//     this.variantProduct,
//     this.attributes,
//     this.choiceOptions,
//     this.variation,
//     this.published,
//     this.unitPrice,
//     this.purchasePrice,
//     this.tax,
//     this.taxType,
//     this.discount,
//     this.discountType,
//     this.currentStock,
//     this.details,
//     this.freeShipping,
//     this.attachment,
//     this.createdAt,
//     this.updatedAt,
//     this.status,
//     this.featuredStatus,
//     this.metaTitle,
//     this.metaDescription,
//     this.metaImage,
//     this.requestStatus,
//     this.deniedNote,
//     this.translations,
//   });
//
//   int id;
//   String addedBy;
//   int userId;
//   String name;
//   String slug;
//   String categoryIds;
//   int brandId;
//   String unit;
//   int minQty;
//   int refundable;
//   String images;
//   String thumbnail;
//   int featured;
//   dynamic flashDeal;
//   String videoProvider;
//   dynamic videoUrl;
//   String colors;
//   int variantProduct;
//   String attributes;
//   String choiceOptions;
//   String variation;
//   int published;
//   int unitPrice;
//   int purchasePrice;
//   int tax;
//   String taxType;
//   int discount;
//   String discountType;
//   int currentStock;
//   String details;
//   int freeShipping;
//   dynamic attachment;
//   DateTime createdAt;
//   DateTime updatedAt;
//   int status;
//   int featuredStatus;
//   dynamic metaTitle;
//   dynamic metaDescription;
//   dynamic metaImage;
//   int requestStatus;
//   dynamic deniedNote;
//   List<dynamic> translations;
//
//   factory Product.fromJson(Map<String, dynamic> json) => Product(
//     id: json["id"],
//     addedBy: json["added_by"],
//     userId: json["user_id"],
//     name: json["name"],
//     slug: json["slug"],
//     categoryIds: json["category_ids"],
//     brandId: json["brand_id"],
//     unit: json["unit"],
//     minQty: json["min_qty"],
//     refundable: json["refundable"],
//     images: json["images"],
//     thumbnail: json["thumbnail"],
//     featured: json["featured"],
//     flashDeal: json["flash_deal"],
//     videoProvider: json["video_provider"],
//     videoUrl: json["video_url"],
//     colors: json["colors"],
//     variantProduct: json["variant_product"],
//     attributes: json["attributes"],
//     choiceOptions: json["choice_options"],
//     variation: json["variation"],
//     published: json["published"],
//     unitPrice: json["unit_price"],
//     purchasePrice: json["purchase_price"],
//     tax: json["tax"],
//     taxType: json["tax_type"],
//     discount: json["discount"],
//     discountType: json["discount_type"],
//     currentStock: json["current_stock"],
//     details: json["details"],
//     freeShipping: json["free_shipping"],
//     attachment: json["attachment"],
//     createdAt: DateTime.parse(json["created_at"]),
//     updatedAt: DateTime.parse(json["updated_at"]),
//     status: json["status"],
//     featuredStatus: json["featured_status"],
//     metaTitle: json["meta_title"],
//     metaDescription: json["meta_description"],
//     metaImage: json["meta_image"],
//     requestStatus: json["request_status"],
//     deniedNote: json["denied_note"],
//     translations: List<dynamic>.from(json["translations"].map((x) => x)),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "added_by": addedBy,
//     "user_id": userId,
//     "name": name,
//     "slug": slug,
//     "category_ids": categoryIds,
//     "brand_id": brandId,
//     "unit": unit,
//     "min_qty": minQty,
//     "refundable": refundable,
//     "images": images,
//     "thumbnail": thumbnail,
//     "featured": featured,
//     "flash_deal": flashDeal,
//     "video_provider": videoProvider,
//     "video_url": videoUrl,
//     "colors": colors,
//     "variant_product": variantProduct,
//     "attributes": attributes,
//     "choice_options": choiceOptions,
//     "variation": variation,
//     "published": published,
//     "unit_price": unitPrice,
//     "purchase_price": purchasePrice,
//     "tax": tax,
//     "tax_type": taxType,
//     "discount": discount,
//     "discount_type": discountType,
//     "current_stock": currentStock,
//     "details": details,
//     "free_shipping": freeShipping,
//     "attachment": attachment,
//     "created_at": createdAt.toIso8601String(),
//     "updated_at": updatedAt.toIso8601String(),
//     "status": status,
//     "featured_status": featuredStatus,
//     "meta_title": metaTitle,
//     "meta_description": metaDescription,
//     "meta_image": metaImage,
//     "request_status": requestStatus,
//     "denied_note": deniedNote,
//     "translations": List<dynamic>.from(translations.map((x) => x)),
//   };
// }


import 'dart:convert';

List<ReviewModel> reviewModelFromJson(String str) => List<ReviewModel>.from(json.decode(str).map((x) => ReviewModel.fromJson(x)));

String reviewModelToJson(List<ReviewModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ReviewModel {
  ReviewModel({
    this.id,
    this.productId,
    this.customerId,
    this.comment,
    this.attachment,
    this.rating,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.product,
    this.customer,
  });

  int id;
  int productId;
  int customerId;
  String comment;
  String attachment;
  int rating;
  int status;
  DateTime createdAt;
  DateTime updatedAt;
  Product product;
  Customer customer;

  factory ReviewModel.fromJson(Map<String, dynamic> json) => ReviewModel(
    id: json["id"],
    productId: json["product_id"],
    customerId: json["customer_id"],
    comment: json["comment"],
    attachment: json["attachment"],
    rating: json["rating"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    product: Product.fromJson(json["product"]),
    customer: Customer.fromJson(json["customer"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "product_id": productId,
    "customer_id": customerId,
    "comment": comment,
    "attachment": attachment,
    "rating": rating,
    "status": status,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "product": product.toJson(),
    "customer": customer.toJson(),
  };
}

class Customer {
  Customer({
    this.id,
    this.name,
    this.fName,
    this.lName,
    this.phone,
    this.image,
    this.email,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
    this.streetAddress,
    this.country,
    this.city,
    this.zip,
    this.houseNo,
    this.apartmentNo,
    this.cmFirebaseToken,
    this.isActive,
    this.loginMedium,
    this.socialId,
    this.isPhoneVerified,
    this.temporaryToken,
  });

  int id;
  dynamic name;
  String fName;
  String lName;
  String phone;
  String image;
  String email;
  dynamic emailVerifiedAt;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic streetAddress;
  dynamic country;
  dynamic city;
  dynamic zip;
  dynamic houseNo;
  dynamic apartmentNo;
  String cmFirebaseToken;
  int isActive;
  dynamic loginMedium;
  dynamic socialId;
  int isPhoneVerified;
  dynamic temporaryToken;

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
    id: json["id"],
    name: json["name"],
    fName: json["f_name"],
    lName: json["l_name"],
    phone: json["phone"],
    image: json["image"],
    email: json["email"],
    emailVerifiedAt: json["email_verified_at"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    streetAddress: json["street_address"],
    country: json["country"],
    city: json["city"],
    zip: json["zip"],
    houseNo: json["house_no"],
    apartmentNo: json["apartment_no"],
    cmFirebaseToken: json["cm_firebase_token"],
    isActive: json["is_active"],
    loginMedium: json["login_medium"],
    socialId: json["social_id"],
    isPhoneVerified: json["is_phone_verified"],
    temporaryToken: json["temporary_token"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "f_name": fName,
    "l_name": lName,
    "phone": phone,
    "image": image,
    "email": email,
    "email_verified_at": emailVerifiedAt,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "street_address": streetAddress,
    "country": country,
    "city": city,
    "zip": zip,
    "house_no": houseNo,
    "apartment_no": apartmentNo,
    "cm_firebase_token": cmFirebaseToken,
    "is_active": isActive,
    "login_medium": loginMedium,
    "social_id": socialId,
    "is_phone_verified": isPhoneVerified,
    "temporary_token": temporaryToken,
  };
}

class Product {
  Product({
    this.id,
    this.addedBy,
    this.userId,
    this.name,
    this.slug,
    this.categoryIds,
    this.brandId,
    this.unit,
    this.minQty,
    this.refundable,
    this.images,
    this.thumbnail,
    this.featured,
    this.flashDeal,
    this.videoProvider,
    this.videoUrl,
    this.colors,
    this.variantProduct,
    this.attributes,
    this.choiceOptions,
    this.variation,
    this.published,
    this.unitPrice,
    this.purchasePrice,
    this.tax,
    this.taxType,
    this.discount,
    this.discountType,
    this.currentStock,
    this.details,
    this.freeShipping,
    this.attachment,
    this.createdAt,
    this.updatedAt,
    this.status,
    this.featuredStatus,
    this.metaTitle,
    this.metaDescription,
    this.metaImage,
    this.requestStatus,
    this.deniedNote,
    this.translations,
  });

  int id;
  String addedBy;
  int userId;
  String name;
  String slug;
  String categoryIds;
  int brandId;
  String unit;
  int minQty;
  int refundable;
  String images;
  String thumbnail;
  int featured;
  dynamic flashDeal;
  String videoProvider;
  dynamic videoUrl;
  String colors;
  int variantProduct;
  String attributes;
  String choiceOptions;
  String variation;
  int published;
  double unitPrice;
  double purchasePrice;
  double tax;
  String taxType;
  double discount;
  String discountType;
  int currentStock;
  String details;
  int freeShipping;
  dynamic attachment;
  DateTime createdAt;
  DateTime updatedAt;
  int status;
  int featuredStatus;
  dynamic metaTitle;
  dynamic metaDescription;
  dynamic metaImage;
  int requestStatus;
  dynamic deniedNote;
  List<dynamic> translations;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    addedBy: json["added_by"],
    userId: json["user_id"],
    name: json["name"],
    slug: json["slug"],
    categoryIds: json["category_ids"],
    brandId: json["brand_id"],
    unit: json["unit"],
    minQty: json["min_qty"],
    refundable: json["refundable"],
    images: json["images"],
    thumbnail: json["thumbnail"],
    featured: json["featured"],
    flashDeal: json["flash_deal"],
    videoProvider: json["video_provider"],
    videoUrl: json["video_url"],
    colors: json["colors"],
    variantProduct: json["variant_product"],
    attributes: json["attributes"],
    choiceOptions: json["choice_options"],
    variation: json["variation"],
    published: json["published"],
    unitPrice: json["unit_price"].toDouble(),
    purchasePrice: json["purchase_price"].toDouble(),
    tax: json["tax"].toDouble(),
    taxType: json["tax_type"],
    discount: json["discount"].toDouble(),
    discountType: json["discount_type"],
    currentStock: json["current_stock"],
    details: json["details"],
    freeShipping: json["free_shipping"],
    attachment: json["attachment"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    status: json["status"],
    featuredStatus: json["featured_status"],
    metaTitle: json["meta_title"],
    metaDescription: json["meta_description"],
    metaImage: json["meta_image"],
    requestStatus: json["request_status"],
    deniedNote: json["denied_note"],
    translations: List<dynamic>.from(json["translations"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "added_by": addedBy,
    "user_id": userId,
    "name": name,
    "slug": slug,
    "category_ids": categoryIds,
    "brand_id": brandId,
    "unit": unit,
    "min_qty": minQty,
    "refundable": refundable,
    "images": images,
    "thumbnail": thumbnail,
    "featured": featured,
    "flash_deal": flashDeal,
    "video_provider": videoProvider,
    "video_url": videoUrl,
    "colors": colors,
    "variant_product": variantProduct,
    "attributes": attributes,
    "choice_options": choiceOptions,
    "variation": variation,
    "published": published,
    "unit_price": unitPrice,
    "purchase_price": purchasePrice,
    "tax": tax,
    "tax_type": taxType,
    "discount": discount,
    "discount_type": discountType,
    "current_stock": currentStock,
    "details": details,
    "free_shipping": freeShipping,
    "attachment": attachment,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "status": status,
    "featured_status": featuredStatus,
    "meta_title": metaTitle,
    "meta_description": metaDescription,
    "meta_image": metaImage,
    "request_status": requestStatus,
    "denied_note": deniedNote,
    "translations": List<dynamic>.from(translations.map((x) => x)),
  };
}
