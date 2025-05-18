import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Sales {
  String? totalSales;
  String? netSales;
  String? averageSales;
  int? totalOrders;
  int? totalItems;
  String? totalTax;
  String? totalShipping;
  int? totalRefunds;
  String? totalDiscount;
  String? totalsGroupedBy;
  int? totalCustomers;
  Sales({
    this.totalSales,
    this.netSales,
    this.averageSales,
    this.totalOrders,
    this.totalItems,
    this.totalTax,
    this.totalShipping,
    this.totalRefunds,
    this.totalDiscount,
    this.totalsGroupedBy,
    this.totalCustomers,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'totalSales': totalSales,
      'netSales': netSales,
      'averageSales': averageSales,
      'totalOrders': totalOrders,
      'totalItems': totalItems,
      'totalTax': totalTax,
      'totalShipping': totalShipping,
      'totalRefunds': totalRefunds,
      'totalDiscount': totalDiscount,
      'totalsGroupedBy': totalsGroupedBy,
      'totalCustomers': totalCustomers,
    };
  }

  factory Sales.fromMap(Map<String, dynamic> map) {
    return Sales(
      totalSales:
          map['totalSales'] != null ? map['totalSales'] as String : null,
      netSales: map['netSales'] != null ? map['netSales'] as String : null,
      averageSales:
          map['averageSales'] != null ? map['averageSales'] as String : null,
      totalOrders:
          map['totalOrders'] != null ? map['totalOrders'] as int : null,
      totalItems: map['totalItems'] != null ? map['totalItems'] as int : null,
      totalTax: map['totalTax'] != null ? map['totalTax'] as String : null,
      totalShipping:
          map['totalShipping'] != null ? map['totalShipping'] as String : null,
      totalRefunds:
          map['totalRefunds'] != null ? map['totalRefunds'] as int : null,
      totalDiscount:
          map['totalDiscount'] != null ? map['totalDiscount'] as String : null,
      totalsGroupedBy:
          map['totalsGroupedBy'] != null
              ? map['totalsGroupedBy'] as String
              : null,
      totalCustomers:
          map['totalCustomers'] != null ? map['totalCustomers'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Sales.fromJson(String source) =>
      Sales.fromMap(json.decode(source) as Map<String, dynamic>);
}
