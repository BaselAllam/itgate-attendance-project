import 'package:flutter/material.dart';
import 'package:itgate/models/main_model.dart';
import 'package:itgate/theme/shared_color.dart';
import 'package:itgate/theme/shared_font_style.dart';
import 'package:itgate/widgets/snack_bar.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:url_launcher/url_launcher.dart';


class AboutScreen extends StatefulWidget {

  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
      builder: (context, child, MainModel model) {
        return Scaffold(
          backgroundColor: Colors.white,
            appBar: AppBar(
              elevation: 0.0,
              title: Text(
                  'About Us',
                  style: primaryBlackFontStyle,
                ),
              backgroundColor: Colors.white,
            ),
            body: Container(
              margin: EdgeInsets.all(10.0),
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ListTile(
                      leading: Container(
                        height: 70.0,
                        width: 70.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          image: DecorationImage(
                            image: AssetImage('assets/logo.png'),
                          )
                        ),
                      ),
                      title: Text(
                        'It Gate Academy',
                        style: primaryBlackFontStyle
                      ),
                    ),
                  ),
                  Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            socialItem(
                              'assets/web.png',
                              'https://www.itgateacademy.com/'
                            ),
                            socialItem(
                              'assets/fb.png',
                              'https://www.facebook.com/ITGateAcademy/?ref=br_rs'
                            ),
                            socialItem(
                              'assets/insta.png',
                              'https://www.instagram.com/itgate_academy/'
                            ),
                            socialItem(
                              'assets/linkedin.png',
                              'https://www.linkedin.com/in/it-gate-academy'
                            ),
                          ],
                        ),
                      ),
                  item('Address:', '14 Ahmed Hosny St, From Tayran St, Rabea El Adawya, Nasr City, Cairo, Egypt', Icons.location_on),
                  item('Tel:', '0106765737 - 01032841556 - 01115166255 - 02 22605347', Icons.phone),
                  item('About Us', '${model.aboutModel!.about}', Icons.info_outline),
                  item('Our Mission', '${model.aboutModel!.mission}', Icons.track_changes_rounded),
                  item('Our Vision', '${model.aboutModel!.vision}', Icons.remove_red_eye),
                ],
              )
            ),
          );
      },
    );
  }
  Card item(String title, String subtitle, IconData icon) {
    return Card(
      margin: EdgeInsets.all(10.0),
      elevation: 5.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: ListTile(
        leading: Icon(icon, color: secondaryColor, size: 20.0),
        title: Text(
          '$title',
          style: primaryFontStyle
        ),
        subtitle: Text(
          '$subtitle',
          style: subTextStyle,
        ),
      ),
    );
  }
  InkWell socialItem(String image, String url) {
    return InkWell(
      onTap: () async {
        bool _valid = await launch(url);
        if(_valid == false) {
          ScaffoldMessenger.of(context).showSnackBar(snack('Some Thing Went Wrong', Colors.red));
        }
      },
      child: CircleAvatar(
        backgroundImage: AssetImage(image),
        backgroundColor: Colors.white,
        minRadius: 18.0,
        maxRadius: 18.0,
      ),
    );
  }
}