class Stocks {
  String? id;
  String? name;
  String? symbol;
  int? price;
  bool? isCrypto;
  bool? isStock;
  int? quantity;

  Stocks(
      {this.id,
        this.name,
        this.symbol,
        this.price,
        this.isCrypto,
        this.isStock,
        this.quantity});

  Stocks.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    symbol = json['symbol'];
    price=json['price'];
    isCrypto = json['isCrypto'];
    isStock = json['isStock'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['symbol'] = this.symbol;
    data['price'] = this.price;
    data['isCrypto'] = this.isCrypto;
    data['isStock'] = this.isStock;
    data['quantity'] = this.quantity;
    return data;
  }
}
