import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:japan_restaurant/components/button.dart';
import 'package:japan_restaurant/theme/colors.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(height: 25),

            //shop name
            Text("JAPAN FOOD",
                style: GoogleFonts.dmSerifDisplay(
                  fontSize: 40,
                  color: Colors.white,
                )),

            const SizedBox(height: 25),

            //icon
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Image.asset('lib/images/food.png'),
            ),

            const SizedBox(height: 25),

            //title
            Text("THE TASTE OF JAPANESE FOOD",
                style: GoogleFonts.dmSerifDisplay(
                  fontSize: 40,
                  color: Colors.white,
                )),

            const SizedBox(height: 25),

            //subtitle
            Text(
                "Embark on a culinary adventure to Japan and experience the unique flavors of Japanese food.",
                style: TextStyle(
                  color: Colors.grey[300],
                  height: 2,
                )),

            const SizedBox(height: 25),

            //get started
            MyButton(
              text: "Get Started",
              onTap: () {
                //goto menu page
                Navigator.pushNamed(context, '/menupage');
              },
            )
          ],
        ),
      ),
    );
  }
}
