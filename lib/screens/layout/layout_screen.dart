import 'package:e_commerce/core/constant.dart';
import 'package:e_commerce/screens/order/order_screen.dart';
import 'package:e_commerce/screens/profile/cahnge_password_screen.dart';
import 'package:e_commerce/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:iconly/iconly.dart';

import '../../cubit/layout_cubit/layout_cubit.dart';
import '../../cubit/layout_cubit/layout_state.dart';
import '../../localization/generated/l10n.dart';
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
          backdropColor:LayoutCubit.get(context)!.isDark?HexColor('#21618C'):AppColor.mainColor,
          controller: _advancedDrawerController,
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 300),
          animateChildDecoration: true,
          rtlOpening: false,
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

                     Directionality(
                       textDirection: TextDirection.ltr,
                       child: SvgPicture.asset(
                         "images/logo.svg",height: 100,
                         width: 70,
                         colorFilter: const ColorFilter.mode(AppColor.white, BlendMode.srcIn),
                         ),
                     ),
                    const Spacer(),

                    ///profile screen
                    ListTile(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder:
                            (context) => ProfileScreen(),) );
                      },
                      leading: const Icon(
                        Icons.person,
                      ),
                      title:  Text(
                        S.of(context).profile,
                        style:  const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    ///localization
                    ListTile(
                      onTap: () {
                        LayoutCubit.get(context)!.changeLang();
                         },
                      leading: const Icon(
                        Icons.language,
                      ),
                      title:  Text(
                       S.of(context).language,
                        style:  const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    ///dark mode
                    ListTile(
                      onTap: () {
                        LayoutCubit.get(context)!.changeMode();
                      },
                      leading:  Icon(
                        LayoutCubit.get(context)!.isDark?Icons.dark_mode:Icons.light_mode,
                      ),
                      title:  Text(
                        LayoutCubit.get(context)!.isDark? S.of(context).dark:S.of(context).light,
                        style:  const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    ///change password
                    ListTile(
                      onTap: () {
                        Navigator.push(context,MaterialPageRoute(builder:
                            (context) => ChangePasswordScreen(),) );
                      },
                      leading: const Icon(
                        Icons.lock,
                      ),
                      title:  Text(
                        S.of(context).changePassword,
                        style:  const TextStyle(
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
                      title:  Text(
                        S.of(context).myOrders,
                        style:  const TextStyle(
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
                      title:  Text(
                        S.of(context).help,
                        style: const TextStyle(
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
                      title:  Text(
                        S.of(context).logOut,
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
              title: Directionality(
                textDirection: TextDirection.ltr,
                child: SvgPicture.asset("images/logo.svg",
                  height: 40,width: 40,
                  colorFilter: ColorFilter.mode(
                      LayoutCubit.get(context)!.isDark?AppColor.mainColor:AppColor.white,
                      BlendMode.srcIn),


                ),
              ),
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
                        color: LayoutCubit.get(context)!.isDark?AppColor.black:AppColor.white,
                        key: ValueKey<bool>(value.visible),
                      ),
                    );
                  },
                ),
              ),
            ),
            body:cubit?.screens![cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
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
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.category,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.favorite,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.shopping_cart,
                  ),
                  label: '',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
