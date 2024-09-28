import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:intl/intl.dart';

class ItemReportByPartyPage extends StatefulWidget {
  const ItemReportByPartyPage({super.key});

  @override
  State<ItemReportByPartyPage> createState() => _ItemReportByPartyPageState();
}

class _ItemReportByPartyPageState extends State<ItemReportByPartyPage> {
  String selectedDateRange = "Custom";
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();
  bool isDropdownVisible = false;
  bool isTypeDropdownVisible = false;

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

  String selectedType = "Name";

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 12, 135, 206),
        shadowColor: Colors.grey,
        elevation: 1,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 5),
            child: Row(
              children: [
                SizedBox(
                  width: 220,
                  child: Text(
                    "Item Reported By Party",
                    style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        overflow: TextOverflow.ellipsis),
                  ),
                ),
                SizedBox(width: 15),
                Icon(
                  FontAwesomeIcons.solidFilePdf,
                  color: Colors.red,
                ),
                SizedBox(width: 8),
                Icon(
                  FontAwesomeIcons.solidFileExcel,
                  color: Colors.green,
                ),
              ],
            ),
          ),
        ],
      ),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
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
            const Padding(
              padding: EdgeInsets.only(left: 8, right: 8),
              child: Divider(thickness: 1, height: 1),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 3, left: 15, right: 10),
              child: Row(
                children: const [
                  Text(
                    "Party Name",
                    style: TextStyle(fontSize: 13, color: Colors.blue),
                  ),
                  SizedBox(width: 120),
                  Text(
                    "Sort by ",
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.blue,
                    ),
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
                    child: TextField(),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
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
                          style: const TextStyle(
                            fontSize: 18,
                          ),
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
                children: const [
                  Text(
                    "Item name",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                        decoration: TextDecoration.underline),
                  ),
                  SizedBox(
                    width: 75,
                  ),
                  Text(
                    'Sales qty',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                        decoration: TextDecoration.underline),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    "Purchase qty",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                        decoration: TextDecoration.underline),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 450,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Divider(),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 10, bottom: 5),
              child: Row(
                children: const [
                  Text(
                    "Total",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    width: 135,
                  ),
                  Text(
                    '0.0',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    width: 105,
                  ),
                  Text(
                    "0.0",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
