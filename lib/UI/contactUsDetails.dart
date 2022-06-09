import "package:flutter/material.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sanchari/Models/contactUs_model.dart';
import 'package:sanchari/Providers/darkTheme_provider.dart';
import 'package:sanchari/constants.dart';

class ContactUsDetailsScreen extends StatefulWidget {
  final ContactUsModel data;
  const ContactUsDetailsScreen({Key? key, required this.data})
      : super(key: key);

  @override
  State<ContactUsDetailsScreen> createState() => _ContactUsDetailsScreenState();
}

class _ContactUsDetailsScreenState extends State<ContactUsDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    bool isLightMode = context.watch<DarkTheme>().isLightMode;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: isLightMode ? kLightPrimaryColor : kDarkPrimaryColor,
        iconTheme: IconThemeData(
            color: isLightMode ? kDarkPrimaryColor : kLightPrimaryColor),
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              "Our Team",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Hero(
                tag: widget.data.image,
                child: Container(
                  decoration: BoxDecoration(
                      color: kLightPrimaryColor,
                      borderRadius: BorderRadius.circular(30),
                      image: DecorationImage(
                          image: AssetImage(widget.data.image),
                          fit: BoxFit.cover),
                      boxShadow: const [
                        BoxShadow(
                            offset: Offset(0, 4),
                            blurRadius: 4,
                            color: kDarkPrimaryColor)
                      ]),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Column(
                  children: [
                    Text(
                      widget.data.name,
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(kSpacingUnit.w * 2.0),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      widget.data.role,
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(kSpacingUnit.w * 1.45),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      widget.data.phone,
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(kSpacingUnit.w * 1.45),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      widget.data.email,
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(kSpacingUnit.w * 1.45),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
