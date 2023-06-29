import 'package:luinlove/cubit/home/home_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocs {
  static final appDataCubit = HomeCubit();

  static final List<BlocProvider> blocProviders = [
    BlocProvider<HomeCubit>(
      create: (context) => appDataCubit,
    ),
  ];
}
