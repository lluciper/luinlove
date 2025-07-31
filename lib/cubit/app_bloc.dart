import 'package:flutter_bloc/flutter_bloc.dart';
import 'home/home_cubit.dart';

class AppBlocs {
  static final appDataCubit = HomeCubit();

  static final List<BlocProvider> blocProviders = [
    BlocProvider<HomeCubit>(
      create: (context) => appDataCubit,
    ),
  ];
}
