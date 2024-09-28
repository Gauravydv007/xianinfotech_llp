import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SalePurchaseByItemCategoryPage extends StatefulWidget {
  const SalePurchaseByItemCategoryPage({super.key});

  @override
  State<SalePurchaseByItemCategoryPage> createState() =>
      _SalePurchaseByItemCategoryPageState();
}

class _SalePurchaseByItemCategoryPageState
    extends State<SalePurchaseByItemCategoryPage> {
  String selectedDateRange = "Custom";
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();
  bool isDropdownVisible = false;
  bool isTypeDropdownVisible = false;
  String selectedType = "Name";
  String selectedParty = "All parties";
  bool isPartyDropdownVisible = false;
  TextEditingController partyController = TextEditingController();

  final List<String> dateRangeOptions = [
    "Today",
    "This Week",
    "This Month",
    "This Quarter",
    "This Year",
    "Custom"
  ];

  final List<String> typeOptions = [
    "Name",
    "Sale qua...",
    "Purchas..",
  ];

  final List<String> partyOptions = [
    "All parties",
    "Username ",
  ];

  String formatDate(DateTime date) {
    return DateFormat('dd/MM/yyyy').format(date);
  }

  Future<void> selectDate(BuildContext context, bool isStartDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: isStartDate ? startDate : endDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != (isStartDate ? startDate : endDate)) {
      setState(() {
        if (isStartDate) {
          startDate = picked;
        } else {
          endDate = picked;
        }
      });
    }
  }

  void selectDateRange(String option) {
    setState(() {
      selectedDateRange = option;
      isDropdownVisible = false;
    });
  }

  void selectType(String option) {
    setState(() {
      selectedType = option;
      isTypeDropdownVisible = false;
    });
  }

  void selectParty(String option) {
    setState(() {
      selectedParty = option;
      isPartyDropdownVisible = false;
    });
  }

  void showPartyOptions() {
    setState(() {
      isPartyDropdownVisible = true;
    });
  }

  @override
  void initState() {
    super.initState();
    partyController.text = selectedParty;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 12, 135, 206),
        shadowColor: Colors.grey,
        elevation: 1,
        actions: const [
          Row(
            children: [
              SizedBox(
                width: 220,
                child: Text(
                  "Sale Purchase By Item Category",
                  style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      overflow: TextOverflow.ellipsis),
                ),
              ),
              SizedBox(
                width: 50,
              ),
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: Icon(
                  Icons.more_vert,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ],
      ),
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      offset: const Offset(0.0, -2),
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isDropdownVisible = !isDropdownVisible;
                          });
                        },
                        child: Row(
                          children: [
                            Text(
                              selectedDateRange,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey.shade700,
                              ),
                            ),
                            const SizedBox(width: 10),
                            const Icon(Icons.arrow_drop_down),
                          ],
                        ),
                      ),
                      const SizedBox(width: 5),
                      const SizedBox(
                        height: 20,
                        child: VerticalDivider(color: Colors.grey),
                      ),
                      GestureDetector(
                        onTap: () => selectDate(context, true),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.calendar_month,
                              color: Colors.blue,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              formatDate(startDate),
                              style: const TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 7),
                      const Text(
                        "to",
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(width: 7),
                      GestureDetector(
                        onTap: () => selectDate(context, false),
                        child: Row(
                          children: [
                            Text(
                              formatDate(endDate),
                              style: const TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Divider(thickness: 1, height: 1),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 3, left: 15, right: 10),
                child: Row(
                  children: [
                    const Text(
                      "Party Name",
                      style: TextStyle(fontSize: 13, color: Colors.blue),
                    ),
                    const SizedBox(width: 120),
                    const Text(
                      "Sort by ",
                      style: TextStyle(fontSize: 13, color: Colors.blue),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Row(
                  children: [
                    Container(
                      height: 50,
                      width: 180,
                      child: TextField(
                        controller: partyController,
                        readOnly: true,
                        onTap: showPartyOptions,
                        decoration: const InputDecoration(
                          hintText: 'Select or type party name',
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isTypeDropdownVisible = !isTypeDropdownVisible;
                        });
                      },
                      child: Row(
                        children: [
                          Text(
                            selectedType,
                            style: const TextStyle(fontSize: 18),
                          ),
                          const SizedBox(width: 10),
                          const Icon(Icons.arrow_drop_down),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                child: Row(
                  children: [
                    Text(
                      "Item Category",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey.shade600,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.grey.shade600),
                    ),
                    const SizedBox(width: 75),
                    Text(
                      'Sale qty',
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey.shade600,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.grey.shade600),
                    ),
                    const SizedBox(width: 15),
                    Text(
                      "Purchase qty",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey.shade600,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.grey.shade600),
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (isDropdownVisible)
            Positioned(
              top: 35,
              left: 10,
              child: Container(
                height: 170,
                width: 120,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: const Offset(0.0, 1),
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                child: Column(
                  children: dateRangeOptions.map((String option) {
                    return SizedBox(
                      height: 26,
                      child: ListTile(
                        dense: true,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 10),
                        title: Text(
                          option,
                          style: const TextStyle(fontSize: 12),
                        ),
                        onTap: () {
                          selectDateRange(option);
                        },
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          if (isTypeDropdownVisible)
            Positioned(
              top: 100,
              left: 200,
              child: Container(
                height: 130,
                width: 120,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: const Offset(0.0, 1),
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                child: Column(
                  children: typeOptions.map((String option) {
                    return SizedBox(
                      height: 26,
                      child: ListTile(
                        dense: true,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 10),
                        title: Text(
                          option,
                          style: const TextStyle(fontSize: 12),
                        ),
                        onTap: () {
                          selectType(option);
                        },
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          if (isPartyDropdownVisible)
            Positioned(
              top: 120,
              left: 15,
              child: Container(
                height: 100,
                width: 150,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: const Offset(0.0, 1),
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                child: Column(
                  children: partyOptions.map((String option) {
                    return SizedBox(
                      height: 28,
                      child: ListTile(
                        dense: true,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 10),
                        title: Text(
                          option,
                          style: const TextStyle(fontSize: 12),
                        ),
                        onTap: () {
                          selectParty(option);
                        },
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
