import 'package:flutter/material.dart';
import 'package:xianinfotech_llp_gaurav/features/screens/Reports/views/report_screen.dart';
import 'package:xianinfotech_llp_gaurav/utils/widgets/PlanComparisonRow_widget.dart';
import 'package:xianinfotech_llp_gaurav/utils/widgets/Plan_option_widget.dart';

class ItemSerialReportPage extends StatefulWidget {
  final bool autoShowBottomSheet;

  ItemSerialReportPage({this.autoShowBottomSheet = false});

  @override
  _ItemSerialReportPageState createState() => _ItemSerialReportPageState();
}

class _ItemSerialReportPageState extends State<ItemSerialReportPage> {
  @override
  void initState() {
    super.initState();

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
        title: const Text("Flutter Subscription Plans"),
      ),
      body: Center(
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
  final VoidCallback onClose;

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
              padding: const EdgeInsets.only(
                  left: 16, right: 16, top: 10, bottom: 3),
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
            showChangeBottomSheet(
                context); // Show modal bottom sheet when "Change" is tapped
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
              PlanComparisonRow(
                  "Create multiple companies", "2", "3", "Unlimited"),
              PlanComparisonRow(
                  "Remove advertisement on invoices", "✗", "✓", "✓"),
              PlanComparisonRow(
                  "Manage godowns & transfer stock", "✗", "✗", "✓"),
              PlanComparisonRow(
                  "Set multiple pricing for items", "✗", "✓", "✓"),
              PlanComparisonRow(
                  "Restore deleted transactions", "✗", "✗", "Unlimited"),
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
            const SizedBox(width: 10),
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
