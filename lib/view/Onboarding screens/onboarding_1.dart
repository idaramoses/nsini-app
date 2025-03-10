// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:sharkhub/utils/themes.dart';
//
// import '../../config/common.dart';
// import '../../Dark mode.dart';
// import '../../res/common/app_methods.dart';
//
// import 'Get started.dart';
//
// class Onboard1 extends StatefulWidget {
//   const Onboard1({super.key});
//
//   @override
//   State<Onboard1> createState() => _Onboard1State();
// }
//
// class _Onboard1State extends State<Onboard1> {
//   ColorNotifire notifier = ColorNotifire();
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//       backgroundColor:Themes.getScaffoldColor(context),
//         body: PageView(
//           children: [
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Expanded(
//                   child: Container(
//                     alignment: Alignment.center,
//                     height: MediaQuery.of(context).size.height /2.8,
//                     width: double.infinity,
//                     color:Themes.getScaffoldColor(context),
//                     child: Image.asset("assets/images/Card 1.png",scale: 0.9),
//                   ),
//                 ),
//                 // Switch(
//                 //   value: notifier.isDark,
//                 //   onChanged: (bool value) {
//                 //     notifier.isavalable(value);
//                 //   },
//                 // ),
//                 AppConstants.Height(15),
//                 Padding(
//                   padding:  EdgeInsets.only(left: 20.h,right: 20.h,bottom: 20.h),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                        Text(
//                         "Welcome to Our Trading Platform",
//                         style: TextStyle(
//                             fontSize: 24.sp,
//                             // wordSpacing: 5,
//
//                             color: Themes.getTextColor(context)),
//                       ),
//                       CommonMethods.sizedBox(height: 20.h),
//                        Text(
//                         "Access a wide range of features designed to help you succeed in the stock market",
//                         style: TextStyle(
//                             fontSize: 16.sp,
//                             color: Color(0xff64748B),
//                             fontFamily: "Manrope-Medium"),
//                       ),
//                       CommonMethods.sizedBox(height: 20.h),
//                       GestureDetector(
//                         onTap: () {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => const SignUpPage(),
//                               ));
//                         },
//                         child: Container(
//                           height: 60,
//                           // width: 350,
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(25),
//                               color:Themes.getPrimaryColor(context)),
//                           child: const Center(
//                             child: Text(
//                               "Get Started",
//                               style: TextStyle(
//                                   fontSize: 16,
//                                   fontFamily: "Manrope-SemiBold",
//                                   color: Colors.white),
//                             ),
//                           ),
//                         ),
//                       ),
//                       CommonMethods.sizedBox(height: 20.h),
//                       Center(
//                         child: GestureDetector(
//                           onTap: () {
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => const LogInPage()));
//                           },
//                           child:  SizedBox(
//                             height: 40.h,
//                             width: double.infinity,
//                             child:  Center(
//                               child: Text("Login",
//                                   style: TextStyle(
//                                       color:Themes.getPrimaryColor(context),
//                                       fontSize: 16,
//                                       )),
//                             ),
//                           ),
//                         ),
//                       ),
//                       // AppConstants.Height(30),
//                     ],
//                   ),
//                 ),
//
//               ],
//             ),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Expanded(
//                   child: Container(
//                     alignment: Alignment.center,
//                       height: MediaQuery.of(context).size.height /2.8,
//                     width: double.infinity,
//                     color: Themes.getScaffoldColor(context),
//                     child: Image.asset("assets/images/Card 2.png",scale:0.9,)
//                   ),
//                 ),
//                 AppConstants.Height(15),
//                 Padding(
//                   padding:  EdgeInsets.only(left: 20.h,right: 20.h,bottom: 20.h),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         "Learn from Experts",
//                         style: TextStyle(
//                             fontSize: 24.sp,
//                             // wordSpacing: 5,
//
//                             color: Themes.getTextColor(context)),
//                       ),
//                       CommonMethods.sizedBox(height: 20.h),
//                       Text(
//                         "Gain valuable insights from experienced traders and industry experts",
//                         style: TextStyle(
//                             fontSize: 16.sp,
//                             color: Color(0xff64748B),
//                             fontFamily: "Manrope-Medium"),
//                       ),
//                       CommonMethods.sizedBox(height: 20.h),
//                       GestureDetector(
//                         onTap: () {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => const SignUpPage(),
//                               ));
//                         },
//                         child: Container(
//                           height: 60,
//                           // width: 350,
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(25),
//                               color:Themes.getPrimaryColor(context)),
//                           child: const Center(
//                             child: Text(
//                               "Get Started",
//                               style: TextStyle(
//                                   fontSize: 16,
//                                   fontFamily: "Manrope-SemiBold",
//                                   color: Colors.white),
//                             ),
//                           ),
//                         ),
//                       ),
//                       CommonMethods.sizedBox(height: 20.h),
//                       Center(
//                         child: GestureDetector(
//                           onTap: () {
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => const LogInPage()));
//                           },
//                           child:  SizedBox(
//                             height: 40.h,
//                             width: double.infinity,
//                             child:  Center(
//                               child: Text("Login",
//                                   style: TextStyle(
//                                       color:Themes.getPrimaryColor(context),
//                                       fontSize: 16,
//                                       )),
//                             ),
//                           ),
//                         ),
//                       ),
//                       // AppConstants.Height(30),
//                     ],
//                   ),
//                 ),
//                 // AppConstants.Height(30),
//
//               ],
//             ),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Expanded(
//                   child: Container(
//                     height: MediaQuery.of(context).size.height /2.8,
//                     alignment: Alignment.center,
//                     width: double.infinity,
//                     color: Themes.getScaffoldColor(context),
//                      child: Image.asset("assets/images/Card 3.png",scale: 0.9),
//                   ),
//                 ),
//                 AppConstants.Height(15),
//                 Padding(
//                   padding:  EdgeInsets.only(left: 20.h,right: 20.h,bottom: 20.h),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         "Manage Your Portfolio",
//                         style: TextStyle(
//                             fontSize: 24.sp,
//                             // wordSpacing: 5,
//
//                             color: Themes.getTextColor(context)),
//                       ),
//                       CommonMethods.sizedBox(height: 20.h),
//                       Text(
//                         "Track your investments and monitor portfolio performance with ease.",
//                         style: TextStyle(
//                             fontSize: 16.sp,
//                             color: Color(0xff64748B),
//                             fontFamily: "Manrope-Medium"),
//                       ),
//                       CommonMethods.sizedBox(height: 20.h),
//                       GestureDetector(
//                         onTap: () {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => const SignUpPage(),
//                               ));
//                         },
//                         child: Container(
//                           height: 60,
//                           // width: 350,
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(25),
//                               color:Themes.getPrimaryColor(context)),
//                           child: const Center(
//                             child: Text(
//                               "Get Started",
//                               style: TextStyle(
//                                   fontSize: 16,
//                                   fontFamily: "Manrope-SemiBold",
//                                   color: Colors.white),
//                             ),
//                           ),
//                         ),
//                       ),
//                       CommonMethods.sizedBox(height: 20.h),
//                       Center(
//                         child: GestureDetector(
//                           onTap: () {
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => const LogInPage()));
//                           },
//                           child:  SizedBox(
//                             height: 40.h,
//                             width: double.infinity,
//                             child:  Center(
//                               child: Text("Login",
//                                   style: TextStyle(
//                                       color:Themes.getPrimaryColor(context),
//                                       fontSize: 16,
//                                       )),
//                             ),
//                           ),
//                         ),
//                       ),
//                       // AppConstants.Height(30),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//
//           ],
//         ));
//   }
// }
