class Crypto {
  final double dayChangePercentage, dayChange, dayHigh, dayLow, lastPrice, volumeTraded, updated;
  final String name, exchange, symbol, avatarUrl;

  const Crypto({this.symbol, this.name,this.exchange, this.avatarUrl, this.dayChange, this.dayChangePercentage, this.dayHigh, this.dayLow, this.lastPrice, this.updated, this.volumeTraded});

 Crypto.fromMap(Map<dynamic, dynamic> data)
      : this(
          symbol: data["symbol"],
          name: data["name"], 
          exchange: data["exchange"], 
          avatarUrl: data["avatarUrl"], 
          dayChange: data["day_change"].toDouble(), 
          dayChangePercentage: data["day_change_percentage"].toDouble(), 
          dayHigh: data["day_high"].toDouble(), 
          dayLow: data["day_low"].toDouble(), 
          lastPrice: data["last_price"].toDouble(), 
          updated: data["last_price"].toDouble(), 
          volumeTraded: data["volume_traded"].toDouble(),
        );
}
