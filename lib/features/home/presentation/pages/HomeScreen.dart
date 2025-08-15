import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthy_mind_application/core/common_widgets/ButtonWidget.dart';
import 'package:healthy_mind_application/core/common_widgets/TitleWidget.dart';
import 'package:healthy_mind_application/core/constants/Constants.dart';
import 'package:healthy_mind_application/features/auth/bloc/user_bloc/user_bloc.dart';
import 'package:healthy_mind_application/features/home/presentation/widgets/FeatureCategory.dart';
import 'package:healthy_mind_application/features/home/presentation/widgets/HomeCarousel.dart';
import 'package:healthy_mind_application/features/home/presentation/widgets/ListDoctors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPage = 0;
  late Timer timer;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (currentPage < 3) {
        currentPage++;
      } else {
        currentPage = 0;
      }

      _pageController.animateToPage(
        currentPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: ColorConstant.primary,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.light_mode_outlined, color: ColorConstant.white),
                    SizedBox(width: 8),
                    Text(
                      "Chào ${context.read<UserBloc>().state.user?.name},",
                      style: TextStyle(
                        color: ColorConstant.white,
                        fontSize: FontSizeConstants.smallTitle,
                        fontWeight: FontWeightConstants.bold,
                      ),
                    ),
                  ],
                ),
                Text(
                  "Chúc bạn có một ngày tốt lành",
                  style: TextStyle(
                    color: ColorConstant.white,
                    fontSize: FontSizeConstants.medium,
                  ),
                ),
              ],
            ),
            actions: [
              Badge(
                label: Text("2"),
                alignment: Alignment(0.4, -0.6),
                child: IconButton(
                  icon: Icon(
                    Icons.notifications_none_outlined,
                    color: ColorConstant.white,
                    size: 24,
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  decoration: BoxDecoration(
                    color: ColorConstant.primary,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(48),
                      bottomRight: Radius.circular(48),
                    ),
                  ),
                ),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 16, bottom: 16),
                      height: MediaQuery.of(context).size.height * 0.17,
                      width: MediaQuery.of(context).size.width,
                      child: Expanded(
                        child: PageView(
                          controller: _pageController,
                          onPageChanged: (value) {
                            setState(() {
                              currentPage = value;
                            });
                          },
                          children: [
                            HomeCarousel(
                              image: 'assets/images/home-slider.png',
                            ),
                            HomeCarousel(
                              image: 'assets/images/home-slider-1.png',
                            ),
                            HomeCarousel(
                              image: 'assets/images/home-slider-2.png',
                            ),
                            HomeCarousel(
                              image: 'assets/images/home-slider-3.png',
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: ColorConstant.ccc.withAlpha(50),
                            spreadRadius: 5,
                            blurRadius: 8,
                            offset: Offset(0, 3),
                          ),
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        color: ColorConstant.white,
                      ),
                      padding: EdgeInsets.fromLTRB(8, 16, 8, 16),
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              FeatureCategory(
                                imgIcon: 'assets/svgs/video.svg',
                                title: 'Tư vấn từ xa',
                              ),
                              FeatureCategory(
                                imgIcon: 'assets/svgs/calendar.svg',
                                title: 'Xem lịch hẹn',
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              FeatureCategory(
                                imgIcon: 'assets/svgs/home.svg',
                                title: 'Tư vấn trực tiếp',
                              ),
                              FeatureCategory(
                                imgIcon: 'assets/svgs/content.svg',
                                title: 'Tin tức',
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              FeatureCategory(
                                imgIcon: 'assets/svgs/phone.svg',
                                title: 'Liên hệ',
                              ),
                              FeatureCategory(
                                imgIcon: 'assets/svgs/community.svg',
                                title: 'Cộng đồng',
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    ListDoctors(),
                    TitleWidget(title: "Danh mục tin tức"),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
