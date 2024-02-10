class MarketStates {
  List<BuyOrders>? buyOrders;

  MarketStates({this.buyOrders});

  MarketStates.fromJson(Map<String, dynamic> json) {
    if (json['buyOrders'] != null) {
      buyOrders = <BuyOrders>[];
      json['buyOrders'].forEach((v) {
        buyOrders!.add(new BuyOrders.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.buyOrders != null) {
      data['buyOrders'] = this.buyOrders!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BuyOrders {
  String? stock;
  int? price;
  int? quantity;
  int? fulfilled;
  bool? isComplete;

  BuyOrders(
      {this.stock, this.price, this.quantity, this.fulfilled, this.isComplete});

  BuyOrders.fromJson(Map<String, dynamic> json) {
    stock = json['stock'];
    price = json['price'];
    quantity = json['quantity'];
    fulfilled = json['fulfilled'];
    isComplete = json['isComplete'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['stock'] = this.stock;
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    data['fulfilled'] = this.fulfilled;
    data['isComplete'] = this.isComplete;
    return data;
  }
}
