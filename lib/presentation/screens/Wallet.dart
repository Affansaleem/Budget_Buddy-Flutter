import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../data/models/Chart.dart';

class WalletPart extends StatefulWidget {
  const WalletPart({super.key});

  @override
  State<WalletPart> createState() => _WalletPartState();
}

class _WalletPartState extends State<WalletPart> {
  late TooltipBehavior _tooltipBehavior;
  final List<ChartData> chartData = [
    ChartData('Credit', 25, Color.fromRGBO(128, 128, 128, 1)),
    ChartData('Debit', 38, Colors.black),
  ];
  final List<ChartDataSpline> chartDataSpline = [
    ChartDataSpline(2010, 35),
    ChartDataSpline(2011, 13),
    ChartDataSpline(2012, 34),
    ChartDataSpline(2013, 27),
    ChartDataSpline(2014, 40)
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tooltipBehavior = TooltipBehavior(enable: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 45, horizontal: 15),
            decoration: BoxDecoration(
              color: Color(0xFfF1F5FB),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Wallet",
                  style: TextStyle(color: Color(0xFF333E52), fontSize: 19),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "\$4,523.98",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 47),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          "assets/icons/img_2.png",
                          height: 30,
                          width: 30,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text("\$ 3,030.89"),
                      ],
                    ),
                    Row(
                      children: [
                        Image.asset(
                          "assets/icons/img_3.png",
                          height: 30,
                          width: 30,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text("\$ 223.98")
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 25),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            decoration: BoxDecoration(
              color: Color(0xFfF1F5FB),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Monthly Earnings",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Income",
                  style: TextStyle(color: Colors.grey, fontSize: 15),
                ),
                SfCartesianChart(series: <CartesianSeries>[
                  SplineSeries<ChartDataSpline, int>(
                      dataSource: chartDataSpline,
                      splineType: SplineType.cardinal,
                      cardinalSplineTension: 1,
                      xValueMapper: (ChartDataSpline data, _) => data.x,
                      yValueMapper: (ChartDataSpline data, _) => data.y)
                ]),
              ],
            ),
          ),
          Container(
              height: 290,
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              decoration: BoxDecoration(
                color: Color(0xFfF1F5FB),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Earnings",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 19,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    height: 230,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        SfCircularChart(
                          tooltipBehavior: _tooltipBehavior,
                          series: <CircularSeries>[
                            DoughnutSeries<ChartData, String>(
                              dataSource: chartData,
                              xValueMapper: (ChartData data, _) => data.x,
                              yValueMapper: (ChartData data, _) => data.y,
                              innerRadius: '90%',
                              // Doughnut's inner circle radius
                              explodeAll: true,
                              cornerStyle: CornerStyle.bothCurve,
                            )
                          ],
                        ),
                        // Centered Text widget
                        Positioned(
                          child: Text(
                            '\$ 4,523.98',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
