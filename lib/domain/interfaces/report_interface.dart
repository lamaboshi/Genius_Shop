import '../model/report.dart';

abstract class IReport {
  Future<List<Report>?> getAllReport();
  Future<dynamic> getByUrl(Report url);
}
