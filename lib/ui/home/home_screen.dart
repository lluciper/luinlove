import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../components/wave/wave_animation.dart';
import '../../cubit/home/home_cubit.dart';
import '../../utils/utils.dart';
import 'slider_one.dart';
import 'slider_two.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().init();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Stack(
                children: [
                  Positioned(
                    child: InkWell(
                      onTap: () async {
                        context.read<HomeCubit>().chooseImages();
                      },
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        color: AppColors.pink50.withOpacity(0.1),
                        child:
                            state.path != null && File(state.path!).existsSync()
                                ? Image.file(
                                    File(state.path!),
                                    fit: BoxFit.fill,
                                  )
                                : const SizedBox.shrink(),
                      ),
                    ),
                  ),
                  const Positioned(
                    bottom: 0,
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
                          options: CarouselOptions(
                              height: 400.0, viewportFraction: 1),
                          items: [1, 2].map((i) {
                            return Builder(
                              builder: (BuildContext context) {
                                return SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: i == 1
                                      ? const SliderOne()
                                      : const SliderTwo(),
                                );
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
              ));
        },
      ),
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
            color: AppColors.pink50,
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
