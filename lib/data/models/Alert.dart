class Alert {
  final double  alertPrice;
  final String name, exchange, symbol, avatarUrl;

  const Alert({this.symbol, this.name,this.exchange, this.avatarUrl, this.alertPrice});

 Alert.fromMap(Map<dynamic, dynamic> data)
      : this(
          symbol: data["symbol"],
          name: data["name"], 
          exchange: data["exchange"], 
          avatarUrl: data["avatarUrl"], 
          alertPrice: data["alertPrice"],
        );
}