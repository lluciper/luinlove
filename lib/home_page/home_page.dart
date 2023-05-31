import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/home_page/slider_one.dart';
import 'package:flutter_application_1/home_page/slider_two.dart';
import 'package:flutter_application_1/wave/wave_animation.dart';
import 'package:google_fonts/google_fonts.dart';

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
      body: SizedBox(
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
                            return SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: i == 1 ? SliderOne() : SliderTwo(),
                            );
                            // Text(
                            //   i == 1
                            //       ? 'text $numberOfDays'
                            //       // : 'tuan $tuan ngay $ngay',
                            //       : SlideTwo(),
                            //   style: TextStyle(fontSize: 16.0),
                            // ));
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
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(80),
            color: Colors.pink[50],
            border: Border.all(
              color: Colors.red,
            ),
          ),
        ),
        Row(
          children: [
            Text(
              'name',
              style: GoogleFonts.gamjaFlower(
                fontWeight: FontWeight.w700,
                fontSize: 24,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              'old',
              style: GoogleFonts.gamjaFlower(
                fontWeight: FontWeight.w500,
                fontSize: 24,
              ),
            ),
          ],
        )
      ],
    );
  }
}
