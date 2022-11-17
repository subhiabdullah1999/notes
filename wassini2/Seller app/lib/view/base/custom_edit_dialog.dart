import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sixvalley_vendor_app/helper/price_converter.dart';
import 'package:sixvalley_vendor_app/localization/language_constrants.dart';
import 'package:sixvalley_vendor_app/provider/bank_info_provider.dart';
import 'package:sixvalley_vendor_app/provider/profile_provider.dart';
import 'package:sixvalley_vendor_app/provider/splash_provider.dart';
import 'package:sixvalley_vendor_app/utill/color_resources.dart';
import 'package:sixvalley_vendor_app/utill/dimensions.dart';
import 'package:sixvalley_vendor_app/utill/images.dart';
import 'package:sixvalley_vendor_app/utill/styles.dart';

import 'no_data_screen.dart';



class CustomEditDialog extends StatefulWidget {
  _CustomEditDialogState createState() => _CustomEditDialogState();
}

class _CustomEditDialogState extends State<CustomEditDialog> {

  final TextEditingController _balanceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Provider.of<BankInfoProvider>(context, listen: false).getBankInfo(context);
    return Scaffold(
      backgroundColor: ColorResources.getBottomSheetColor(context),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            top: 70,
            // bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.fromBorderSide(BorderSide(width: 2,color: ColorResources.COLOR_LIGHT_BLACK)),
                  color: ColorResources.getBottomSheetColor(context),
                  borderRadius: BorderRadius.only(
                      topLeft:  Radius.circular(25),
                      topRight: Radius.circular(25)),
                ),
                height: 400,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Container(
                  height: 400,
                  decoration: BoxDecoration(
                    color: ColorResources.getBottomSheetColor(context),
                    borderRadius: BorderRadius.only(
                        topLeft:  Radius.circular(25),
                        topRight: Radius.circular(25)),
                  ),
                  child: Consumer<BankInfoProvider>(
                    builder: (context, bankProvider, child) => bankProvider.bankInfo != null ? Container(

                      width: double.infinity,
                      // margin: EdgeInsets.only(left: 15, right: 15, bottom: 15, top: 10),
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      // decoration: BoxDecoration(
                      //   borderRadius: BorderRadius.circular(12),
                      //   boxShadow: [BoxShadow(color: Colors.grey[Provider.of<ThemeProvider>(context).darkTheme ? 800 : 200], spreadRadius: 0.5, blurRadius: 0.3)],
                      // ),

                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.keyboard_arrow_down),
                          SizedBox(height: 5,),
                          Text(getTranslated('withdraw', context), style: TextStyle(fontSize: Dimensions.FONT_SIZE_LARGE, fontWeight: FontWeight.w500),),

                          SizedBox(height: 5,),
                          Container(width: 35, height: 35,
                              child: Image.asset(Images.bank)),
                          SizedBox(height: 5,),
                          Text(
                            '${bankProvider.bankInfo.bankName ?? getTranslated('no_data_found', context)}',
                            style: robotoTitleRegular.copyWith(color: ColorResources.getTextColor(context), fontSize: Dimensions.FONT_SIZE_LARGE),
                            maxLines: 1, overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 5,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(getTranslated('branch', context), style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFFA9A9A9))),
                              Text(
                                '${bankProvider.bankInfo.branch ?? getTranslated('no_data_found', context)}',
                                style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFFA9A9A9)),
                                textAlign: TextAlign.center, maxLines: 1, overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),

                          SizedBox(height: 5,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(getTranslated('account_number', context), style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xFFA9A9A9) )),
                              Text(
                                '${bankProvider.bankInfo.accountNo ?? getTranslated('no_data_found', context)}',
                                style: robotoTitleRegular.copyWith(color: ColorResources.getTextColor(context), fontSize: Dimensions.FONT_SIZE_DEFAULT),
                                textAlign: TextAlign.center, maxLines: 1, overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),

                          SizedBox(height: 20,),
                          Text(getTranslated('enter_Amount', context), style: TextStyle(fontWeight: FontWeight.w500,fontSize: Dimensions.FONT_SIZE_DEFAULT),),

                          Center(
                            child: Padding(
                              padding: EdgeInsets.only(left: Dimensions.FONT_SIZE_DEFAULT),
                              child: TextField(
                                controller: _balanceController,
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.zero,
                                  border: InputBorder.none,
                                  hintText: '\$ 75.55',
                                ),
                              ),
                            ),
                          ),
                          Image.asset(Images.input_line),

                          SizedBox(height: 35,),

                          !Provider.of<ProfileProvider>(context).isLoading?
                          InkWell(
                            onTap: () {
                              _updateUserAccount();
                            },
                            child: Card(
                              color: Theme.of(context).primaryColor,
                              child: Container(
                                height: 40,
                                child: Center(
                                  child: TextButton(
                                    onPressed: (){
                                      _updateUserAccount();
                                    },
                                      child: Text(getTranslated('withdraw', context),style: TextStyle(fontSize: Dimensions.FONT_SIZE_LARGE,fontWeight: FontWeight.w500,color: Colors.white))),
                                ),
                              ),
                            ),
                          ): Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor))),






                        ],
                      ),
                    ): NoDataScreen(),


                  ),

                ),
              ),
            ],
          ),
        ),
      ),
    );
      
    //   AlertDialog(
    //   backgroundColor: ColorResources.getBottomSheetColor(context),
    //   title: Column(crossAxisAlignment: CrossAxisAlignment.start,
    //     mainAxisAlignment: MainAxisAlignment.start,
    //     children: [
    //       Text(getTranslated('withdraw_request', context),
    //         style: titilliumSemiBold.copyWith(
    //             fontSize: Dimensions.FONT_SIZE_LARGE,
    //             color: ColorResources.getTextColor(context)),),
    //
    //       SizedBox(height: Dimensions.PADDING_SIZE_SMALL,),
    //       Text('${getTranslated('amount', context)} :',
    //           style: titilliumBold.copyWith(
    //               fontSize: Dimensions.FONT_SIZE_DEFAULT,
    //               color: ColorResources.getHintColor(context)))
    //     ],
    //   ),
    //   content: Column(
    //     mainAxisSize: MainAxisSize.min,
    //     children: [
    //       Form(
    //         key: _formKey,
    //         child: TextFormField(
    //           controller: _balanceController,
    //             keyboardType: TextInputType.number,
    //             decoration: InputDecoration(
    //               contentPadding: EdgeInsets.symmetric(
    //                   horizontal: Dimensions.FONT_SIZE_DEFAULT),
    //               border: OutlineInputBorder(),
    //             ),
    //         ),
    //       ),
    //
    //       SizedBox(height: 10),
    //
    //       !Provider.of<ProfileProvider>(context).isLoading
    //           ? Row( mainAxisAlignment: MainAxisAlignment.end,
    //           children: [
    //         Container(
    //           decoration: BoxDecoration(
    //               borderRadius: BorderRadius.circular(8),
    //               color: ColorResources.COLOR_LIGHT_BLACK
    //           ),
    //           child: TextButton(
    //             onPressed: () {
    //               Navigator.pop(context);
    //             },
    //             child: Text(getTranslated('close', context),
    //               style: titilliumBold.copyWith(color: ColorResources.WHITE),),
    //           ),
    //         ),
    //         SizedBox(width: 10),
    //         Container(
    //           decoration: BoxDecoration(
    //               borderRadius: BorderRadius.circular(8),
    //               color: Theme.of(context).primaryColor
    //           ),
    //           child: TextButton(
    //               onPressed: () {
    //                 _updateUserAccount();
    //               },
    //               child: Text(getTranslated('request', context), style: titilliumBold.copyWith(color: ColorResources.WHITE))
    //           ),
    //         ),
    //
    //       ]) : Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor)))
    //     ],
    //   ),
    // );
  }

  void _updateUserAccount() async {
    String _balance = _balanceController.text.trim();
    double _bal = 0;
    if(_balance.isNotEmpty) {
      _bal = PriceConverter.systemCurrencyToDefaultCurrency(double.parse(_balance), context);
    }

    if (_balance.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text(getTranslated('enter_balance', context)),
        backgroundColor: Colors.red,
      ));
    }else if(_bal < 2) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('${getTranslated('enter_minimum_amount', context)} '
            '${2 * Provider.of<SplashProvider>(context, listen: false).myCurrency.exchangeRate}'),
        backgroundColor: Colors.red,
      ));
    }else {
      await Provider.of<ProfileProvider>(context, listen: false).updateBalance(_bal.toString()).then((response) {
        if(response.isSuccess) {
          Provider.of<ProfileProvider>(context, listen: false).getSellerInfo(context);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(response.message), backgroundColor: Colors.green));
          Navigator.pop(context);
        }else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(response.message), backgroundColor: Colors.red));
        }
      });
    }
  }
}
