import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthy_mind_application/features/auth/bloc/auth_bloc/auth_bloc.dart';
import 'package:healthy_mind_application/features/home/presentation/pages/HomeScreen.dart';
import 'package:healthy_mind_application/features/intro/data/models/SliderModel.dart';
import 'package:healthy_mind_application/features/intro/presentation/widgets/Pagination.dart';
import 'package:healthy_mind_application/features/intro/presentation/widgets/Slider.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  List<SliderModel> slides = [];
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
    slides = getSlides();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state.status == AuthStatus.authenticated) {
          return HomeScreen();
        } else {
          return Scaffold(
            body: Column(
              children: [
                Expanded(
                  child:
                      //Slider
                      PageView.builder(
                        scrollDirection: Axis.horizontal,
                        controller: _controller,
                        onPageChanged: (value) {
                          setState(() {
                            currentIndex = value;
                          });
                        },
                        itemCount: slides.length,
                        itemBuilder: (context, index) {
                          return Carousel(
                            image: slides[index].getImage(),
                            title: slides[index].getTitle(),
                            description: slides[index].getDescription(),
                          );
                        },
                      ),
                ),
                // Pagination
                Pagination(
                  currentIndex: currentIndex,
                  controller: _controller,
                  slides: slides,
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
