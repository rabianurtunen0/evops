import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class Charge extends StatefulWidget {
  const Charge({Key? key}) : super(key: key);

  @override
  State<Charge> createState() => _ChargeState();
}

class _ChargeState extends State<Charge> {


  List batteryHeightList = [
  0.004, // 100%
  0.013, // 95-99%
  0.022, // 90-94%
  0.031, // 85-89%
  0.040, // 80-84%
  0.049, // 75-79%
  0.058, // 70-74%
  0.067, // 65-69%
  0.076, // 60-64%
  0.085, // 55-59%
  0.094, // 50-54%
  0.103, // 45-49%
  0.112, // 40-44%
  0.121, // 35-39%
  0.130, // 30-34%
  0.139, // 25-29%
  0.148, // 20-24%
  0.157, // 15-19%
  0.166, // 10-14%
  0.175, // 5-9%
  0.184, // 0-4%
];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(0.0, 25.0, 0.0, 75.0),
              alignment: Alignment.topCenter,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(150.0),
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(context).primaryColorDark,
                          blurRadius: 10.0,
                          spreadRadius: 2.0,
                          offset: const Offset(1.0, 1.0),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).backgroundColor,
                          border: Border.all(
                            color: Theme.of(context).primaryColorLight,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(150.0),
                        ),
                        child: CircleAvatar(
                          backgroundColor: Theme.of(context).backgroundColor,
                          radius: 120.0,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(36.5),
                    child: Container(
                      width: 180,
                      height: 180,
                      decoration: BoxDecoration(
                        color: Theme.of(context).backgroundColor,
                        boxShadow: [
                          BoxShadow(
                            color: Theme.of(context).primaryColor,
                            blurRadius: 20.0,
                            spreadRadius: 1.0,
                            offset: const Offset(1.0, 1.0),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(200.0),
                      ),
                      child: SfRadialGauge(
                        backgroundColor: Colors.transparent,
                        axes: <RadialAxis>[
                          RadialAxis(
                            minimum: 0,
                            maximum: 360,
                            endAngle: 90,
                            startAngle: 90,
                            showTicks: false,
                            showLabels: false,
                            showAxisLine: true,
                            axisLineStyle: const AxisLineStyle(
                              thickness: 0.12,
                              cornerStyle: CornerStyle.bothFlat,
                              thicknessUnit: GaugeSizeUnit.factor,
                              color: Color(0XFF8ABA41),
                            ),
                            pointers: const <GaugePointer>[
                              MarkerPointer(
                                  value: 200,
                                  markerHeight: 22,
                                  markerWidth: 22,
                                  markerType: MarkerType.circle,
                                  enableDragging: true,
                                  color: Color(0XFF8ABA41),
                                  borderWidth: 6,
                                  elevation: 10,
                                  borderColor: Colors.white),
                            ],
                            annotations: <GaugeAnnotation>[
                              GaugeAnnotation(
                                widget: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(
                                        BootstrapIcons.lightning_charge,
                                        color:
                                            Theme.of(context).backgroundColor ==
                                                    const Color(0XFF282A37)
                                                ? Colors.white
                                                : const Color(0XFF8ABA41),
                                        size: 24,
                                      ),
                                    ),
                                    Text(
                                      '60%',
                                      style: TextStyle(
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 20.0,
                                        color:
                                            Theme.of(context).backgroundColor ==
                                                    const Color(0XFF282A37)
                                                ? Colors.white
                                                : const Color(0XFF8ABA41),
                                      ),
                                    ),
                                  ],
                                ),
                                positionFactor: 0.05,
                                angle: 90,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: MediaQuery.of(context).size.height * 0.36,
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(12.0),
                      top: Radius.circular(12.0),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(15.0),
                        child: Text(
                          'Batttery',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),

                  
                      Container(
                          margin: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                          padding: EdgeInsets.fromLTRB(4.0, MediaQuery.of(context).size.height.toDouble() * batteryHeightList[12], 4.0, 4.0),
                          width: MediaQuery.of(context).size.width * 0.22,
                          height: MediaQuery.of(context).size.height * 0.2,
                          decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            border: Border.all(
                              width: 1.0,
                              color: Theme.of(context).highlightColor,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0XFF8ABA41),
                                blurRadius: 2.0,
                                spreadRadius: 1.0,
                                offset: Offset(0.0, 0.0),
                              ),
                            ],
                          ),
                          child: Container(
                            alignment: Alignment.center,
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                            color: const Color(0XFF8ABA41),
                            borderRadius: BorderRadius.circular(9.0),
                        
                            
                          ),
                          child: Text(
                            '50%',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headlineMedium
                          ),
                          )
                        
                          
                        ),
                       
                      
                      
                    ],
                  )
                ),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          bottom: MediaQuery.of(context).size.height * 0.03),
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.height * 0.1,
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: const BorderRadius.vertical(
                          bottom: Radius.circular(12.0),
                          top: Radius.circular(12.0),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      margin: EdgeInsets.only(
                          bottom: MediaQuery.of(context).size.height * 0.03),
                      height: MediaQuery.of(context).size.height * 0.1,
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: const BorderRadius.vertical(
                          bottom: Radius.circular(12.0),
                          top: Radius.circular(12.0),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.height * 0.1,
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: const BorderRadius.vertical(
                          bottom: Radius.circular(12.0),
                          top: Radius.circular(12.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
