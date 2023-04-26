import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/wave/wave_animation.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: [
              const Positioned(
                bottom: 150,
                child: WaveAnimation(),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Flexible(
                    flex: 1,
                    child: SizedBox.shrink(),
                  ),
                  Flexible(
                    flex: 4,
                    child: CarouselSlider(
                      options:
                          CarouselOptions(height: 400.0, viewportFraction: 1),
                      items: [1, 2].map((i) {
                        DateTime now = DateTime.now();
                        DateTime endDate = DateTime(2023, 3, 26);

                        Duration difference = endDate.difference(now);
                        int numberOfDays = difference.inDays;

                        int tuan = numberOfDays ~/ 7;
                        int ngay = numberOfDays % 7;
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.symmetric(horizontal: 5.0),
                                decoration: BoxDecoration(color: Colors.amber),
                                child: Text(
                                  i == 1
                                      ? 'text $numberOfDays'
                                      : 'tuan $tuan ngay $ngay',
                                  style: TextStyle(fontSize: 16.0),
                                ));
                          },
                        );
                      }).toList(),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        item(),
                        item(),
                      ],
                    ),
                  ),
                  const Flexible(
                    flex: 1,
                    child: SizedBox.shrink(),
                  ),
                ],
              ),
            ],
          )),
    );
  }

  Widget item() {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.pink[50],
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Text('data'),
            const SizedBox(width: 8),
            Text('data'),
          ],
        )
      ],
    );
  }
}
