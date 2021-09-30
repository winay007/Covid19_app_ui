import 'package:covid_app_ui/constants.dart';
import 'package:covid_app_ui/widgets/weekly_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildDetailsAppbar(context),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    blurRadius: 54,
                    offset: Offset(0, 21),
                    color: Colors.black.withOpacity(0.02)),
                      ],
                     borderRadius: BorderRadius.circular(20), 
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildTileWithMoreApp(),
                    SizedBox(
                      height: 15,
                    ),
                    buildCaseNumber(context),
                    Text(
                      "From Health Center",
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: kTextColor,
                          fontSize: 16),
                    ),
                    WeekklyChart(),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildInfoTextwihPercent("From last week", "6.43"),
                        buildInfoTextwihPercent("Recovery rate", "9.43"),
                      ],
                    ),
                  ]),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 21),
                        blurRadius: 54,
                        color: Colors.black.withOpacity(0.05)),
                  ]),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Global Map",
                        style: TextStyle(fontSize: 15),
                      ),
                      SvgPicture.asset("assets/icons/more.svg")
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SvgPicture.asset("assets/icons/map.svg")
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  RichText buildInfoTextwihPercent(String title, String percantage) {
    return RichText(
        text: TextSpan(children: [
      TextSpan(
          text: "$percantage\n",
          style: TextStyle(fontSize: 20, color: kPrimaryColor)),
      TextSpan(
          text: "$title",
          style: TextStyle(color: kTextMediumColor, height: 1.5))
    ]));
  }

  Row buildCaseNumber(BuildContext context) {
    return Row(
      children: [
        Text(
          "547",
          style: Theme.of(context)
              .textTheme
              .display3
              ?.copyWith(color: kPrimaryColor, height: 1.2),
        ),
        Text(
          "5.9%",
          style: TextStyle(color: kPrimaryColor),
        ),
        SvgPicture.asset("assets/icons/increase.svg")
      ],
    );
  }

  Row buildTileWithMoreApp() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "New cases",
          style: TextStyle(
              color: kTextMediumColor,
              fontSize: 15,
              fontWeight: FontWeight.w600),
        ),
        SvgPicture.asset("assets/icons/more.svg"),
      ],
    );
  }

  AppBar buildDetailsAppbar(BuildContext context) {
    return AppBar(
      backgroundColor: kBackgroundColor,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: kPrimaryColor,
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset("assets/icons/search.svg"),
          color: kPrimaryColor,
        )
      ],
    );
  }
}
