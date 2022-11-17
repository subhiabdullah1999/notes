import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/data/datasource/remote/dio/dio_client.dart';
import 'package:flutter_sixvalley_ecommerce/data/datasource/remote/exception/api_error_handler.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/response/base/api_response.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/response/onboarding_model.dart';
import 'package:flutter_sixvalley_ecommerce/localization/language_constrants.dart';
import 'package:flutter_sixvalley_ecommerce/utill/app_constants.dart';

class OnBoardingRepo {
  final DioClient dioClient;
  OnBoardingRepo({@required this.dioClient});

  Future<ApiResponse> getOnBoardingList(BuildContext context) async {
    try {
      List<OnboardingModel> onBoardingList = [
        OnboardingModel(
          'assets/images/splash_one.png',
          '${getTranslated('stay_home', context)} ',
          getTranslated('and_shopping', context),
        ),
        OnboardingModel(
          'assets/images/splash_towe.png',
          getTranslated('on_boarding_title_two', context),
          getTranslated('on_boarding_description_two', context),
        ),
      ];

      Response response = Response(
          requestOptions: RequestOptions(path: ''),
          data: onBoardingList,
          statusCode: 200);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
