import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/body/login_model.dart';
import 'package:flutter_sixvalley_ecommerce/localization/language_constrants.dart';
import 'package:flutter_sixvalley_ecommerce/provider/auth_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/cart_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/profile_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/splash_provider.dart';
import 'package:flutter_sixvalley_ecommerce/utill/color_resources.dart';
import 'package:flutter_sixvalley_ecommerce/utill/custom_themes.dart';
import 'package:flutter_sixvalley_ecommerce/utill/dimensions.dart';
import 'package:flutter_sixvalley_ecommerce/view/basewidget/button/custom_button.dart';
import 'package:flutter_sixvalley_ecommerce/view/basewidget/textfield/custom_password_textfield.dart';
import 'package:flutter_sixvalley_ecommerce/view/basewidget/textfield/custom_textfield.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/auth/forget_password_screen.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/auth/widget/mobile_verify_screen.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/auth/widget/social_login_widget.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/dashboard/dashboard_screen.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/sigin_up.dart';
import 'package:provider/provider.dart';

import 'otp_verification_screen.dart';

class SignInWidget extends StatefulWidget {
  @override
  _SignInWidgetState createState() => _SignInWidgetState();
}

class _SignInWidgetState extends State<SignInWidget> {
  TextEditingController _emailController;
  TextEditingController _passwordController;
  GlobalKey<FormState> _formKeyLogin;

