





// import 'package:flutter/material.dart';
// import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';

// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Flutter Subscription Plans"),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             showSubscriptionSheet(context);
//           },
//           child: Text("Show Subscription Plans"),
//         ),
//       ),
//     );
//   }

//   void showSubscriptionSheet(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(
//           top: Radius.circular(20),
//         ),
//       ),
//       builder: (context) => FractionallySizedBox(
//         heightFactor: 0.95,  
//         child: SubscriptionSheet(),
//       ),
//     );
//   }
// }

// class SubscriptionSheet extends StatefulWidget {
//   @override
//   _SubscriptionSheetState createState() => _SubscriptionSheetState();
// }

// class _SubscriptionSheetState extends State<SubscriptionSheet> {
//   String selectedPlan = 'Gold'; // Default selected plan

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 3),
//               child: Text(
//                 "Features Comparison",
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//             ),
//             IconButton(
//               icon: Icon(Icons.close, color: Colors.black),
//               onPressed: () {
//                 Navigator.pop(context); 
//               },
//             ),
//           ],
//         ),
//         Divider(),
//         Padding(
//           padding: const EdgeInsets.only(left: 15, top: 10),
//           child: Container(
//             height: 55,
//             width: 330,
//             decoration: BoxDecoration(
//               color: Colors.red.shade100,
//               borderRadius: BorderRadius.circular(10),
//             ),
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text(
//                 "℗ Your current subscription does not include this feature. Please upgrade your plan.",
//                 style: TextStyle(color: Colors.red),
//               ),
//             ),
//           ),
//         ),
//         GestureDetector(
//           onTap: () {
//             showChangeBottomSheet(context); // Show modal bottom sheet when "Change" is tapped
//           },
//           child: Padding(
//             padding: const EdgeInsets.only(left: 15, top: 10),
//             child: Container(
//               height: 55,
//               width: 330,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text("1 Year", style: TextStyle()),
//                     Text("Mobile", style: TextStyle()),
//                     Text("Change ⌄", style: TextStyle(color: Colors.blue)),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//         SizedBox(height: 10),
//         Expanded(
//           child: ListView(
//             children: [
//               PlanComparisonRow("Sync data across devices", "✓", "✓", "✓"),
//               PlanComparisonRow("Create multiple companies", "2", "3", "Unlimited"),
//               PlanComparisonRow("Remove advertisement on invoices", "✗", "✓", "✓"),
//               PlanComparisonRow("Manage godowns & transfer stock", "✗", "✗", "✓"),
//               PlanComparisonRow("Set multiple pricing for items", "✗", "✓", "✓"),
//               PlanComparisonRow("Restore deleted transactions", "✗", "✗", "Unlimited"),
//               PlanComparisonRow("Set credit limit for parties", "✗", "✓", "✓"),
//               PlanComparisonRow("Add Fixed Assets", "✗", "✓", "✓"),
//             ],
//           ),
//         ),
//         SizedBox(height: 10),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             GestureDetector(
//               onTap: () {
//                 setState(() {
//                   selectedPlan = 'Silver';
//                 });
//               },
//               child: PlanOption(
//                 planName: "Silver Plan",
//                 price: "₹ 699 ₹ 1,099",
//                 isSelected: selectedPlan == 'Silver',
//                 gradientColors: [Colors.white, Colors.grey.shade300, ],
//               ),
//             ),
//             SizedBox(width: 10),
//             GestureDetector(
//               onTap: () {
//                 setState(() {
//                   selectedPlan = 'Gold';
//                 });
//               },
//               child: PlanOption(
//                 planName: "Gold Plan",
//                 price: "₹ 799 ₹ 1,399",
//                 isSelected: selectedPlan == 'Gold',
//                 gradientColors:  [Colors.white,Colors.amber ],
//               ),
//             ),
//           ],
//         ),
//         SizedBox(height: 10),
//         Center(
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: SizedBox(
//               width: 320,
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.red,
//                 ),
//                 onPressed: () {
//                   print("Buying $selectedPlan");
//                 },
//                 child: Text(
//                   selectedPlan == 'Gold' ? "Buy Gold" : "Buy Silver",
//                   style: TextStyle(fontSize: 16, color: Colors.white),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   void showChangeBottomSheet(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//       ),
//       builder: (context) => FractionallySizedBox(
//         heightFactor: 0.5, 
//         child: Center(
//           child: Text("Change Options", style: TextStyle(fontSize: 24)),
//         ),
//       ),
//     );
//   }
// }

// class PlanOption extends StatelessWidget {
//   final String planName;
//   final String price;
//   final bool isSelected;
//   final List<Color> gradientColors;

//   PlanOption({
//     required this.planName,
//     required this.price,
//     required this.isSelected,
//     required this.gradientColors,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 150,
//       padding: EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           colors: gradientColors,
//         ),
//         borderRadius: BorderRadius.circular(8),
//         border: Border.all(color: isSelected ? Colors.blue : Colors.grey),
//       ),
//       child: Stack(
//         clipBehavior: Clip.none,
//         children: [
//           Column(
//             children: [
//               Row(
//                 children: [
//                   Icon(FontAwesomeIcons.crown, color: Colors.amber, size: 20),
//                   SizedBox(width: 10),
//                   Text(planName),
//                 ],
//               ),
//               SizedBox(height: 5),
//               Text(
//                 price,
//                 style: TextStyle(
//                   decoration: TextDecoration.lineThrough,
//                 ),
//               ),
//             ],
//           ),
//           if (isSelected)
//             Positioned(
              
              
//               top: -20,
//               right: -23,
//               child: Icon(Icons.check_circle, color: Colors.blue, size: 20,),
//             ),
//         ],
//       ),
//     );
//   }
// }

// class PlanComparisonRow extends StatelessWidget {
//   final String feature;
//   final String free;
//   final String silver;
//   final String gold;

//   PlanComparisonRow(this.feature, this.free, this.silver, this.gold);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(10),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Container(
//             width: 190,
//             child: Text(
//               feature,
//               style: TextStyle(fontSize: 13),
//             ),
//           ),
//           _buildFeatureIcon(free),
//           SizedBox(width: 20),
//           _buildFeatureIcon(silver),
//           SizedBox(width: 20),
//           _buildFeatureIcon(gold),
//         ],
//       ),
//     );
//   }

//   Widget _buildFeatureIcon(String value) {
//     if (value == "✓") {
//       return Icon(Icons.check, color: Colors.green);
//     } else if (value == "✗") {
//       return Icon(Icons.close, color: Colors.red);
//     } else {
//       return Text(value);
//     }
//   }
// }









// import 'package:flutter/material.dart';
// import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
// import 'package:xianinfotech_llp_gaurav/utils/widgets/PlanComparisonRow_widget.dart';

// class HomePage extends StatefulWidget {
//   final bool autoShowBottomSheet;

//   // The constructor takes a flag to indicate if the bottom sheet should open automatically.
//   HomePage({this.autoShowBottomSheet = false});

//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   @override
//   void initState() {
//     super.initState();

//     // If autoShowBottomSheet is true, show the bottom sheet automatically when the page loads.
//     if (widget.autoShowBottomSheet) {
//       WidgetsBinding.instance.addPostFrameCallback((_) {
//         showSubscriptionSheet(context);
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Flutter Subscription Plans"),
//       ),
//       body: Center(
//         child: widget.autoShowBottomSheet
//             ? Container() // Don't show the button if autoShowBottomSheet is true
//             : ElevatedButton(
//                 onPressed: () {
//                   showSubscriptionSheet(context);
//                 },
//                 child: Text("Show Subscription Plans"),
//               ),
//       ),
//     );
//   }

//   void showSubscriptionSheet(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(
//           top: Radius.circular(20),
//         ),
//       ),
//       builder: (context) => FractionallySizedBox(
//         heightFactor: 0.95,
//         child: SubscriptionSheet(),
//       ),
//     ).whenComplete(() {
//       // When the bottom sheet is closed, navigate back to the previous page if autoShowBottomSheet is true
//       if (widget.autoShowBottomSheet) {
//         Navigator.pop(context);
//       }
//     });
//   }
// }

// class SubscriptionSheet extends StatefulWidget {
//   @override
//   _SubscriptionSheetState createState() => _SubscriptionSheetState();
// }

// class _SubscriptionSheetState extends State<SubscriptionSheet> {
//   String selectedPlan = 'Gold'; // Default selected plan

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 3),
//               child: Text(
//                 "Features Comparison",
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//             ),
//             IconButton(
//               icon: Icon(Icons.close, color: Colors.black),
//               onPressed: () {
//                 Navigator.pop(context); // Close the bottom sheet
//               },
//             ),
//           ],
//         ),
//         Divider(),
//         Padding(
//           padding: const EdgeInsets.only(left: 15, top: 10),
//           child: Container(
//             height: 55,
//             width: 330,
//             decoration: BoxDecoration(
//               color: Colors.red.shade100,
//               borderRadius: BorderRadius.circular(10),
//             ),
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text(
//                 "℗ Your current subscription does not include this feature. Please upgrade your plan.",
//                 style: TextStyle(color: Colors.red),
//               ),
//             ),
//           ),
//         ),
//         GestureDetector(
//           onTap: () {
//             showChangeBottomSheet(context); // Show modal bottom sheet when "Change" is tapped
//           },
//           child: Padding(
//             padding: const EdgeInsets.only(left: 15, top: 10),
//             child: Container(
//               height: 55,
//               width: 330,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text("1 Year", style: TextStyle()),
//                     Text("Mobile", style: TextStyle()),
//                     Text("Change ⌄", style: TextStyle(color: Colors.blue)),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//         SizedBox(height: 10),
//         Expanded(
//           child: ListView(
//             children: [
//               PlanComparisonRow("Sync data across devices", "✓", "✓", "✓"),
//               PlanComparisonRow("Create multiple companies", "2", "3", "Unlimited"),
//               PlanComparisonRow("Remove advertisement on invoices", "✗", "✓", "✓"),
//               PlanComparisonRow("Manage godowns & transfer stock", "✗", "✗", "✓"),
//               PlanComparisonRow("Set multiple pricing for items", "✗", "✓", "✓"),
//               PlanComparisonRow("Restore deleted transactions", "✗", "✗", "Unlimited"),
//               PlanComparisonRow("Set credit limit for parties", "✗", "✓", "✓"),
//               PlanComparisonRow("Add Fixed Assets", "✗", "✓", "✓"),
//             ],
//           ),
//         ),
//         SizedBox(height: 10),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             GestureDetector(
//               onTap: () {
//                 setState(() {
//                   selectedPlan = 'Silver';
//                 });
//               },
//               child: PlanOption(
//                 planName: "Silver Plan",
//                 price: "₹ 699 ₹ 1,099",
//                 isSelected: selectedPlan == 'Silver',
//                 gradientColors: [Colors.white, Colors.grey.shade300],
//               ),
//             ),
//             SizedBox(width: 10),
//             GestureDetector(
//               onTap: () {
//                 setState(() {
//                   selectedPlan = 'Gold';
//                 });
//               },
//               child: PlanOption(
//                 planName: "Gold Plan",
//                 price: "₹ 799 ₹ 1,399",
//                 isSelected: selectedPlan == 'Gold',
//                 gradientColors: [Colors.white, Colors.amber],
//               ),
//             ),
//           ],
//         ),
//         SizedBox(height: 10),
//         Center(
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: SizedBox(
//               width: 320,
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.red,
//                 ),
//                 onPressed: () {
//                   print("Buying $selectedPlan");
//                 },
//                 child: Text(
//                   selectedPlan == 'Gold' ? "Buy Gold" : "Buy Silver",
//                   style: TextStyle(fontSize: 16, color: Colors.white),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   void showChangeBottomSheet(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//       ),
//       builder: (context) => FractionallySizedBox(
//         heightFactor: 0.5,
//         child: Center(
//           child: Text("Change Options", style: TextStyle(fontSize: 24)),
//         ),
//       ),
//     );
//   }
// }

// class PlanOption extends StatelessWidget {
//   final String planName;
//   final String price;
//   final bool isSelected;
//   final List<Color> gradientColors;

//   PlanOption({
//     required this.planName,
//     required this.price,
//     required this.isSelected,
//     required this.gradientColors,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 150,
//       padding: EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           colors: gradientColors,
//         ),
//         borderRadius: BorderRadius.circular(8),
//         border: Border.all(color: isSelected ? Colors.blue : Colors.grey),
//       ),
//       child: Stack(
//         clipBehavior: Clip.none,
//         children: [
//           Column(
//             children: [
//               Row(
//                 children: [
//                   Icon(FontAwesomeIcons.crown, color: Colors.amber, size: 20),
//                   SizedBox(width: 10),
//                   Text(planName),
//                 ],
//               ),
//               SizedBox(height: 5),
//               Text(
//                 price,
//                 style: TextStyle(
//                   decoration: TextDecoration.lineThrough,
//                 ),
//               ),
//             ],
//           ),
//           if (isSelected)
//             Positioned(
//               top: -20,
//               right: -23,
//               child: Icon(Icons.check_circle, color: Colors.blue, size: 20),
//             ),
//         ],
//       ),
//     );
//   }
// }












// import 'package:flutter/material.dart';
// import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
// import 'package:xianinfotech_llp_gaurav/utils/widgets/PlanComparisonRow_widget.dart';

// class HomePage extends StatefulWidget {
//   final bool autoShowBottomSheet;

//   // Constructor to control auto-showing the bottom sheet.
//   HomePage({this.autoShowBottomSheet = false});

//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   @override
//   void initState() {
//     super.initState();

//     // Automatically show the bottom sheet if flag is set to true.
//     if (widget.autoShowBottomSheet) {
//       WidgetsBinding.instance.addPostFrameCallback((_) {
//         showSubscriptionSheet(context);
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Flutter Subscription Plans"),
//       ),
//       body: Center(
//         // Don't show the button if the bottom sheet auto shows.
//         child: widget.autoShowBottomSheet
//             ? Container()
//             : ElevatedButton(
//                 onPressed: () {
//                   showSubscriptionSheet(context);
//                 },
//                 child: Text("Show Subscription Plans"),
//               ),
//       ),
//     );
//   }

//   // Show the bottom sheet and handle automatic navigation when it's dismissed.
//   void showSubscriptionSheet(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(
//           top: Radius.circular(20),
//         ),
//       ),
//       builder: (context) => FractionallySizedBox(
//         heightFactor: 0.95,
//         child: SubscriptionSheet(
//           onClose: () {
//             // Close the HomePage when the bottom sheet is closed.
//             Navigator.pop(context);
//           },
//         ),
//       ),
//     ).whenComplete(() {
//       // Navigate back from the HomePage when the sheet is dismissed.
//       if (widget.autoShowBottomSheet) {
//         Navigator.pop(context);
//       }
//     });
//   }
// }



// class SubscriptionSheet extends StatefulWidget {
//   final VoidCallback onClose; // This callback will be triggered when the bottom sheet is closed.

//   SubscriptionSheet({required this.onClose});

//   @override
//   _SubscriptionSheetState createState() => _SubscriptionSheetState();
// }

// class _SubscriptionSheetState extends State<SubscriptionSheet> {
//   String selectedPlan = 'Gold'; // Default selected plan.

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 3),
//               child: Text(
//                 "Features Comparison",
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//             ),
//             IconButton(
//               icon: Icon(Icons.close, color: Colors.black),
//               onPressed: () {
//                 Navigator.pop(context); // Close the bottom sheet
//                 widget.onClose(); // Trigger the onClose callback
//               },
//             ),
//           ],
//         ),
//         Divider(),
//         Padding(
//           padding: const EdgeInsets.only(left: 15, top: 10),
//           child: Container(
//             height: 55,
//             width: 330,
//             decoration: BoxDecoration(
//               color: Colors.red.shade100,
//               borderRadius: BorderRadius.circular(10),
//             ),
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text(
//                 "℗ Your current subscription does not include this feature. Please upgrade your plan.",
//                 style: TextStyle(color: Colors.red),
//               ),
//             ),
//           ),
//         ),
//         GestureDetector(
//           onTap: () {
//             showChangeBottomSheet(context); // Show modal bottom sheet when "Change" is tapped
//           },
//           child: Padding(
//             padding: const EdgeInsets.only(left: 15, top: 10),
//             child: Container(
//               height: 55,
//               width: 330,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text("1 Year", style: TextStyle()),
//                     Text("Mobile", style: TextStyle()),
//                     Text("Change ⌄", style: TextStyle(color: Colors.blue)),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//         SizedBox(height: 10),
//         Expanded(
//           child: ListView(
//             children: [
//               PlanComparisonRow("Sync data across devices", "✓", "✓", "✓"),
//               PlanComparisonRow("Create multiple companies", "2", "3", "Unlimited"),
//               PlanComparisonRow("Remove advertisement on invoices", "✗", "✓", "✓"),
//               PlanComparisonRow("Manage godowns & transfer stock", "✗", "✗", "✓"),
//               PlanComparisonRow("Set multiple pricing for items", "✗", "✓", "✓"),
//               PlanComparisonRow("Restore deleted transactions", "✗", "✗", "Unlimited"),
//               PlanComparisonRow("Set credit limit for parties", "✗", "✓", "✓"),
//               PlanComparisonRow("Add Fixed Assets", "✗", "✓", "✓"),
//             ],
//           ),
//         ),
//         SizedBox(height: 10),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             GestureDetector(
//               onTap: () {
//                 setState(() {
//                   selectedPlan = 'Silver';
//                 });
//               },
//               child: PlanOption(
//                 planName: "Silver Plan",
//                 price: "₹ 699 ₹ 1,099",
//                 isSelected: selectedPlan == 'Silver',
//                 gradientColors: [Colors.white, Colors.grey.shade300],
//               ),
//             ),
//             SizedBox(width: 10),
//             GestureDetector(
//               onTap: () {
//                 setState(() {
//                   selectedPlan = 'Gold';
//                 });
//               },
//               child: PlanOption(
//                 planName: "Gold Plan",
//                 price: "₹ 799 ₹ 1,399",
//                 isSelected: selectedPlan == 'Gold',
//                 gradientColors: [Colors.white, Colors.amber],
//               ),
//             ),
//           ],
//         ),
//         SizedBox(height: 10),
//         Center(
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: SizedBox(
//               width: 320,
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.red,
//                 ),
//                 onPressed: () {
//                   print("Buying $selectedPlan");
//                 },
//                 child: Text(
//                   selectedPlan == 'Gold' ? "Buy Gold" : "Buy Silver",
//                   style: TextStyle(fontSize: 16, color: Colors.white),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   void showChangeBottomSheet(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//       ),
//       builder: (context) => FractionallySizedBox(
//         heightFactor: 0.5,
//         child: Center(
//           child: Text("Change Options", style: TextStyle(fontSize: 24)),
//         ),
//       ),
//     );
//   }
// }

// class PlanOption extends StatelessWidget {
//   final String planName;
//   final String price;
//   final bool isSelected;
//   final List<Color> gradientColors;

//   PlanOption({
//     required this.planName,
//     required this.price,
//     required this.isSelected,
//     required this.gradientColors,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 150,
//       padding: EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           colors: gradientColors,
//         ),
//         borderRadius: BorderRadius.circular(8),
//         border: Border.all(color: isSelected ? Colors.blue : Colors.grey),
//       ),
//       child: Stack(
//         clipBehavior: Clip.none,
//         children: [
//           Column(
//             children: [
//               Row(
//                 children: [
//                   Icon(FontAwesomeIcons.crown, color: Colors.amber, size: 20),
//                   SizedBox(width: 10),
//                   Text(planName),
//                 ],
//               ),
//               SizedBox(height: 5),
//               Text(
//                 price,
//                 style: TextStyle(
//                   decoration: TextDecoration.lineThrough,
//                 ),
//               ),
//             ],
//           ),
//           if (isSelected)
//             Positioned(
//               top: -20,
//               right: -23,
//               child: Icon(Icons.check_circle, color: Colors.blue, size: 20),
//             ),
//         ],
//       ),
//     );
//   }
// }





import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:xianinfotech_llp_gaurav/features/screens/Reports/views/report_screen.dart';
import 'package:xianinfotech_llp_gaurav/utils/widgets/PlanComparisonRow_widget.dart';

class HomePage extends StatefulWidget {
  final bool autoShowBottomSheet;

  // Constructor to control auto-showing the bottom sheet.
  HomePage({this.autoShowBottomSheet = false});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    // Automatically show the bottom sheet if the flag is set to true.
    if (widget.autoShowBottomSheet) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showSubscriptionSheet(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Subscription Plans"),
      ),
      body: Center(
        // Don't show the button if the bottom sheet auto shows.
        child: widget.autoShowBottomSheet
            ? Container()
            : ElevatedButton(
                onPressed: () {
                  showSubscriptionSheet(context);
                },
                child: Text("Show Subscription Plans"),
              ),
      ),
    );
  }


  void showSubscriptionSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      builder: (context) => FractionallySizedBox(
        heightFactor: 0.95,
        child: SubscriptionSheet(
          onClose: () {
            Navigator.of(context).pop(); 
          },
        ),
      ),
    ).then((_) {

      Navigator.pop(context);
    });
  }
}

