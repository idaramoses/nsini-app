import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';


import '../../view/Onboarding screens/onboarding_1.dart';
import '../../view/Onboarding screens/splash_screen.dart';



class RoutesPath {
  static const initialRoutes = "/";

  static const splashPage = "/SplashPage";
  static const loginPage = "/LogInPage";
  static const pinValidatePage = "/pinValidatePage";
  static const homePage = "/HomePage";
  static const onBoardingPage = "/OnBoardingPage";
  static const signupPage = "/SignUpPage";
  static const forgotPassPage = "/ForgotPasswordPage";
  static const verificationPage = "/VerificationPage";
  static const resetPasswordPage = "/ResetPasswordPage";
  static const passSuccessPage = "/PassSuccessPage";
  static const bottomBarPage = "/BottomBarPage";
  static const finishbottomBarPage = "/FinishBottomBarPage";
  static const categoriesPage = "/CategoriesPage";
  static const popularTransactionPage = "/PopularTransactionPage";
  static const transactionDetailPage = "/TransactionDetailPage";
  static const transactionPage = "/TransactionPage";
  static const termsAndConditionPage = "/TermsAndConditionPage";
  static const myCardsPage = "/MyCardsPage";
  static const rechargePage = "/RechargePage";
  static const packageDetailPage = "/PackageDetailPage";
  static const paymentPage = "/PaymentPage";
  static const paymentSuccessPage = "/PaymentSuccessPage";
  static const electricityBillPage = "/ElectricityBillPage";
  static const rebuyelectricityBillPage = "/RebuyElectricityBillPage";
  static const maharashtraElectricityPage = "/MaharashtraElectricityPage";
  static const movieTicketBookingPage = "/MovieTicketBookingPage";
  static const movieDetailPage = "/MovieDetailPage";
  static const selectSeatPage = "/SelectSeatPage";
  static const paymentDetailPage = "/PaymentDetailPage";
  static const recieptPage = "/RecieptPage";
  static const bookingSuccessPage = "/BookingSuccessPage";
  static const helpPage = "/HelpPage";
  static const logoutPage = "/LogoutPage";
  static const searchFlightPage = "/SearchFlightPage";
  static const flightDetailPage = "/FlightDetailPage";
  static const flightSelectSeatPage = "/FlightSelectSeatPage";
  static const flightPaymentDetail = "/FlightPaymentDetail";
  static const flightBookingDetailPage = "/FlightBookingDetailPage";
  static const myProfilePage = "/MyProfilePage";
  static const editProfilePage = "/EditProfilePage";
  static const addNewCardPage = "/AddNewCardPage";
  static const flightTicketPage = "/FlightTicketPage";
  static const demoPage = "/DemoPage";
  static const verifyEmail = "/verifyEmail";
  static const transactionsmainpage = "/transactions";
  static const Validate = "/Validate";
  static const updateProfilePage = '/updateProfilePage';
  static const paymentTransactionDetailPage = '/paymentTransactionDetailPage';
  static const AddMeterPage = '/AddMeterPage';

  static Map<String, WidgetBuilder> routes = {
    RoutesPath.splashPage: (context) => const SplashPage(),
  };

  static routesFactory(settings) {
    switch (settings.name) {
      case RoutesPath.splashPage:
        return getPage(const SplashPage(), settings);

      default:
        return null;
    }
  }

  static getPage(var child, var settings) {
    var type = PageTransitionType.rightToLeftWithFade;

    return PageTransition(
      child: child,
      type: type,
      duration: Durations.medium4,
      settings: settings,
    );
  }
}
