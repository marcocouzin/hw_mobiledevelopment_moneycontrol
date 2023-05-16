
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hw_mobiledevelopment_moneycontrol/authentication/ui/splashscreen/splash_screen.dart';

import '../../bloc/auth_cubit.dart';
import '../../bloc/auth_cubit_state.dart';

class SplashContainer extends BlocBuilder<AuthCubit, AuthCubitState> {

  SplashContainer({super.key}) : super(builder: (context, state) {


    return SplashScreen(
        isAuthenticated: AuthCubitProvider.of(context).checkLogin(),
    );
  });
}