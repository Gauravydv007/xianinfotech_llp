import 'package:flutter/material.dart';
import 'package:xianinfotech_llp_gaurav/features/screens/Item&Stock_reports_pages/Stock_reports_pages/Item_batch_report_page.dart';
import 'package:xianinfotech_llp_gaurav/features/screens/Item&Stock_reports_pages/Stock_reports_pages/Item_details_report.dart';
import 'package:xianinfotech_llp_gaurav/features/screens/Item&Stock_reports_pages/Stock_reports_pages/Item_report_by_party_page.dart';
import 'package:xianinfotech_llp_gaurav/features/screens/Item&Stock_reports_pages/Stock_reports_pages/Item_serial_report_page.dart';
import 'package:xianinfotech_llp_gaurav/features/screens/Item&Stock_reports_pages/Stock_reports_pages/Item_wise_discount_page.dart';
import 'package:xianinfotech_llp_gaurav/features/screens/Item&Stock_reports_pages/Stock_reports_pages/Item_wise_profit_loss_page.dart';
import 'package:xianinfotech_llp_gaurav/features/screens/Item&Stock_reports_pages/Stock_reports_pages/Low_stock_summary_report_page.dart';
import 'package:xianinfotech_llp_gaurav/features/screens/Item&Stock_reports_pages/Stock_reports_pages/Sale_purchase_by_item_category_page.dart';
import 'package:xianinfotech_llp_gaurav/features/screens/Item&Stock_reports_pages/Stock_reports_pages/Stock_detail_page.dart';
import 'package:xianinfotech_llp_gaurav/features/screens/Item&Stock_reports_pages/Stock_reports_pages/Stock_summary_by_item_category_page.dart';
import 'package:xianinfotech_llp_gaurav/features/screens/Item&Stock_reports_pages/Stock_reports_pages/Stock_summary_report.dart';


