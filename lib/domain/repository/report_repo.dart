import 'package:dio/dio.dart';
import 'package:genius_shop/domain/interfaces/report_interface.dart';
import 'package:genius_shop/domain/model/report.dart';
import 'package:genius_shop/domain/model/sales.dart';
import 'package:get/get.dart';

import '../../core/api/storage_service.dart';
import '../../core/helper/dio_api_handler.dart';
import '../../main.dart';

enum ReportType {
  sales,
  top_sellers,
  orders_totals,
  products_totals,
  customers_totals,
  coupons_totals,
  reviews_totals,
  categories_totals,
  tags_totals,
  attributes_totals,
  //.replaceAll('_', '/')
}

class ReportRepository extends IReport {
  final _dio = Get.find<Dio>();

  final token = Get.find<StorageService>().getData(StorageService.authToken);
  @override
  Future<List<Report>?> getAllReport() async {
    final response = await DioApiHandler.execute(
      apiCall:
          () => _dio.get(
            '$BASE_Endpoint/wp-json/wc/v3/reports',
            options: Options(headers: {'Authorization': 'Bearer $token'}),
          ),
      operationName: 'Fetch Reports',
    );
    if (response.data == null) return [];
    final data =
        response.data
            .map<Report>((json) => Report.fromMap(json as Map<String, dynamic>))
            .toList();

    return data;
  }

  @override
  Future<dynamic> getByUrl(Report url) async {
    final response = await DioApiHandler.execute(
      apiCall:
          () => _dio.get(
            url.href!,
            options: Options(headers: {'Authorization': 'Bearer $token'}),
          ),
      operationName: 'Fetch Url Report',
    );
    if (response.data == null) return [];
    final enumType =
        ReportType.values
            .where((t) => t.name == url.slug!.replaceAll('/', '_'))
            .first;
    switch (enumType) {
      case ReportType.sales:
        return response.data
            .map<Sales>((json) => Sales.fromMap(json as Map<String, dynamic>))
            .toList();
      case ReportType.top_sellers:
        return response.data
            .map<Sales>((json) => Sales.fromMap(json as Map<String, dynamic>))
            .toList();
      default:
    }
  }
}
