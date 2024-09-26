import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'my_drawer_tile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  // logout/signout method
  void signOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 2,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  //logo
                  DrawerHeader(
                    margin: const EdgeInsets.only(bottom: 25),
                    child: Icon(
                      Icons.chat_bubble_outline_rounded,
                      size: 70,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                  //home list tile
                  MyDrawerTile(
                      text: "Home",
                      iconData: Icons.home_filled,
                      onTap: () => Navigator.pop(context)),

                  //settings tile
                  MyDrawerTile(
                      text: "Profile",
                      iconData: Icons.person_2_rounded,
                      onTap: () {
                        //pop the drawer
                        Navigator.pop(context);
                        // then go to profile page
                        Navigator.pushNamed(context, "/profile_page");
                      }),
                  //users tile
                  MyDrawerTile(
                      text: "Users",
                      iconData: Icons.group,
                      onTap: () {
                        //pop the drawer
                        Navigator.pop(context);
                        // then go to users page
                        Navigator.pushNamed(context, "/users_page");
                      })
                ],
              ),
              // logout tile
              Padding(
                padding: const EdgeInsets.only(left: 5, bottom: 30),
                child: MyDrawerTile(
                    text: "Log out",
                    iconData: Icons.logout_rounded,
                    onTap: signOut),
              )
            ]));
  }
}
