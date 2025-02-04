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
    final homeProvider = getIt<HomeProvider>()
      ..getBanners()
      ..getProducts();
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
            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 300,
                    child: CarouselSlider(
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
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 400,
                    width: double.infinity,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: homeProvider.products?.data?.length,
                      itemBuilder: (context, index) {
                        final item = homeProvider.products?.data?[index];

                        return SizedBox(
                          height: 300,
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(32.0),
                              child: Column(
                                children: [
                                  Image.network(
                                      "data:image/jpeg;base64,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"),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(item?.shortDescription ?? "404"),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(item?.price.toString() ?? "\$10"),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(item?.quintity.toString() ?? "100"),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
