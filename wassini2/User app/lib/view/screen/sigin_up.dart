import 'package:flutter/material.dart';

import 'package:flutter_sixvalley_ecommerce/localization/language_constrants.dart';
import 'package:flutter_sixvalley_ecommerce/provider/auth_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/profile_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/theme_provider.dart';
import 'package:flutter_sixvalley_ecommerce/utill/color_resources.dart';
import 'package:flutter_sixvalley_ecommerce/utill/custom_themes.dart';
import 'package:flutter_sixvalley_ecommerce/utill/dimensions.dart';
import 'package:flutter_sixvalley_ecommerce/utill/images.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/auth/widget/sign_in_widget.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/auth/widget/sign_up_widget.dart';
import 'package:provider/provider.dart';

import 'auth/widget/social_login_widget.dart';

class SignUp extends StatelessWidget {
  final int initialPage;
  SignUp({this.initialPage = 0});

  @override
  Widget build(BuildContext context) {
    Provider.of<ProfileProvider>(context, listen: false)
        .initAddressTypeList(context);
    Provider.of<AuthProvider>(context, listen: false).isRemember;
    PageController _pageController = PageController(initialPage: initialPage);

    return Scaffold(
      backgroundColor: Colors.grey[350],
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          // background
          Provider.of<ThemeProvider>(context).darkTheme
              ? SizedBox()
              : Positioned(
                  top: MediaQuery.of(context).size.height * 0.009,
                  left: MediaQuery.of(context).size.width * 0.2,
                  child: Image.asset("assets/images/w_four.png",
                      fit: BoxFit.fill,
                      height: MediaQuery.of(context).size.height * 0.2,
                      width: MediaQuery.of(context).size.width),
                ),

          Consumer<AuthProvider>(
            builder: (context, auth, child) => SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 30),

                  // for logo with text
                  // Image.asset(Images.splash_logo, height: 150, width: 200),

                  // for decision making section like signin or register section
                  Padding(
                    padding: EdgeInsets.all(Dimensions.MARGIN_SIZE_LARGE),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Positioned(
                          bottom: 0,
                          right: Dimensions.MARGIN_SIZE_EXTRA_SMALL,
                          left: 0,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.only(
                                right: Dimensions.FONT_SIZE_LARGE),
                            height: 1,
                            color: ColorResources.getGainsBoro(context),
                          ),
                        ),
                        // Container(
                        //   decoration: BoxDecoration(
                        //       color: Colors.white,
                        //       borderRadius:
                        //           BorderRadius.all(Radius.circular(30))),
                        //   height: MediaQuery.of(context).size.height * 0.065,
                        //   width: MediaQuery.of(context).size.width * 0.8,
                        //   child: MaterialButton(
                        //       onPressed: () {},
                        //       height: 10,
                        //       minWidth: MediaQuery.of(context).size.width * 0.7,
                        //       child: Row(
                        //         crossAxisAlignment: CrossAxisAlignment.center,
                        //         mainAxisAlignment: MainAxisAlignment.center,
                        //         children: [
                        //           Image.asset(
                        //             "assets/images/email.png",
                        //           ),
                        //           Padding(
                        //             padding:
                        //                 EdgeInsets.only(left: 40, right: 30),
                        //             child: Text(
                        //               "login with email ",
                        //               style: TextStyle(
                        //                   color: Colors.black26, fontSize: 20),
                        //             ),
                        //           )
                        //         ],
                        //       )),
                        // ),

                        Padding(
                          padding: const EdgeInsets.only(top: 50),
                          child: Text(
                            "Welcome!!",
                            style: TextStyle(
                                color: Colors.blue[200],
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                        // Consumer<AuthProvider>(
                        //   builder: (context, authProvider, child) => Row(
                        //     children: [
                        //       InkWell(
                        //         onTap: () => _pageController.animateToPage(0,
                        //             duration: Duration(seconds: 1),
                        //             curve: Curves.easeInOut),
                        //         child: Column(
                        //           children: [
                        //             Text(getTranslated('SIGN_IN', context),
                        //                 style: authProvider.selectedIndex == 0
                        //                     ? titilliumSemiBold
                        //                     : titilliumRegular),
                        //             Container(
                        //               height: 1,
                        //               width: 40,
                        //               margin: EdgeInsets.only(top: 8),
                        //               color: authProvider.selectedIndex == 0
                        //                   ? Theme.of(context).primaryColor
                        //                   : Colors.transparent,
                        //             ),
                        //           ],
                        //         ),
                        //       ),
                        // SizedBox(width: 25),
                        // InkWell(
                        //   onTap: () => _pageController.animateToPage(1,
                        //       duration: Duration(seconds: 1),
                        //       curve: Curves.easeInOut),
                        //   child: Column(
                        //     children: [
                        //       Text(getTranslated('SIGN_UP', context),
                        //           style: authProvider.selectedIndex == 1
                        //               ? titilliumSemiBold
                        //               : titilliumRegular),
                        //       Container(
                        //           height: 1,
                        //           width: 50,
                        //           margin: EdgeInsets.only(top: 8),
                        //           color: authProvider.selectedIndex == 1
                        //               ? Theme.of(context).primaryColor
                        //               : Colors.transparent),
                        //     ],
                        //   ),
                        // ),
                        //     ],
                        //   ),
                        // ),
                      ],
                    ),
                  ),

                  // // show login or register widget
                  Expanded(
                    child: SignUpWidget(),
                    // child: Consumer<AuthProvider>(
                    //   builder: (context, authProvider, child) =>
                    //       PageView.builder(
                    //     itemCount: 1,
                    //     controller: _pageController,
                    //     itemBuilder: (context, index) {
                    //       if (authProvider.selectedIndex == 0) {
                    //         return SignInWidget();
                    //       }
                    //       // else {
                    //       return SignUpWidget();
                    //       // }
                    //     },
                    //     onPageChanged: (index) {
                    //       authProvider.updateSelectedIndex(index);
                    //     },
                    //   ),
                    // ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
