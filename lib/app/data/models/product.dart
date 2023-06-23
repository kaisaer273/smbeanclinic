enum ProductType { khangsinh, giamdau, loitieu, khanghistamin, timmach, bonao }

class Product {
  String? name;
  String? ingredient;
  String? unit;
  String? imgUrl;
  String? skuCode;
  String? barCode;
  int? purchasePrice;
  int? salePrice;
  bool? isAvaiable;
  int? numInStorage;
  int? numSold;
  ProductType? type;

  Product({
    required this.name,
    this.ingredient,
    this.unit,
    this.imgUrl,
    this.skuCode,
    this.barCode,
    this.purchasePrice,
    required this.salePrice,
    this.isAvaiable,
    this.numInStorage,
    this.numSold,
    this.type,
  });

  Product.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    ingredient = json['ingredient'];
    unit = json['unit'];
    imgUrl = json['imgUrl'];
    skuCode = json['skuCode'];
    barCode = json['barCode'];
    purchasePrice = json['purchasePrice'];
    salePrice = json['salePrice'];
    isAvaiable = json['isAvaiable'];
    numInStorage = json['numInStorage'];
    numSold = json['numSold'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['ingredient'] = ingredient;
    data['unit'] = unit;
    data['imgUrl'] = imgUrl;
    data['skuCode'] = skuCode;
    data['barCode'] = barCode;
    data['purchasePrice'] = purchasePrice;
    data['salePrice'] = salePrice;
    data['isAvaiable'] = isAvaiable;
    data['numInStorage'] = numInStorage;
    data['numSold'] = numSold;
    data['type'] = type;
    return data;
  }
}
