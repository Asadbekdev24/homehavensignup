import 'package:flutter/material.dart';
import 'package:home_haven_clean/features/home/domain/entities/banner_entity.dart';

Widget buildCarouselItem({
  required BannerData bannerData,
}) {
  return Container(
    // margin: EdgeInsets.all(8),
    decoration: BoxDecoration(
      image: DecorationImage(
        fit: BoxFit.cover,
        image: NetworkImage("https://e-commerce.birnima.uz${bannerData.image}"),
      ),
      color: Colors.cyan,
      borderRadius: BorderRadius.circular(16),
    ),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          begin: Alignment(0.00, 0.00),
          end: Alignment(0.4, 0.1),
          colors: [Color(0xEF156650), Color(0xAA156650), Color(0x00156650)],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 178,
                    child: Text(
                      bannerData.title.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w700,
                        height: 1.20,
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  SizedBox(
                    width: 178,
                    child: Text(
                      bannerData.shortDescription.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w400,
                        height: 1.40,
                      ),
                    ),
                  ),
                  SizedBox(height: 4),
                  FittedBox(
                    child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'Shop Now',
                          style: TextStyle(
                            color: Color(0xFF156650),
                            fontSize: 12,
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.w700,
                            height: 1.20,
                          ),
                        )),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
