import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:home_haven_clean/core/common/app/services/injcetion_container.dart';
import 'package:home_haven_clean/features/home/domain/entities/banner_entity.dart';
import 'package:home_haven_clean/features/home/presentation/controllers/home_controller.dart';
import 'package:home_haven_clean/features/home/presentation/widgets/banner_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    final homeProvider = getIt<HomeProvider>()..getBanners();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<HomeProvider>(
          builder: (context, homeProvider, child) {
            if (homeProvider.isLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (homeProvider.banners?.data != null &&
                homeProvider.banners!.data!.isEmpty) {
              return Center(
                child: Text("Banners empty"),
              );
            }
            return CarouselSlider(
              disableGesture: true,
              items: List.generate(
                homeProvider.banners?.data?.length ?? 0,
                (index) {
                  final BannerData bannerData =
                      homeProvider.banners!.data![index];
                  return buildCarouselItem(bannerData: bannerData);
                },
              ),
              options: CarouselOptions(
                height: 200.0,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 8,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(seconds: 2),
                viewportFraction: 0.8,
              ),
            );
          },
        ),
      ),
    );
  }
}
