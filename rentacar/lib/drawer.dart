import 'package:flutter/material.dart';
import 'package:rentacar/globals.dart' as globals;
import 'package:rentacar/pages/home.dart';
import 'package:rentacar/pages/login_page.dart';
import 'package:rentacar/pages/rental_cars_page.dart';
import 'package:rentacar/pages/rental_locations_page.dart';
import 'package:rentacar/pages/aboutus_page.dart';
import 'package:rentacar/pages/contact_page.dart';
import 'package:rentacar/pages/campaings_page.dart';



Drawer buildDrawer(BuildContext context) {
  return Drawer(
    backgroundColor: Colors.blue[800],
    child: ListView(
      children: [
        DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.orange[800],
          ),
          child: Column(
            children: [
              if (globals.isLoggedIn)
                Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: 80,
                          height: 80,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                colors: [
                                  Color(0xFF0D47A1),
                                  Color(0xFFBBDEFB),
                                ],
                              )
                          ),
                          child: const Text('U',
                              style: TextStyle(
                                fontSize: 34,
                                color: Colors.white,
                              )
                          ),
                        ),
                        const SizedBox(width: 20),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text('User Name',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                )
                            ),
                            SizedBox(height:2),
                            Text('user@example.com',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontStyle: FontStyle.italic,
                                )
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: 100,
                      height: 36,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Sign Out',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              else
                Column(
                  children: [
                    const Icon(
                      Icons.account_circle,
                      size: 80,
                    ),
                    const SizedBox(height: 5),
                    SizedBox(
                      width: 100,
                      height: 36,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => LoginPage())
                          );
                        },
                        child: const Text('Sign In'),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Column(
          children: [
            buildListTile('Home', Icons.home, context, HomePage()),
            buildListTile('Rental Cars', Icons.car_rental, context, const RentalCarPage()),
            buildListTile('Rental Locations', Icons.house, context, const RentalLocationPage()),
            buildListTile('Campaigns', Icons.campaign, context, const CampainsPage()),
            buildListTile('About Us', Icons.info, context, const AboutUsPage()),
            buildListTile('Contact', Icons.contact_page, context, const ContactPage()),
          ],
        )
      ],
    ),
  );
}
Widget buildListTile(String text, IconData icon, BuildContext context, StatelessWidget page){
  return ListTile(
    contentPadding: const EdgeInsets.all(10),
    leading: Icon(
      icon,
      color: Colors.white,
      size: 50,
    ),
    title: Text(text,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
    ),
    onTap: () {
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => page)
      );
    },
  );
}