  @override
  void initState() {
    super.initState();
    _formKeyLogin = GlobalKey<FormState>();

    _emailController = TextEditingController();
    _passwordController = TextEditingController();

    _emailController.text =
        Provider.of<AuthProvider>(context, listen: false).getUserEmail() ??
            null;
    _passwordController.text =
        Provider.of<AuthProvider>(context, listen: false).getUserPassword() ??
            null;
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  FocusNode _emailNode = FocusNode();
  FocusNode _passNode = FocusNode();
  LoginModel loginBody = LoginModel();

  void loginUser() async {
    if (_formKeyLogin.currentState.validate()) {
      _formKeyLogin.currentState.save();

      String _email = _emailController.text.trim();
      String _password = _passwordController.text.trim();

      if (_email.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(getTranslated('EMAIL_MUST_BE_REQUIRED', context)),
          backgroundColor: Colors.red,
        ));
      } else if (_password.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(getTranslated('PASSWORD_MUST_BE_REQUIRED', context)),
          backgroundColor: Colors.red,
        ));
      } else {
        if (Provider.of<AuthProvider>(context, listen: false).isRemember) {
          Provider.of<AuthProvider>(context, listen: false)
              .saveUserEmail(_email, _password);
        } else {
          Provider.of<AuthProvider>(context, listen: false)
              .clearUserEmailAndPassword();
        }

        loginBody.email = _email;
        loginBody.password = _password;
        await Provider.of<AuthProvider>(context, listen: false)
            .login(loginBody, route);
      }
    }
  }

  route(bool isRoute, String token, String temporaryToken,
      String errorMessage) async {
    if (isRoute) {
      if (token == null || token.isEmpty) {
        if (Provider.of<SplashProvider>(context, listen: false)
            .configModel
            .emailVerification) {
          Provider.of<AuthProvider>(context, listen: false)
              .checkEmail(_emailController.text.toString(), temporaryToken)
              .then((value) async {
            if (value.isSuccess) {
              Provider.of<AuthProvider>(context, listen: false)
                  .updateEmail(_emailController.text.toString());
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (_) => VerificationScreen(temporaryToken, '',
                          _emailController.text.toString())),
                  (route) => false);
            }
          });
        } else if (Provider.of<SplashProvider>(context, listen: false)
            .configModel
            .phoneVerification) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (_) => MobileVerificationScreen(temporaryToken)),
              (route) => false);
        }
      } else {
        await Provider.of<ProfileProvider>(context, listen: false)
            .getUserInfo(context);
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => DashBoardScreen()),
            (route) => false);
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(errorMessage), backgroundColor: Colors.red));
    }
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<AuthProvider>(context, listen: false).isRemember;

    return Form(
      child: ListView(
        padding: EdgeInsets.symmetric(vertical: Dimensions.PADDING_SIZE_SMALL),
        children: [
          // for Email
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 40, right: 40),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: getTranslated(
                      'ENTER_YOUR_EMAIL',
                      context,
                    ),
                  ),

                  focusNode: _emailNode,
                  keyboardType: TextInputType.emailAddress,
                  //  nextNode: _passNode,

                  controller: _emailController,
                ),
                SizedBox(
                  height: 20,
                ),

                // for Password
                TextFormField(
                  decoration: InputDecoration(
                    labelText: getTranslated('ENTER_YOUR_PASSWORD', context),
                  ),
                  textInputAction: TextInputAction.done,
                  focusNode: _passNode,
                  controller: _passwordController,
                ),
              ],
            ),
          ),

          // for remember and forgetpassword
          Container(
            margin: EdgeInsets.only(
                left: Dimensions.MARGIN_SIZE_SMALL,
                right: Dimensions.MARGIN_SIZE_SMALL),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Consumer<AuthProvider>(
                      builder: (context, authProvider, child) => Checkbox(
                        checkColor: ColorResources.WHITE,
                        activeColor: Theme.of(context).primaryColor,
                        value: authProvider.isRemember,
                        onChanged: authProvider.updateRemember,
                      ),
                    ),
                    //

                    Text(getTranslated('REMEMBER', context),
                        style: titilliumRegular),
                  ],
                ),
                InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => ForgetPasswordScreen())),
                  child: Text(getTranslated('FORGET_PASSWORD', context),
                      style: titilliumRegular.copyWith(
                          color: ColorResources.getLightSkyBlue(context))),
                ),
              ],
            ),
          ),

          // for signin button
          Container(
            margin: EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 30),
            child: Provider.of<AuthProvider>(context).isLoading
                ? Center(
                    child: CircularProgressIndicator(
                      valueColor: new AlwaysStoppedAnimation<Color>(
                        Theme.of(context).primaryColor,
                      ),
                    ),
                  )
                : Row(
                    children: [
                      CustomButton(
                          onTap: loginUser,
                          buttonText: getTranslated('LOGIN', context)),
                      SizedBox(
                        width: 10,
                      ),
                      CustomButtonSigIn(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return SignUp();
                          }));
                        },
                        buttonText: getTranslated('SIGN_UP', context),
                      ),
                    ],
                  ),
          ),

          SizedBox(
            width: 25,
            height: 15,
          ),

          SocialLoginWidget(),

          SizedBox(height: 20),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Already have account?',
                      style: TextStyle(color: Colors.black54, fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    width: 60,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      getTranslated('SIGN_IN', context),
                      style: TextStyle(color: Colors.black54, fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
          )
          // Center(
          //     child: Text(getTranslated('OR', context),
          //         style: titilliumRegular.copyWith(fontSize: 12))),

          //for order as guest
          // GestureDetector(
          //   onTap: () {
          //     if (!Provider.of<AuthProvider>(context, listen: false)
          //         .isLoading) {
          //       Provider.of<CartProvider>(context, listen: false).getCartData();
          //       Navigator.pushAndRemoveUntil(
          //           context,
          //           MaterialPageRoute(builder: (_) => DashBoardScreen()),
          //           (route) => false);
          //     }
          //   },
          //   child: Container(
          //     margin: EdgeInsets.only(left: 50, right: 50, top: 30),
          //     width: double.infinity,
          //     height: 40,
          //     alignment: Alignment.center,
          //     decoration: BoxDecoration(
          //       color: Colors.transparent,
          //       borderRadius: BorderRadius.circular(6),
          //       border: Border.all(
          //           color: ColorResources.getHint(context), width: 1.0),
          //     ),
          //     child: Text(getTranslated('CONTINUE_AS_GUEST', context),
          //         style: titilliumSemiBold.copyWith(
          //             color: ColorResources.getPrimary(context))),
          //   ),
          // ),
        ],
      ),
    );
    //   Consumer<GoogleSignInProvider>(builder: (ctx,model,child){
    //   if(model.googleAccount != null){
    //     return googleLoggedInUI(model);
    //   }else{
    //     return loginControls(context);
    //   }

    // });
  }
}
