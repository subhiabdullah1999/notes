import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/provider/theme_provider.dart';
import 'package:flutter_sixvalley_ecommerce/utill/color_resources.dart';
import 'package:flutter_sixvalley_ecommerce/utill/custom_themes.dart';
import 'package:provider/provider.dart';

class CustomButton extends StatelessWidget {
  final Function onTap;
  final String buttonText;
  CustomButton({this.onTap, @required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(padding: EdgeInsets.all(0)),
      child: Container(
        height: 40,
        width: 170,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: ColorResources.getChatIcon(context),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 7,
                  offset: Offset(0, 1)), // changes position of shadow
            ],
            gradient:
                (Provider.of<ThemeProvider>(context).darkTheme || onTap == null)
                    ? null
                    : LinearGradient(colors: [
                        Colors.cyan,
                        Colors.cyan,
                        Colors.cyan,
                      ]),
            borderRadius: BorderRadius.circular(10)),
        child: Text(buttonText,
            style: titilliumSemiBold.copyWith(
              fontSize: 16,
              color: Theme.of(context).highlightColor,
            )),
      ),
    );
  }
}

class CustomButtonSigIn extends StatelessWidget {
  final Function onTap;
  final String buttonText;
  CustomButtonSigIn({
    this.onTap,
    @required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        padding: EdgeInsets.all(0),
      ),
      child: Container(
        height: 40,
        width: 170,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: ColorResources.getChatIcon(context),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 7,
                  offset: Offset(0, 1)), // changes position of shadow
            ],
            gradient:
                (Provider.of<ThemeProvider>(context).darkTheme || onTap == null)
                    ? null
                    : LinearGradient(colors: [
                        Colors.white,
                        Colors.white,
                        Colors.white,
                      ]),
            borderRadius: BorderRadius.circular(10)),
        child: Text(buttonText,
            style: titilliumSemiBold.copyWith(
              fontSize: 16,
              color: Colors.black,
            )),
      ),
    );
  }
}
