import 'package:icloudready/app/modules/home/models/property.dart';

class PropertyData {
  final List<Property> data;
  final int totalCount;
  final int count;
  final String? nextUrl;

  PropertyData({
    required this.data,
    required this.totalCount,
    required this.count,
    required this.nextUrl,
  });

  factory PropertyData.fromJson(Map<String, dynamic> json) {
    List<dynamic> dataList = json['data'];
    List<Property> properties =
        dataList.map((property) => Property.fromJson(property)).toList();

    return PropertyData(
      data: properties,
      totalCount: json['totalCount'] as int,
      count: json['count'] as int,
      nextUrl: json['nextUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> propertyList =
        data.map((property) => property.toJson()).toList();

    return {
      'data': propertyList,
      'totalCount': totalCount,
      'count': count,
      'nextUrl': nextUrl,
    };
  }
}