class SubscriptionSheet extends StatefulWidget {
  final VoidCallback onClose; // This callback will be triggered when the bottom sheet is closed.

  SubscriptionSheet({required this.onClose});

  @override
  _SubscriptionSheetState createState() => _SubscriptionSheetState();
}

class _SubscriptionSheetState extends State<SubscriptionSheet> {
  String selectedPlan = 'Gold'; 

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 3),
              child: Text(
                "Features Comparison",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            IconButton(
              icon: Icon(Icons.close, color: Colors.black),
              onPressed: () {
                widget.onClose(); 
                Navigator.pop(context); 
                      Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ReportScreen(),
              ),
            );
                

              },
            ),
          ],
        ),
        Divider(),
        Padding(
          padding: const EdgeInsets.only(left: 15, top: 10),
          child: Container(
            height: 55,
            width: 330,
            decoration: BoxDecoration(
              color: Colors.red.shade100,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "℗ Your current subscription does not include this feature. Please upgrade your plan.",
                style: TextStyle(color: Colors.red),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            showChangeBottomSheet(context); // Show modal bottom sheet when "Change" is tapped
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 15, top: 10),
            child: Container(
              height: 55,
              width: 330,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("1 Year", style: TextStyle()),
                    Text("Mobile", style: TextStyle()),
                    Text("Change ⌄", style: TextStyle(color: Colors.blue)),
                  ],
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        Expanded(
          child: ListView(
            children: [
              PlanComparisonRow("Sync data across devices", "✓", "✓", "✓"),
              PlanComparisonRow("Create multiple companies", "2", "3", "Unlimited"),
              PlanComparisonRow("Remove advertisement on invoices", "✗", "✓", "✓"),
              PlanComparisonRow("Manage godowns & transfer stock", "✗", "✗", "✓"),
              PlanComparisonRow("Set multiple pricing for items", "✗", "✓", "✓"),
              PlanComparisonRow("Restore deleted transactions", "✗", "✗", "Unlimited"),
              PlanComparisonRow("Set credit limit for parties", "✗", "✓", "✓"),
              PlanComparisonRow("Add Fixed Assets", "✗", "✓", "✓"),
            ],
          ),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedPlan = 'Silver';
                });
              },
              child: PlanOption(
                planName: "Silver Plan",
                price: "₹ 699 ₹ 1,099",
                isSelected: selectedPlan == 'Silver',
                gradientColors: [Colors.white, Colors.grey.shade300],
              ),
            ),
            SizedBox(width: 10),
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedPlan = 'Gold';
                });
              },
              child: PlanOption(
                planName: "Gold Plan",
                price: "₹ 799 ₹ 1,399",
                isSelected: selectedPlan == 'Gold',
                gradientColors: [Colors.white, Colors.amber],
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 320,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                onPressed: () {
                  print("Buying $selectedPlan");
                },
                child: Text(
                  selectedPlan == 'Gold' ? "Buy Gold" : "Buy Silver",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void showChangeBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => FractionallySizedBox(
        heightFactor: 0.5,
        child: Center(
          child: Text("Change Options", style: TextStyle(fontSize: 24)),
        ),
      ),
    );
  }
}

class PlanOption extends StatelessWidget {
  final String planName;
  final String price;
  final bool isSelected;
  final List<Color> gradientColors;

  PlanOption({
    required this.planName,
    required this.price,
    required this.isSelected,
    required this.gradientColors,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColors,
        ),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: isSelected ? Colors.blue : Colors.grey),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Column(
            children: [
              Row(
                children: [
                  Icon(FontAwesomeIcons.crown, color: Colors.amber, size: 20),
                  SizedBox(width: 10),
                  Text(planName),
                ],
              ),
              SizedBox(height: 5),
              Text(
                price,
                style: TextStyle(
                  decoration: TextDecoration.lineThrough,
                ),
              ),
            ],
          ),
          if (isSelected)
            Positioned(
              top: -20,
              right: -23,
              child: Icon(Icons.check_circle, color: Colors.blue, size: 20),
            ),
        ],
      ),
    );
  }
}
