import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'detail_page.dart';
import 'widgets/category_boxes.dart';
import 'icons.dart';
import 'widgets/discover_card.dart';
import 'widgets/discover_small_card.dart';
import 'widgets/svg_asset.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({
    Key? key,
  }) : super(key: key);

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff121421),
      body: SafeArea(
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 28,
                right: 18,
                top: 36,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Discover",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 34,
                          fontWeight: FontWeight.bold)),
                  InkWell(
                    borderRadius: BorderRadius.circular(360),
                    onTap: onSearchIconTapped,
                    child: Container(
                      height: 35,
                      width: 35,
                      child: Center(
                        child: SvgAsset(
                          assetName: AssetName.search,
                          height: 24,
                          width: 24,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 120,
              child: ListView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(
                    width: 28,
                  ),
                  CategoryBoxes(
                    text: "Insomnia",
                    onPressed: (value) => print(value),
                  ),
                  CategoryBoxes(
                    text: "Depression",
                    onPressed: (value) => print(value),
                  ),
                  CategoryBoxes(
                    text: "Baby Sleep",
                    onPressed: (value) => print(value),
                  ),
                  CategoryBoxes(
                    text: "Insomnia",
                    onPressed: (value) => print(value),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 28),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recommended",
                    style: TextStyle(
                        color: Color(0xff515979),
                        fontWeight: FontWeight.w500,
                        fontSize: 14),
                  ),
                  GestureDetector(
                      onTap: onSeeAllTapped,
                      child: Text("See All",
                          style: TextStyle(
                              color: Color(0xff4A80F0),
                              fontWeight: FontWeight.w500,
                              fontSize: 14)))
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            SizedBox(
              height: 176,
              child: ListView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(width: 28),
                  DiscoverCard(
                    tag: "sleepMeditation",
                    onTap: onSleepMeditationTapped,
                    title: "Sleep Meditation",
                    subtitle: "7 Day Audio and Video Series",
                  ),
                  SizedBox(width: 20),
                  DiscoverCard(
                    onTap: onDepressionHealingTapped,
                    title: "Depression Healing",
                    subtitle: "10 Days Audio and Video Series",
                    gradientStartColor: Color(0xffFC67A7),
                    gradientEndColor: Color(0xffF6815B),
                  ),
                ],
              ),
            ),
            SizedBox(height: 28),
            Padding(
              padding: EdgeInsets.only(left: 28),
              child: Text(
                "Recent",
                style: TextStyle(
                    color: Color(0xff515979),
                    fontWeight: FontWeight.w500,
                    fontSize: 14),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 28),
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 19,
                    mainAxisExtent: 125,
                    mainAxisSpacing: 19),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  DiscoverSmallCard(
                    onTap: () {},
                    title: "Calming Sounds",
                    gradientStartColor: Color(0xff13DEA0),
                    gradientEndColor: Color(0xff06B782),
                  ),
                  DiscoverSmallCard(
                    onTap: () {},
                    title: "Insomnia",
                    gradientStartColor: Color(0xffFC67A7),
                    gradientEndColor: Color(0xffF6815B),
                    icon: SvgAsset(
                      assetName: AssetName.tape,
                      height: 24,
                      width: 24,
                    ),
                  ),
                  DiscoverSmallCard(
                    onTap: () {},
                    title: "For Children",
                    gradientStartColor: Color(0xffFFD541),
                    gradientEndColor: Color(0xffF0B31A),
                  ),
                  DiscoverSmallCard(
                    onTap: () {},
                    title: "Tips For Sleeping",
                    icon: SvgAsset(
                      assetName: AssetName.tape,
                      height: 24,
                      width: 24,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void onSeeAllTapped() {}

  void onSleepMeditationTapped() {
    Get.to(() => DetailPage(), transition: Transition.rightToLeft);
  }

  void onDepressionHealingTapped() {}

  void onSearchIconTapped() {}
}
