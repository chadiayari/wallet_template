// import 'package:abu_dhabi_community_cooperative/screens/sign_screens/payement_screen.dart';
// import 'package:abu_dhabi_community_cooperative/widgets/bank_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:hexcolor/hexcolor.dart';
// import '../../constants.dart' as constants;

// class ChooseBank extends StatefulWidget {
//   const ChooseBank({Key? key}) : super(key: key);

//   @override
//   _ChooseBank createState() => _ChooseBank();
// }

// class _ChooseBank extends State<ChooseBank> with WidgetsBindingObserver {
//   final TextEditingController sharesController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//         extendBodyBehindAppBar: false,
//         appBar: AppBar(
//           centerTitle: false,
//           leading: IconButton(
//             icon: Icon(
//               Icons.arrow_back_outlined,
//               color: HexColor(constants.primaryColor),
//             ),
//             onPressed: () {
//               Navigator.pop(context);
//             },
//           ),
//           backgroundColor: Colors.transparent,
//           elevation: 0.0,
//         ),
//         body: Container(
//           decoration: const BoxDecoration(color: Colors.white),
//           child: ListView(
//             children: [
//               Column(
//                 children: [
//                   Text(
//                     "Choose your bank",
//                     style: Theme.of(context).textTheme.headline5!.copyWith(
//                         color: HexColor(constants.primaryColor),
//                         fontWeight: FontWeight.normal),
//                   ),
//                   SizedBox(height: size.width * 0.03),
//                   BankWidget(
//                       ontap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (_) => const PayementScreen()));
//                       },
//                       color: "#E97D75",
//                       logo: '1.png'),
//                   BankWidget(
//                       ontap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (_) => const PayementScreen()));
//                       },
//                       color: "#95D3F4",
//                       logo: '2.png'),
//                   BankWidget(
//                       ontap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (_) => const PayementScreen()));
//                       },
//                       color: "#ED832D",
//                       logo: '3.png'),
//                   BankWidget(
//                       ontap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (_) => const PayementScreen()));
//                       },
//                       color: "#EBFEFE",
//                       logo: '4.png'),
//                   BankWidget(
//                       ontap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (_) => const PayementScreen()));
//                       },
//                       color: "#FEDEBC",
//                       logo: '5.png'),
//                   BankWidget(
//                       ontap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (_) => const PayementScreen()));
//                       },
//                       color: "#40B4C6",
//                       logo: '6.png'),
//                   BankWidget(
//                       ontap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (_) => const PayementScreen()));
//                       },
//                       color: "#FBFF8D",
//                       logo: '7.png'),
//                   BankWidget(
//                       ontap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (_) => const PayementScreen()));
//                       },
//                       color: "#B5EF98",
//                       logo: '8.png'),
//                   BankWidget(
//                       ontap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (_) => const PayementScreen()));
//                       },
//                       color: "#E5D0EE",
//                       logo: '9.png'),
//                   BankWidget(
//                       ontap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (_) => const PayementScreen()));
//                       },
//                       color: "#F699BD",
//                       logo: '10.png'),
//                   BankWidget(
//                       ontap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (_) => const PayementScreen()));
//                       },
//                       color: "#62AAF1",
//                       logo: '11.png'),
//                   BankWidget(
//                       ontap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (_) => const PayementScreen()));
//                       },
//                       color: "#F3CB9F",
//                       logo: '12.png'),
//                   BankWidget(
//                       ontap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (_) => const PayementScreen()));
//                       },
//                       color: "#FED96C",
//                       logo: '13.png'),
//                   BankWidget(
//                       ontap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (_) => const PayementScreen()));
//                       },
//                       color: "#001A53",
//                       logo: '14.png'),
//                   BankWidget(
//                       ontap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (_) => const PayementScreen()));
//                       },
//                       color: "#000000",
//                       logo: '15.png'),
//                   BankWidget(
//                       ontap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (_) => const PayementScreen()));
//                       },
//                       color: "#C9F6FB",
//                       logo: '16.png'),
//                   BankWidget(
//                       ontap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (_) => const PayementScreen()));
//                       },
//                       color: "#FFB7B7",
//                       logo: '17.png'),
//                   BankWidget(
//                       ontap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (_) => const PayementScreen()));
//                       },
//                       color: "#FFFFFF",
//                       logo: '18.png'),
//                   BankWidget(
//                       ontap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (_) => const PayementScreen()));
//                       },
//                       color: "#8FCDF6",
//                       logo: '19.png'),
//                   BankWidget(
//                       ontap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (_) => const PayementScreen()));
//                       },
//                       color: "#FFDA81",
//                       logo: '20.png'),
//                   BankWidget(
//                       ontap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (_) => const PayementScreen()));
//                       },
//                       color: "#95B7DE",
//                       logo: '21.png'),
//                 ],
//               ),
//             ],
//           ),
//         ));
//   }
// }
