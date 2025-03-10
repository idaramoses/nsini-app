import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sharkhub/view/home/model/categoires_model.dart';
import 'package:sharkhub/view/home/model/popular_model.dart';
import 'package:sharkhub/view/home/model/transactions_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/service_api.dart';
import '../../../main.dart';


class NotificationController extends GetxController {



  @override
  void onClose() {
    super.onClose();
    print("Controller closed");
    // Add your logic when the widget is removed from the widget tree
  }

  RxList<Map<String, dynamic>> tableData = <Map<String, dynamic>>[].obs;
  var meterData = <Map<String, dynamic>>[].obs;
  final transaction = [].obs;
  final recenttransaction = [].obs;
  final meters = [].obs;


  RxBool isLoading = true.obs;

  var accountBalance = <dynamic>[].obs;

  @override
  void onInit() {
    super.onInit();
    // fetchMeterData('meters');
    fetchBalanceData();
    fetchData();

  }

  Future<void> fetchData() async {
    try {
      isLoading(true);
      // Get the currently authenticated user
      // User? currentUser = supabase.auth.currentUser;
      // if (currentUser == null) {
      //   // No authenticated user, handle appropriately
      //   return;
      // }
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String id = '${prefs.getString('id')}';
      // Query the user table for data associated with the authenticated user
      final response = await supabase
          .from('notification')
          .select()
          .eq('userId', id)
          .order('created_at', ascending: false)
          .execute();
      // Update user data
      transaction.assignAll(response.data);
      isLoading(false);
    } catch (e) {
      // Handle errors
      print('Error fetching user data: $e');
      isLoading(false);
    }
  }
  Future<void> fetchBalanceData() async {
    try {
      isLoading(true);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String id = '${prefs.getString('id')}';
      // Query the user table for data associated with the authenticated user
      final response = await supabase
          .from('account_balance')
          .select()
          .eq('user_id', id)
          .execute();
      // Update user data
      accountBalance.assignAll(response.data);
      isLoading(false);
    } catch (e) {
      // Handle errors
      print('Error fetching user data: $e');
      isLoading(false);
    }
  }



  CarouselController? carouselController = CarouselController();
  PageController pageController = PageController();
  RxInt i = 0.obs;


}
