import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sharkhub/view/home/model/categoires_model.dart';
import 'package:sharkhub/view/home/model/popular_model.dart';
import 'package:sharkhub/view/home/model/transactions_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/service_api.dart';
import '../../../main.dart';
import '../model/offer_model.dart';

class SuperbaseServices {
  Future<List<Map<String, dynamic>>> fetchTableData(String tableName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String id = '${prefs.getString('id')}';
    final userModel = await SuperbaseService().getUserDataFromLocalStorage();
    final response =
        await supabase.from(tableName).select().eq('user_id', id).execute();
    print('${prefs.getString('token')}');
    print('${prefs.getString('id')}');
    // Check if the data is a List<dynamic>
    if (response.data is List<dynamic>) {
      // Cast the List<dynamic> to List<Map<String, dynamic>>
      return (response.data as List<dynamic>)
          .cast<Map<String, dynamic>>()
          .toList();
    } else {
      // Handle the case where the data is not in the expected format
      throw Exception("Unexpected data format from Superbase");
    }
  }

  Future<List<Map<String, dynamic>>> fetchMeterData(String tableName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String id = '${prefs.getString('id')}';
    final userModel = await SuperbaseService().getUserDataFromLocalStorage();
    final response =
        await supabase.from(tableName).select().eq('user_id', id).execute();

    // Check if the data is a List<dynamic>
    if (response.data is List<dynamic>) {
      // Cast the List<dynamic> to List<Map<String, dynamic>>
      return (response.data as List<dynamic>)
          .cast<Map<String, dynamic>>()
          .toList();
    } else {
      // Handle the case where the data is not in the expected format
      throw Exception("Unexpected data format from Superbase");
    }
  }

  Future<List<Map<String, dynamic>>> fetchTableDetails(
      String tableName, int id) async {
    final response =
        await supabase.from(tableName).select().eq('id', 1).limit(1);

    // Check if the data is a List<dynamic>
    if (response.data is List<dynamic>) {
      // Cast the List<dynamic> to List<Map<String, dynamic>>
      return (response.data as List<dynamic>)
          .cast<Map<String, dynamic>>()
          .toList();
    } else {
      // Handle the case where the data is not in the expected format
      throw Exception("Unexpected data format from Superbase");
    }
  }
}

class HomeController extends GetxController {



@override
void onClose() {
  super.onClose();
  print("Controller closed");
  // Add your logic when the widget is removed from the widget tree
}
  final SuperbaseServices _superbaseService = SuperbaseServices();

  RxList<Map<String, dynamic>> tableData = <Map<String, dynamic>>[].obs;
  var meterData = <Map<String, dynamic>>[].obs;
  final transaction = [].obs;
  final recenttransaction = [].obs;
  final meters = [].obs;


  RxBool isLoading = true.obs;
  RxBool isVerifed = false.obs;

  var accountBalance = <dynamic>[].obs;

@override
  void onInit() {
    super.onInit();
    // fetchMeterData('meters');
    // fetchTableData('transactions');
    // fetchData();
    // fetchVerification();
  }




  List<String> daysOfWeek = [
    'assets/svg/aedc.jpg',
    'assets/svg/eedc.png',
    'assets/svg/ekedc.png',
    'assets/svg/ibedc.png',
    'assets/svg/ikeja.png',
    'assets/svg/jedc.jpg',
  ];

  RxList<TransactionModel> transdetail = [
    TransactionModel(
      price: '1000',
      title: 'Ngolo Kante',
      des: '1200456445',
      image: 'assets/svg/aedc.jpg',
    ),
    TransactionModel(
      price: '2500',
      title: 'Messi Tunde',
      des: '9257625345',
      image: 'assets/svg/eedc.png',
    ),
    TransactionModel(
      price: '3000',
      title: 'Ibrahim Ronaldo',
      des: '8735728484',
      image: 'assets/svg/ibedc.png',
    ),
    TransactionModel(
      price: '12000',
      title: 'Mbappe Chibike',
      des: '934764563',
      image: 'assets/svg/aedc.jpg',
    ),
    TransactionModel(
      price: '5000',
      title: 'Chiwel Mike',
      des: '9273645473',
      image: 'assets/svg/ekedc.png',
    ),
  ].obs;
  CarouselController? carouselController = CarouselController();
  PageController pageController = PageController();
  RxInt i = 0.obs;

}