class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Reports'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Action for search
            },
          ),
        ],
        backgroundColor: Colors.blue.shade50,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: const TextStyle(color: Colors.black, fontSize: 18),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // First Category - Transaction
          const Text(
            'Transaction',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 10),
          buildSubItem('Sale Report', context, () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => SaleReport(),
            //   ),
            // );
          }),
          buildSubItem('Purchase Report', context, () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => PurchaseReport(),
            //   ),
            // );
          }),
          buildSubItem('Day Book', context, () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => DayBook(),
            //   ),
            // );
          }),
          buildSubItem('All Transactions', context, () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => AllTransaction(),
            //   ),
            // );
          }),
          buildSubItemWithIcon(
              'Bill Wise Profit', context, Icons.info_outline, () {}),
          buildSubItem('Profit & Loss', context, () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => ProfitAndLossReoprt(),
            //   ),
            // );
          }),
          buildSubItem('Cashflow', context, () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => CashFlowReportReport(),
            //   ),
            // );
          }),
          buildSubItemWithIcon(
              'Balance Sheet', context, Icons.info_outline, () {}),

          const SizedBox(height: 30),

          // Second Category - Party Reports
          const Text(
            'Party reports',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 10),
          buildSubItem('Party Statement', context, () {}),
          buildSubItemWithIcon(
              'Party Wise Profit & Loss',
              context,
              Icons.info_outline,
              color: Colors.yellow,
              () {}),
          buildSubItem('All Parties Report', context, () {}),
          buildSubItem('Party Report by Items', context, () {}),
          buildSubItem('Sale/Purchase by Party', context, () {}),

          const SizedBox(height: 30),

          // Third Category - GST Reports
          const Text(
            'GST repots',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 10),
          buildSubItem('GST-1', context, () {}),
          buildSubItem('GST-2', context, () {}),
          buildSubItem('GSTR-3B', context, () {}),
          buildSubItem('GST Transction report', context, () {}),
          buildSubItem('GSTR-9', context, () {}),
          buildSubItem('Sale Summary by HSN', context, () {}),
          buildSubItem('SAC Report', context, () {}),

          //Forth  Category - Item/Stock Reports

          const Text(
            'Item/Stock reports',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 10),
          buildSubItem('Stock Summary Report', context, () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => StockSummaryReportPage(),
              ),
            );

          }),
          buildSubItem('Item Report by Party ', context, () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ItemReportByPartyPage(),
              ),
            );
          }),
          buildSubItem('Item Wise Profit & Loss', context, () {
             Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ItemWiseProfitLossPage(),
              ),
            );
          }),
          buildSubItem('Low Stock Summary Report', context, () {
             Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LowStockSummaryReportPage(),
              ),
            );
          }),

          buildSubItem('Item Detail Report', context, () {
              Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ItemDetailsReportPage(),
              ),
            );
          }),
          buildSubItem('Stock Detail Report', context, () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => StockDetailPage(),
              ),
            );
          }),
          buildSubItem('Sale/Purchase By Item Category', context, () {
             Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SalePurchaseByItemCategoryPage(),
              ),
            );
          }),
          buildSubItem('Stock summary By Item Category', context, () {
             Navigator.push(
              context,
              MaterialPageRoute(

                builder: (context)=> StockSummaryByItemCategoryPage()
              ),
            );
          }),
          buildSubItemWithIcon(
              'Item Batch Report', context, Icons.info_outline, () {
                 Navigator.push(
              context,
              MaterialPageRoute(
                               builder: (context) => HomePage(autoShowBottomSheet: true,),

              ),
            );

              }),
          buildSubItemWithIcon(
              'Item Serial Report', context, Icons.info_outline, () {
                Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ItemSerialReportPage(autoShowBottomSheet: true,),
              ),
            );
              }),
          buildSubItem('Item Wise Discount', context, () {
             Navigator.push(
              context,
              MaterialPageRoute(

                builder: (context)=> ItemWiseDiscountPage()
              ),
            );
          }),
          const SizedBox(height: 30),

          //Fifth  Category -  Business status

          const Text(
            'Business status',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 10),
          buildSubItem('Bank Statement', context, () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => BankStatement(),
            //   ),
            // );
          }),
          buildSubItem('Discount Report', context, () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => DiscountReport(),
            //   ),
            // );
          }),

          const SizedBox(height: 30),

          //Sixth  Category -  Taxes

          const Text(
            'Taxes',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 10),
          buildSubItem('GST Report', context, () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => GstReportPage(),
            //   ),
            // );
          }),
          buildSubItem('GST Rate Report', context, () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => GstRateReport(),
            //   ),
            // );
          }),
          buildSubItem('Form No. 27EQ', context, () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => FormNo27EQScreen(),
            //   ),
            // );
          }),
          buildSubItem('TCS Receivable', context, () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => TcsReceivable(),
            //   ),
            // );
          }),

          buildSubItem('TDS Payable', context, () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => TdsPayable(),
            //   ),
            // );
          }),
          buildSubItem('TDS Receivable', context, () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => TdsReceivable(),
            //   ),
            // );
          }),

          const SizedBox(height: 30),

          //Seventh Category -  Expense report

          const Text(
            'Expense report',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 10),
          buildSubItem('Expense Transaction Report', context, () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => ExpenseTransaction(),
            //   ),
            // );
          }),
          buildSubItem('Expense Category Report', context, () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => ExpenseCategoryReport(),
            //   ),
            // );
          }),
          buildSubItem('Expense Item Report', context, () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => ExpenseItemReport(),
            //   ),
            // );
          }),

          const SizedBox(height: 30),

          //Eight Category -  Sale/Purchase Order report

          const Text(
            'Sale/Purchase Order report',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 10),
          buildSubItem('Sale/Purchase Order Transaction Report', context, () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => SalePurchaseOrderTransactionReport(),
            //   ),
            // );
          }),
          buildSubItem('Sale/Purchase Order Item Report', context, () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => SalePurchaseOrderItemReport(),
            //   ),
            // );
          }),

          const SizedBox(height: 30),

          //Nineth Category -  Loan report

          const Text(
            'Loan Report',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 10),
          buildSubItem('Loan Statement', context, () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => LoanStatementScreen(),
            //   ),
            // );
          }),

          const SizedBox(height: 30),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }

  Widget buildSubItem(String title, BuildContext context, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text(
          title,
          style: const TextStyle(fontSize: 16, color: Colors.black87),
        ),
      ),
    );
  }

 Widget buildSubItemWithIcon(
      String title, BuildContext context, IconData icon, VoidCallback onTap,
      {Color color = Colors.grey}) {
    return GestureDetector(
      onTap: onTap, // Corrected here to actually call the onTap function
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 16, color: Colors.black87),
            ),
            const SizedBox(width: 5),
            Icon(icon, size: 16, color: color),
          ],
        ),
      ),
    );
  }}