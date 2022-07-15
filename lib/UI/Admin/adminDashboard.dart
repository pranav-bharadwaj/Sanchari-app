import 'package:flutter/material.dart';
import 'package:sanchari/UI/Admin/addEmployee.dart';
import 'package:sanchari/UI/Admin/addNotifications.dart';
import 'package:sanchari/UI/Admin/viewEmployees.dart';
import 'package:sanchari/constants.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({Key? key}) : super(key: key);

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kLightSecondaryColor,
      body: Stack(
        children: [
          Container(
            height: size.height * .45,
            decoration: BoxDecoration(
                color: Color(0xFFF5CEB8),
                image: DecorationImage(
                    alignment: Alignment.center,
                    image: AssetImage("assets/markus.jpg"),
                    fit: BoxFit.fill)),
          ),
          SafeArea(
              child: Padding(
            padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () => {
                    Navigator.pop(context),
                  },
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      alignment: Alignment.center,
                      height: 52,
                      width: 52,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(255, 255, 255, 0.5),
                          shape: BoxShape.circle),
                      child: Icon(Icons.exit_to_app),
                    ),
                  ),
                ),
                Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Admin Area",
                      style: TextStyle(
                          fontSize: 30,
                          color: kLightPrimaryColor,
                          fontWeight: FontWeight.w700),
                    )),
                SizedBox(
                  height: 20,
                ),
                CircleAvatar(
                  backgroundImage: AssetImage('assets/sanchari.jpeg'),
                  radius: 60,
                ),
                SizedBox(
                  height: 40,
                ),
                Expanded(
                    child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: 0.70,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  children: [
                    AdminCategoryCard(
                        iconSrc: "assets/admin/bus.jpg", title: "Add Bus"),
                    GestureDetector(
                      onTap: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddEmployee()),
                        )
                      },
                      child: AdminCategoryCard(
                          iconSrc: "assets/admin/worker.png",
                          title: "Add Employee"),
                    ),
                    GestureDetector(
                      onTap: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddNotifications()),
                        )
                      },
                      child: AdminCategoryCard(
                          iconSrc: "assets/admin/bell.jpg",
                          title: "Notifications"),
                    ),
                    GestureDetector(
                      onTap: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ViewEmployees()),
                        )
                      },
                      child: AdminCategoryCard(
                          iconSrc: "assets/admin/teamwork.png",
                          title: "View Employees"),
                    ),
                  ],
                ))
              ],
            ),
          ))
        ],
      ),
    );
  }
}

class AdminCategoryCard extends StatelessWidget {
  final String iconSrc;
  final String title;

  const AdminCategoryCard({
    Key? key,
    required this.iconSrc,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.light
            ? kLightSecondaryColor
            : kDarkPrimaryColor,
        borderRadius: BorderRadius.circular(13),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(0, 7), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Spacer(),
          Image.asset(iconSrc),
          Spacer(),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
