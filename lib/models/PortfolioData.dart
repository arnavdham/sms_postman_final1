class Protfoliodata {
  String? stock;
  String? name;
  String? symbol;
  int? price;
  bool? isCrypto;
  bool? isStock;
  int? quantity;

  Protfoliodata(
      {this.stock,
        this.name,
        this.symbol,
        this.price,
        this.isCrypto,
        this.isStock,
        this.quantity});

  Protfoliodata.fromJson(Map<String, dynamic> json) {
    stock = json['stock'];
    name = json['name'];
    symbol = json['symbol'];
    price = json['price'];
    isCrypto = json['isCrypto'];
    isStock = json['isStock'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['stock'] = this.stock;
    data['name'] = this.name;
    data['symbol'] = this.symbol;
    data['price'] = this.price;
    data['isCrypto'] = this.isCrypto;
    data['isStock'] = this.isStock;
    data['quantity'] = this.quantity;
    return data;
  }
}
