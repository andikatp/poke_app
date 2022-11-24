import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poke_app/bloc/poke_bloc.dart';
import 'package:poke_app/screens/home_screen.dart';

void main() {
  //Hide StatusBar above
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //Make multiBlocProvider with PokeBloc as the bloc provider
    return MultiBlocProvider(
      providers: [
        BlocProvider<PokeBloc>(
          create: (context) => PokeBloc(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: const Color(0xFF121212),
          textTheme: ThemeData().textTheme.apply(
                fontFamily: GoogleFonts.poppins().fontFamily,
                displayColor: Colors.white,
                bodyColor: Colors.white,
              ),
          colorScheme: ThemeData.dark().colorScheme.copyWith(
                primary: const Color(0xFF121212),
                secondary: const Color(0xFF808080),
              ),  
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: HomeScreen.routeName,
        routes: {
          HomeScreen.routeName: (context) => const HomeScreen(),
        },
      ),
    );
  }
}
