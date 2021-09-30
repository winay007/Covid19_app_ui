import 'package:covid_app_ui/constants.dart';
import 'package:covid_app_ui/screens/details_screen.dart';
import 'package:covid_app_ui/widgets/info_card.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                color: kPrimaryColor.withOpacity(.03),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40)),
              ),
              child: Wrap(spacing: 12,runSpacing: 20, children: [
                InfoCard(1067, Colors.orange, "Confirmed Cases", () {}),
                InfoCard(75, Colors.red.shade400, "Total Deaths", () {}),
                InfoCard(600, Colors.blue, "Total Recovered", () {}),
                InfoCard(120, Colors.grey, "New Cases", () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return DetailsScreen();
                      },
                    ),
                  );
                }),
              ]),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Preventions",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                  buildPrevention(),
                  SizedBox(
                    height: 60,
                  ),
                  buildHelpCard(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row buildPrevention() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        PreventionCard("Wash Hands", "assets/icons/hand_wash.svg"),
        PreventionCard("Use Mask", "assets/icons/use_mask.svg"),
        PreventionCard("Clean Disinfect", "assets/icons/Clean_Disinfect.svg"),
      ],
    );
  }

  Container buildHelpCard(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Container(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * .4,
                top: 20,
                right: 20),
            height: 130,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xFF60BE93), Color(0xFF1B8D59)]),
              borderRadius: BorderRadius.circular(20),
            ),
            child: RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: "Dial 991 for\nMedical help \n",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15)),
                TextSpan(
                    text: "If any symptoms appear",
                    style: TextStyle(color: Colors.white.withOpacity(0.7)))
              ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: SvgPicture.asset("assets/icons/nurse.svg"),
          ),
          Positioned(
              top: 30,
              right: 10,
              child: SvgPicture.asset("assets/icons/virus.svg")),
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: kPrimaryColor.withOpacity(.03),
      elevation: 0,
      leading: IconButton(
        icon: new SvgPicture.asset('assets/icons/menu.svg'),
        onPressed: () {},
      ),
      actions: [
        IconButton(
          icon: SvgPicture.asset('assets/icons/search.svg'),
          onPressed: () {},
        )
      ],
    );
  }
}

class PreventionCard extends StatelessWidget {
  final String title;
  final String svgSrc;

  PreventionCard(this.title, this.svgSrc);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(svgSrc),
        Text(
          title,
          style: TextStyle(color: kPrimaryColor),
        ),
      ],
    );
  }
}
