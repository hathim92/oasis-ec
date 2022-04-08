class HomePageDetails {
  HomePageDetails({
    required this.status,
    required this.message,
    required this.data,
  });
  late final String status;
  late final String message;
  late final Data data;

  HomePageDetails.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['data'] = data.toJson();
    return _data;
  }
}

class Data {
  Data({
    required this.brands,
    required this.isBestSeller,
    required this.categories,
    required this.featuredCategories,
    required this.newArrivals,
    required this.topSellingProducts,
    required this.featuredProducts,
    required this.navBarBrandsData,
  });
  late final List<Brands> brands;
  late final List<IsBestSeller> isBestSeller;
  late final List<Categories> categories;
  late final List<FeaturedCategories> featuredCategories;
  late final List<NewArrivals> newArrivals;
  late final List<TopSellingProducts> topSellingProducts;
  late final List<FeaturedProducts> featuredProducts;
  late final List<NavBarBrandsData> navBarBrandsData;

  Data.fromJson(Map<String, dynamic> json) {
    brands = List.from(json['brands']).map((e) => Brands.fromJson(e)).toList();
    isBestSeller = List.from(json['isBestSeller'])
        .map((e) => IsBestSeller.fromJson(e))
        .toList();
    categories = List.from(json['categories'])
        .map((e) => Categories.fromJson(e))
        .toList();
    featuredCategories = List.from(json['featuredCategories'])
        .map((e) => FeaturedCategories.fromJson(e))
        .toList();
    newArrivals = List.from(json['newArrivals'])
        .map((e) => NewArrivals.fromJson(e))
        .toList();
    topSellingProducts = List.from(json['topSellingProducts'])
        .map((e) => TopSellingProducts.fromJson(e))
        .toList();
    featuredProducts = List.from(json['featuredProducts'])
        .map((e) => FeaturedProducts.fromJson(e))
        .toList();
    navBarBrandsData = List.from(json['navBarBrandsData'])
        .map((e) => NavBarBrandsData.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['brands'] = brands.map((e) => e.toJson()).toList();
    _data['isBestSeller'] = isBestSeller.map((e) => e.toJson()).toList();
    _data['categories'] = categories.map((e) => e.toJson()).toList();
    _data['featuredCategories'] =
        featuredCategories.map((e) => e.toJson()).toList();
    _data['newArrivals'] = newArrivals.map((e) => e.toJson()).toList();
    _data['topSellingProducts'] =
        topSellingProducts.map((e) => e.toJson()).toList();
    _data['featuredProducts'] =
        featuredProducts.map((e) => e.toJson()).toList();
    _data['navBarBrandsData'] =
        navBarBrandsData.map((e) => e.toJson()).toList();
    return _data;
  }
}

class NavBarBrandsData {
  NavBarBrandsData({required this.brand, required this.categories});
  late final String brand;
  late final List<String> categories;

  NavBarBrandsData.fromJson(Map<String, dynamic> json) {
    brand = json['brand'];
    categories = List.castFrom<dynamic, String>(json['categories']);
  }
  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['brand'] = brand;
    _data['categories'] = categories;
    return _data;
  }
}

class Brands {
  Brands({
    required this.id,
    required this.name,
    required this.brandImages,
  });
  late final String id;
  late final String name;
  late final List<String> brandImages;

  Brands.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['name'];
    brandImages = List.castFrom<dynamic, String>(json['brandImages']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['name'] = name;
    _data['brandImages'] = brandImages;
    return _data;
  }
}

class IsBestSeller {
  IsBestSeller({
    required this.id,
    required this.name,
    required this.type,
    required this.regularPrice,
    required this.salePrice,
    required this.variations,
    required this.categoryName,
    required this.bestSellerImages,
  });
  late final String id;
  late final String name;
  late final String type;
  late final int regularPrice;
  late final int salePrice;
  late final List<Variations> variations;
  late final List<String> categoryName;
  late final List<String> bestSellerImages;

  IsBestSeller.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['name'];
    type = json['type'];
    regularPrice = json['regularPrice'];
    salePrice = json['salePrice'];
    if (type != 'simple') {
      variations = List.from(json['variations'])
          .map((e) => Variations.fromJson(e))
          .toList();
    }

    categoryName =
        (json['categoryName'] as List).map((dynamic e) => e as String).toList();
    bestSellerImages = List.castFrom<dynamic, String>(json['bestSellerImages']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['name'] = name;
    _data['type'] = type;
    _data['regularPrice'] = regularPrice;
    _data['salePrice'] = salePrice;
    _data['variations'] = variations.map((e) => e.toJson()).toList();
    _data['categoryName'] = categoryName;
    _data['bestSellerImages'] = bestSellerImages;
    return _data;
  }
}

class Variations {
  Variations({
    required this.attributes,
    required this.regularPrice,
    required this.salePrice,
    required this.imageId,
    required this.id,
  });
  late final List<Attributes> attributes;
  late final double regularPrice;
  late final double salePrice;
  late final String imageId;
  late final String id;

  Variations.fromJson(Map<String, dynamic> json) {
    attributes = List.from(json['attributes'])
        .map((e) => Attributes.fromJson(e))
        .toList();
    regularPrice = json['regularPrice'];
    salePrice = json['salePrice'];
    imageId = json['imageId'];
    id = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['attributes'] = attributes.map((e) => e.toJson()).toList();
    _data['regularPrice'] = regularPrice;
    _data['salePrice'] = salePrice;
    _data['imageId'] = imageId;
    _data['_id'] = id;
    return _data;
  }
}

