class trendingsks {
  String? id;
  String? name;
  String? symbol;
  int? price;
  int? quantity;
  bool? isCrypto;
  bool? isStock;
  int? priceHistoryCount;

  trendingsks(
      {this.id,
        this.name,
        this.symbol,
        this.price,
        this.quantity,
        this.isCrypto,
        this.isStock,
        this.priceHistoryCount});

  trendingsks.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    symbol = json['symbol'];
    price = json['price'];
    quantity = json['quantity'];
    isCrypto = json['isCrypto'];
    isStock = json['isStock'];
    priceHistoryCount = json['priceHistoryCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['symbol'] = this.symbol;
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    data['isCrypto'] = this.isCrypto;
    data['isStock'] = this.isStock;
    data['priceHistoryCount'] = this.priceHistoryCount;
    return data;
  }
}
