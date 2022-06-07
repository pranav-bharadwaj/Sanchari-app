import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:sanchari/constants.dart';
import 'package:sanchari/contactUs.dart';
import 'package:sanchari/editProfile.dart';
import 'package:sanchari/feedback.dart';
import 'package:sanchari/passwordReset.dart';

import 'package:share/share.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    var profileInfo = Expanded(
      child: Column(
        children: [
          Container(
            height: kSpacingUnit.w * 10,
            width: kSpacingUnit.w * 10,
            margin: EdgeInsets.only(top: kSpacingUnit.w * 3),
            child: Stack(
              children: [
                CircleAvatar(
                  radius: kSpacingUnit.w * 5,
                  backgroundImage: AssetImage("assets/sanchari.jpeg"),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    height: kSpacingUnit.w * 2.5,
                    width: kSpacingUnit.w * 2.5,
                    child: Icon(LineAwesomeIcons.pen,
                        color: kDarkPrimaryColor,
                        size: ScreenUtil().setSp(kSpacingUnit.w * 1.5)),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: kSpacingUnit.w * 2),
          Text(
            'MONU',
            style: kTitleTextStyle,
          ),
          SizedBox(height: kSpacingUnit.w * 0.5),
          Text(
            'monu2001@gmail.com',
            style: kCaptionTextStyle,
          ),
        ],
      ),
    );
    return Scaffold(
        body: Column(
      children: [
        SizedBox(
          height: kSpacingUnit.w * 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(width: kSpacingUnit.w * 3),
            GestureDetector(
              onTap: () => {
                Navigator.pop(context),
              },
              child: Icon(LineAwesomeIcons.arrow_left,
                  size: ScreenUtil().setSp(kSpacingUnit.w * 3)),
            ),
            profileInfo,
            GestureDetector(
                onTap: () => {print("HI")},
                child: ThemeSwitcher(
                  builder: (context) => Icon(LineAwesomeIcons.sun,
                      size: ScreenUtil().setSp(kSpacingUnit.w * 3)),
                )),
            SizedBox(
              width: kSpacingUnit.w * 3,
            ),
          ],
        ),
        Expanded(
            child: ListView(
          children: [
            GestureDetector(
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const EditProfile()),
                )
              },
              child: ProfileListItem(
                icon: LineAwesomeIcons.edit,
                text: 'Edit Profile',
              ),
            ),
            GestureDetector(
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PasswordReset()),
                )
              },
              child: ProfileListItem(
                icon: LineAwesomeIcons.lock,
                text: 'Password Reset',
              ),
            ),
            GestureDetector(
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FeedBack()),
                )
              },
              child: ProfileListItem(
                icon: LineAwesomeIcons.question_circle,
                text: 'Feedback',
              ),
            ),
            GestureDetector(
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ContactUs()),
                )
              },
              child: ProfileListItem(
                icon: LineAwesomeIcons.phone,
                text: 'Contact Us',
              ),
            ),
            GestureDetector(
              onTap: () => {
                Share.share(
                    'Hey! Check out this new app Sanchari https://github.com/Sanchari4us/Sanchari',
                    subject: 'Sanchari app'),
              },
              child: ProfileListItem(
                icon: LineAwesomeIcons.user_plus,
                text: 'Invite a Friend',
              ),
            ),
            ProfileListItem(
              icon: LineAwesomeIcons.alternate_sign_out,
              text: 'Logout',
              hasNavigation: false,
            ),
          ],
        ))
      ],
    ));
  }
}

class ProfileListItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool hasNavigation;

  const ProfileListItem({
    key,
    required this.icon,
    required this.text,
    this.hasNavigation = true,
  }) : super(key: key);

  // const ProfileListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kSpacingUnit.w * 5.5,
      margin: EdgeInsets.symmetric(
        horizontal: kSpacingUnit.w * 4,
      ).copyWith(
        bottom: kSpacingUnit.w * 2,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: kSpacingUnit.w * 2,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kSpacingUnit.w * 3),
        color: Theme.of(context).backgroundColor,
      ),
      child: Row(
        children: <Widget>[
          Icon(
            this.icon,
            size: kSpacingUnit.w * 2.5,
          ),
          SizedBox(width: kSpacingUnit.w * 1.5),
          Text(
            this.text,
            style: kTitleTextStyle.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          Spacer(),
          if (this.hasNavigation)
            Icon(
              LineAwesomeIcons.angle_right,
              size: kSpacingUnit.w * 2.5,
            ),
        ],
      ),
    );
  }
}