class Attributes {
  Attributes({
    required this.label,
    required this.value,
    required this.id,
  });
  late final String label;
  late final String value;
  late final String id;

  Attributes.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    value = json['value'];
    id = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['label'] = label;
    _data['value'] = value;
    _data['_id'] = id;
    return _data;
  }
}

class Categories {
  Categories({
    required this.id,
    required this.name,
    required this.image,
    required this.children,
  });
  late final String id;
  late final String name;
  late final Image image;
  late final List<Children> children;

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['name'];
    image = Image.fromJson(json['image']);
    children =
        List.from(json['children']).map((e) => Children.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['name'] = name;
    _data['image'] = image.toJson();
    _data['children'] = children.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Image {
  Image({
    required this.image,
    required this.id,
  });
  late final SubImage image;
  late final String id;

  Image.fromJson(Map<String, dynamic> json) {
    image = SubImage.fromJson(json['image']);
    id = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['image'] = image.toJson();
    _data['_id'] = id;
    return _data;
  }
}

class SubImage {
  SubImage({required this.url});
  late final String url;

  SubImage.fromJson(Map<String, dynamic> json) {
    url = json['url'];
  }
  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['url'] = url;
    return _data;
  }
}

class Children {
  Children({
    required this.id,
    required this.image,
    required this.children,
  });
  late final String id;
  late final Image image;
  late final List<String> children;

  Children.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    image = Image.fromJson(json['image']);
    children = List.castFrom<dynamic, String>(json['children']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['image'] = image.toJson();
    _data['children'] = children;
    return _data;
  }
}

class FeaturedCategories {
  FeaturedCategories({
    required this.id,
    required this.name,
    required this.featuredCategoriesImages,
  });
  late final String id;
  late final String name;
  late final List<String> featuredCategoriesImages;

  FeaturedCategories.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['name'];
    featuredCategoriesImages =
        List.castFrom<dynamic, String>(json['featuredCategoriesImages']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['name'] = name;
    _data['featuredCategoriesImages'] = featuredCategoriesImages;
    return _data;
  }
}

class NewArrivals {
  NewArrivals({
    required this.id,
    required this.name,
    required this.type,
    required this.regularPrice,
    required this.salePrice,
    required this.variations,
    required this.categoryName,
    required this.newArrivalImages,
  });
  late final String id;
  late final String name;
  late final String type;
  late final int regularPrice;
  late final int salePrice;
  late final List<Variations> variations;
  late final List<String> categoryName;
  late final List<String> newArrivalImages;

  NewArrivals.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['name'];
    type = json['type'];
    regularPrice = json['regularPrice'];
    salePrice = json['salePrice'];
    variations = List.from(json['variations'])
        .map((e) => Variations.fromJson(e))
        .toList();
    categoryName =
        (json['categoryName'] as List).map((dynamic e) => e as String).toList();
    newArrivalImages = List.castFrom<dynamic, String>(json['newArrivalImages']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['name'] = name;
    _data['type'] = type;
    _data['regularPrice'] = regularPrice;
    _data['salePrice'] = salePrice;
    _data['variations'] = variations.map((e) => e.toJson()).toList();
    _data['categoryName'] = categoryName;
    _data['newArrivalImages'] = newArrivalImages;
    return _data;
  }
}

class TopSellingProducts {
  TopSellingProducts({
    required this.category,
    required this.featuredProducts,
  });
  late final Category category;
  late final List<dynamic> featuredProducts;

  TopSellingProducts.fromJson(Map<String, dynamic> json) {
    category = Category.fromJson(json['category']);
    featuredProducts =
        List.castFrom<dynamic, dynamic>(json['featuredProducts']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['category'] = category.toJson();
    _data['featuredProducts'] = featuredProducts;
    return _data;
  }
}

class Category {
  Category({
    required this.id,
    required this.name,
  });
  late final String id;
  late final String name;

  Category.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['name'] = name;
    return _data;
  }
}

class FeaturedProducts {
  FeaturedProducts({
    required this.id,
    required this.name,
    required this.type,
    required this.regularPrice,
    required this.salePrice,
    required this.variations,
    required this.categoryName,
    required this.featuredProductImages,
  });
  late final String id;
  late final String name;
  late final String type;
  late final int regularPrice;
  late final int salePrice;
  late final List<Variations> variations;
  late final List<String> categoryName;
  late final List<String> featuredProductImages;

  FeaturedProducts.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['name'];
    type = json['type'];
    regularPrice = json['regularPrice'];
    salePrice = json['salePrice'];
    variations = List.from(json['variations'])
        .map((e) => Variations.fromJson(e))
        .toList();
    categoryName =
        (json['categoryName'] as List).map((dynamic e) => e as String).toList();
    featuredProductImages =
        List.castFrom<dynamic, String>(json['featuredProductImages']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['name'] = name;
    _data['type'] = type;
    _data['regularPrice'] = regularPrice;
    _data['salePrice'] = salePrice;
    _data['variations'] = variations.map((e) => e.toJson()).toList();
    _data['categoryName'] = categoryName;
    _data['featuredProductImages'] = featuredProductImages;
    return _data;
  }
}
