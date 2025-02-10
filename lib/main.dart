import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/bloc/bloc/bloc/favorite_bloc.dart';
import 'package:test_task/bloc/bloc/category_bloc.dart';
import 'package:test_task/bloc/bloc/product_api_bloc.dart';
import 'package:test_task/bloc/bottom_navigation_bloc.dart';
import 'package:test_task/screens/category_screen.dart';
import 'package:test_task/screens/favorites.dart';
import 'package:test_task/screens/product_screen.dart';
import 'package:test_task/screens/splash_screen.dart';
import 'package:test_task/screens/user.dart';
import 'package:test_task/services/api_services.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BottomNavigationBloc(),
        ),
        BlocProvider(
          create: (context) => ProductBloc(ProductApiService()),
        ),
        BlocProvider(
            create: (context) =>
                CategoryBloc(ProductApiService())..add(FetchCategoryEvent())),
        BlocProvider(create: (context) => FavoriteBloc())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => SplashScreen(),
          '/home': (context) => MyHomePage(title: 'Main')
        },
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      ProductsScreen(),
      CategoryScreen(),
      FavoritesScreen(),
      UserScreen(),
    ];
    return BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
      builder: (context, state) {
        return Scaffold(
          body: screens[state.currentIndex], // Dynamically change screen
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: state.currentIndex,
            onTap: (index) {
              context.read<BottomNavigationBloc>().add(ChangeTabEvent(index));
            },
            backgroundColor: Colors.black,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.store), label: "Products"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.category), label: "Categories"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite), label: "Favorites"),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: "User"),
            ],
          ),
        );
      },
    );
  }
}
