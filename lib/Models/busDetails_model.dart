class BusDetail {
  bool? isActive;
  String? busNumber;
  List<String>? busStops;

  BusDetail({this.isActive, this.busNumber, this.busStops});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isActive'] = isActive;
    data['busNumber'] = busNumber;
    data['busStops'] = busStops;
    return data;
  }
}
