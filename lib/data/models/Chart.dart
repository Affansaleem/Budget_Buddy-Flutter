import 'dart:ui';

class ChartData {
  ChartData(this.x, this.y, this.color);
  final String x;
  final double y;
  final Color color;
}
class ChartDataSpline {
  ChartDataSpline(this.x, this.y);
  final int x;
  final double? y;
}