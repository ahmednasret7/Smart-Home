

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hi_ddd_test1/modules/smart-home-app/cubit/states.dart';

class HomeCubit extends Cubit<HomeStates>
{
  HomeCubit() : super(HomeInitialState());

}