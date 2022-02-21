import 'package:flutter/material.dart';
import 'package:itgate/models/main_model.dart';
import 'package:itgate/models/user/user_model.dart';
import 'package:itgate/theme/shared_color.dart';
import 'package:itgate/theme/shared_font_style.dart';
import 'package:scoped_model/scoped_model.dart';



class Profile extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
            'Profile',
            style: primaryBlackFontStyle,
          ),
        backgroundColor: Colors.white,
      ),
      body: ScopedModelDescendant(
        builder: (context, child, MainModel model) {
          return Container(
            margin: EdgeInsets.all(10.0),
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                profileData(model)
              ],
            ),
          );
        }
      ),
    );
  }
  profileData(MainModel model) {
    return Card(
      elevation: 3.0,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: UserModel.isStudent == false ? 
      Column(
        children: [
          profileItem(Icons.person, '${model.instructorUserModel!.userName}'),
          profileItem(Icons.info, 'Id: ${model.instructorUserModel!.id}'),
          profileItem(Icons.email, 'Email: ${model.instructorUserModel!.email}'),
          profileItem(Icons.phone, 'Mobile Number: ${model.instructorUserModel!.mobileNumber}'),
        ],
      ) :
      Column(
        children: [
          profileItem(Icons.person, '${model.stdModel!.userName}'),
          profileItem(Icons.info, 'Id: ${model.stdModel!.id}'),
          profileItem(Icons.sim_card_sharp, 'National Number: ${model.stdModel!.nationalNumber}'),
          profileItem(Icons.email, 'Email: ${model.stdModel!.email}'),
          profileItem(Icons.phone, 'Mobile Number: ${model.stdModel!.mobileNumber}'),
        ],
      ),
    );
  }
  profileItem(IconData icon, String title) {
    return Container(
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ListTile(
        leading: Icon(icon, color: secondaryColor, size: 25.0),
        title: Text(
          '$title',
          style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}