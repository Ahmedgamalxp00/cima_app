import 'package:cima_app/features/home_feature/presentation/views/widgets/popular_movies_section.dart';
import 'package:cima_app/features/home_feature/presentation/views/widgets/slider.dart';
import 'package:cima_app/features/home_feature/presentation/views/widgets/topRated_movies_Section.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              MoviesSlider(),
              PopularMoviesSection(),
              TopRatedMoviesSection(),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
