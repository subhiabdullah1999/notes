import 'package:flutter/material.dart';
import 'package:sixvalley_vendor_app/data/model/response/base/api_response.dart';
import 'package:sixvalley_vendor_app/data/model/response/product_model.dart';
import 'package:sixvalley_vendor_app/data/repository/product_repo.dart';
import 'package:sixvalley_vendor_app/helper/api_checker.dart';

class ProductProvider extends ChangeNotifier {
  final ProductRepo productRepo;
  ProductProvider({@required this.productRepo});

  bool _isLoading = false;
  bool _firstLoading = true;
  List<int> _offsetList = [];
  int _offset = 1;

  bool get isLoading => _isLoading;
  bool get firstLoading => _firstLoading;
  int get offset => _offset;



  // Seller products
  List<Product> _sellerProductList = [];
  int _sellerPageSize;
  List<Product> get sellerProductList => _sellerProductList;
  int get sellerPageSize => _sellerPageSize;

  void initSellerProductList(String sellerId, int offset, BuildContext context, String languageCode, {bool reload = false}) async {
    if(reload || offset == 1) {
      _offset = 1;
          _offsetList = [];
          _sellerProductList = [];
        }
    if(!_offsetList.contains(offset)){
      _offsetList.add(offset);
      ApiResponse apiResponse = await productRepo.getSellerProductList(sellerId, offset,languageCode);
      if (apiResponse.response != null && apiResponse.response.statusCode == 200) {
        _sellerProductList.addAll(ProductModel.fromJson(apiResponse.response.data).products);
        _sellerPageSize = ProductModel.fromJson(apiResponse.response.data).totalSize;
        _firstLoading = false;
        _isLoading = false;
      } else {
        ApiChecker.checkApi(context, apiResponse);
      }
      notifyListeners();

    }else{
      if(_isLoading) {
        _isLoading = false;
      }

    }

  }

  void setOffset(int offset) {
    _offset = offset;
  }


  void showBottomLoader() {
    _isLoading = true;
    notifyListeners();
  }

  void removeFirstLoading() {
    _firstLoading = true;
    notifyListeners();
  }
  Future<int> getLatestOffset(String sellerId, String languageCode) async {
    ApiResponse apiResponse = await productRepo.getSellerProductList(sellerId, 1,languageCode);
    return ProductModel.fromJson(apiResponse.response.data).totalSize;
  }


  void clearSellerData() {
    _sellerProductList = [];
    notifyListeners();
  }




}
