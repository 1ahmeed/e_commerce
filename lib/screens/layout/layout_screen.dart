import 'package:e_commerce/core/constant.dart';
import 'package:e_commerce/screens/layout/cubit/layout_cubit.dart';
import 'package:e_commerce/screens/layout/cubit/layout_state.dart';
import 'package:e_commerce/screens/order/order_screen.dart';
import 'package:e_commerce/screens/profile/cahnge_password_screen.dart';
import 'package:e_commerce/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:iconly/iconly.dart';

import '../contact_us/contact_us_screen.dart';
import '../profile/profile_screen.dart';

class LayoutScreen extends StatelessWidget {
   LayoutScreen({Key? key}) : super(key: key);
  final _advancedDrawerController = AdvancedDrawerController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = LayoutCubit.get(context);
        return AdvancedDrawer(
          backdropColor: HexColor('#21618C'),
          controller: _advancedDrawerController,
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 300),
          animateChildDecoration: true,
          rtlOpening: false,
          // openScale: 1.0,
          disabledGestures: false,
          childDecoration: const BoxDecoration(

            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          drawer: SafeArea(
            child: ListTileTheme(
              textColor: Colors.white,
              iconColor: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Spacer(),

                     SvgPicture.asset(
                       "images/logo.svg",height: 100,
                       width: 70,color: Colors.white,),

                    const Spacer(),

                    ListTile(
                      onTap: () {
                        ///profile screen
                        Navigator.push(context, MaterialPageRoute(builder:
                            (context) => ProfileScreen(),) );
                      },
                      leading: const Icon(
                        Icons.person,
                      ),
                      title: const Text(
                        'Profile',
                        style:  TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    ///change password
                    ListTile(
                      onTap: () {
                        ///change password
                        Navigator.push(context,MaterialPageRoute(builder:
                            (context) => ChangePasswordScreen(),) );
                      },
                      leading: const Icon(
                        Icons.lock,
                      ),
                      title:const  Text(
                        'Change password',
                        style:  TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    ///Order
                    ListTile(
                      onTap: () {
                        Navigator.push(context,MaterialPageRoute(builder:
                            (context) => OrderScreen(),) );
                      },
                      leading: const Icon(
                        Icons.checklist_rtl_rounded,
                      ),
                      title:const  Text(
                        'My Orders',
                        style:  TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    //const SizedBox(height: 16),

                    ///Help

                    ListTile(
                      onTap: () {
                        Navigator.push(context,MaterialPageRoute(builder:
                            (context) => ContactUs(),) );
                      },
                      leading: const Icon(
                        IconlyBold.user_3,
                      ),
                      title: const Text(
                        'Help',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                     const SizedBox(height: 16),
                    ///تسجيل خروج من الايميل
                    ListTile(
                      onTap: () {
                        signOut(context);
                      },
                      leading: const Icon(
                        Icons.logout,
                      ),
                      title: const Text(
                        ' Log Out ',
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ),
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: SvgPicture.asset("images/logo.svg",
                height: 40,width: 40,color: mainColor,),
              leading: IconButton(
                onPressed:(){
                  _advancedDrawerController.showDrawer();
                },
                icon: ValueListenableBuilder<AdvancedDrawerValue>(
                  valueListenable: _advancedDrawerController,
                  builder: (_, value, __) {
                    return AnimatedSwitcher(
                      duration: const Duration(milliseconds: 250),
                      child: Icon(
                        value.visible
                            ? IconlyBroken.close_square
                            : IconlyBroken.more_square,
                        color: Colors.black,
                        key: ValueKey<bool>(value.visible),
                      ),
                    );
                  },
                ),
              ),
            ),
            body:cubit?.screens![cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(

              selectedItemColor: mainColor,
              unselectedItemColor: Colors.grey,
              // backgroundColor:mainColor,
              type: BottomNavigationBarType.fixed,
              currentIndex: cubit!.currentIndex,
              onTap: (index) {
                cubit.changeCurrentIndex(index);
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                  ),
                  label: 'home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.category,
                  ),
                  label: 'Category',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.favorite,
                  ),
                  label: 'Favourites',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.shopping_cart,
                  ),
                  label: 'Cart',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
