import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:tax_xpert/model/user_model.dart';

class PdfTextExtractorPage extends StatefulWidget {
  const PdfTextExtractorPage({super.key});

  @override
  _PdfTextExtractorPageState createState() => _PdfTextExtractorPageState();
}

class _PdfTextExtractorPageState extends State<PdfTextExtractorPage> {
  String extractedText = "No text extracted yet";
  UserModel? user;
  List<String> list = [];
  Future<void> pickAndExtractPdfText() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );

      if (result != null) {
        File file = File(result.files.single.path!);

        // Load the PDF document.
        final PdfDocument document = PdfDocument(inputBytes: file.readAsBytesSync());

        String text = '';

        // Extract text from all pages
        for (int i = 0; i < document.pages.count; i++) {
          String pageText = PdfTextExtractor(document).extractText(startPageIndex: i, endPageIndex: i)!;
          text += pageText;
        }

        // Split the text by newlines and add each line to the list
        setState(() {
          list.addAll(text.split('\n').where((line) => line.isNotEmpty));
          user = parseUserFromExtractedText(list);
        });

        print(list[0].trim());
        document.dispose();
      }
    } catch (e) {
      // Handle any errors that occur during file picking or PDF extraction
      print('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to pick or extract text from PDF.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF Text Extractor'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: pickAndExtractPdfText,
            child: const Text('Pick and Extract Text from PDF'),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Raw Extracted Text:'),
                  for (int i = 0; i < list.length; i++) Text('$i ${list[i]}'),
                  if (user != null) ...[
                    const SizedBox(height: 20),
                    const Text('Parsed User Data:', style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold)),
                    Text('Name: ${user!.name}'),
                    Text('Assessment Year: ${user!.assessmentYear}'),
                    Text('Form Number: ${user!.formNumber}'),
                    Text('Status: ${user!.status}'),
                    Text('Current Year Business Loss: ${user!.currentYearBusinessLoss}'),
                    Text('Total Income: ${user!.totalIncome}'),
                    Text('Book Profit under MAT: ${user!.bookProfitUnderMAT}'),
                    Text('Adjusted Total Income under AMT: ${user!.adjustedTotalIncomeUnderAMT}'),
                    Text('Net Tax Payable: ${user!.netTaxPayable}'),
                    Text('Interest and Fee Payable: ${user!.interestAndFeePayable}'),
                    Text('Total Tax, Interest and Fee Payable: ${user!.totalTaxInterestAndFeePayable}'),
                    Text('Taxes Paid: ${user!.taxesPaid}'),
                    Text('Tax Payable/Refundable: ${user!.taxPayableOrRefundable}'),
                    Text('Accreted Income as per section 115TD: ${user!.accretedIncomeAsPerSection115TD}'),
                    Text('Additional Tax Payable u/s 115TD: ${user!.additionalTaxPayableU_S115TD}'),
                    Text('Interest Payable u/s 115TE: ${user!.interestPayableU_S115TE}'),
                    Text('Additional Tax and Interest Payable: ${user!.additionalTaxAndInterestPayable}'),
                    Text('Tax and Interest Paid: ${user!.taxAndInterestPaid}'),
                    Text('Final Tax Payable/Refundable: ${user!.finalTaxPayableOrRefundable}'),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

UserModel parseUserFromExtractedText(List<String> lines) {
  final Map<String, String> dataMap = {};

  // Initialize index variables
  int i = 0;

  // Extract the data based on known indexes
  while (i < lines.length) {
    final String line = lines[i].trim();

    if (line.startsWith('Date of filing :')) {
      if (i + 1 < lines.length) {
        dataMap['Date of filing'] = lines[i + 1].trim();
        i++; // Skip to the next line after the date
      }
    } else if (line.startsWith('Name')) {
      String text = '';
      while (i + 1 < lines.length && !lines[i + 1].startsWith('Address')) {
        text += '${lines[++i].trim()} ';
      }
      dataMap['Name'] = text.trim();
    } else if (line.startsWith('Assessment Year')) {
      if (i + 1 < lines.length) {
        dataMap['Assessment Year'] = lines[i + 1].trim();
        i++;
      }
    } else if (line.startsWith('Form Number')) {
      if (i + 1 < lines.length) {
        dataMap['Form Number'] = lines[i + 1].trim();
        i++;
      }
    } else if (line.startsWith('Status')) {
      if (i + 1 < lines.length) {
        dataMap['Status'] = lines[i + 1].trim();
        i++;
      }
    } else if (line.startsWith('Current Year business loss, if any')) {
      if (i + 1 < lines.length) {
        dataMap['Current Year business loss, if any'] = lines[i + 2].trim();
        i++;
      }
    } else if (line.startsWith('Total Income')) {
      if (i + 1 < lines.length) {
        dataMap['Total Income'] = lines[i + 2].trim();
        i++;
      }
    } else if (line.startsWith('Book Profit under MAT, where applicable')) {
      if (i + 1 < lines.length) {
        dataMap['Book Profit under MAT'] = lines[i + 2].trim();
        i++;
      }
    } else if (line.startsWith('Adjusted Total Income under AMT, where applicable')) {
      if (i + 1 < lines.length) {
        dataMap['Adjusted Total Income under AMT'] = lines[i + 2].trim();
        i++;
      }
    } else if (line.startsWith('Net tax payable')) {
      if (i + 1 < lines.length) {
        dataMap['Net tax payable'] = lines[i + 2].trim();
        i++;
      }
    } else if (line.startsWith('Interest and Fee Payable')) {
      if (i + 1 < lines.length) {
        dataMap['Interest and Fee Payable'] = lines[i + 2].trim();
        i++;
      }
    } else if (line.startsWith('Total tax, interest and Fee payable')) {
      if (i + 1 < lines.length) {
        dataMap['Total tax, interest and Fee payable'] = lines[i + 2].trim();
        i++;
      }
    } else if (line.startsWith('Taxes Paid')) {
      if (i + 1 < lines.length) {
        dataMap['Taxes Paid'] = lines[i + 2].trim();
        i++;
      }
    } else if (line.startsWith('(+) Tax Payable /(-) Refundable (7-8)')) {
      if (i + 1 < lines.length) {
        dataMap['Tax Payable / Refundable'] = lines[i + 2].trim();
        i++;
      }
    } else if (line.startsWith('Accreted Income as per section 115TD')) {
      if (i + 1 < lines.length) {
        dataMap['Accreted Income as per section 115TD'] = lines[i + 2].trim();
        i++;
      }
    } else if (line.startsWith('Additional Tax payable u/s 115TD')) {
      if (i + 1 < lines.length) {
        dataMap['Additional Tax payable u/s 115TD'] = lines[i + 2].trim();
        i++;
      }
    } else if (line.startsWith('Interest payable u/s 115TE')) {
      if (i + 1 < lines.length) {
        dataMap['Interest payable u/s 115TE'] = lines[i + 2].trim();
        i++;
      }
    } else if (line.startsWith('Additional Tax and interest payable')) {
      if (i + 1 < lines.length) {
        dataMap['Additional tax and interest payable'] = lines[i + 2].trim();
        i++;
      }
    } else if (line.startsWith('Tax and interest paid')) {
      if (i + 1 < lines.length) {
        dataMap['Tax and interest paid'] = lines[i + 2].trim();
        i++;
      }
    } else if (line.startsWith('(+) Tax Payable /(-) Refundable (13-14)')) {
      if (i + 1 < lines.length) {
        dataMap['Final Tax payable / Refundable'] = lines[i + 2].trim();
        i++;
      }
    }

    // Move to the next line if no match is found
    i++;
  }

  // Create a User object from the parsed data
  return UserModel(
    assessmentYear: dataMap['Assessment Year'] ?? '',
    name: dataMap['Name'] ?? '',
    formNumber: dataMap['Form Number'] ?? '',
    status: dataMap['Status'] ?? '',
    currentYearBusinessLoss: double.tryParse(dataMap['Current Year business loss, if any'] ?? '0.0') ?? 0.0,
    totalIncome: double.tryParse(dataMap['Total Income']?.replaceAll(',', '') ?? '0.0') ?? 0.0,
    bookProfitUnderMAT: double.tryParse(dataMap['Book Profit under MAT']?.replaceAll(',', '') ?? '0.0') ?? 0.0,
    adjustedTotalIncomeUnderAMT: double.tryParse(dataMap['Adjusted Total Income under AMT']?.replaceAll(',', '') ?? '0.0') ?? 0.0,
    netTaxPayable: double.tryParse(dataMap['Net tax payable']?.replaceAll(',', '') ?? '0.0') ?? 0.0,
    interestAndFeePayable: double.tryParse(dataMap['Interest and Fee Payable']?.replaceAll(',', '') ?? '0.0') ?? 0.0,
    totalTaxInterestAndFeePayable: double.tryParse(dataMap['Total tax, interest and Fee payable']?.replaceAll(',', '') ?? '0.0') ?? 0.0,
    taxesPaid: double.tryParse(dataMap['Taxes Paid']?.replaceAll(',', '') ?? '0.0') ?? 0.0,
    taxPayableOrRefundable: double.tryParse(dataMap['Tax Payable / Refundable']?.replaceAll(',', '') ?? '0.0') ?? 0.0,
    accretedIncomeAsPerSection115TD: double.tryParse(dataMap['Accreted Income as per section 115TD']?.replaceAll(',', '') ?? '0.0') ?? 0.0,
    additionalTaxPayableU_S115TD: double.tryParse(dataMap['Additional Tax payable u/s 115TD']?.replaceAll(',', '') ?? '0.0') ?? 0.0,
    interestPayableU_S115TE: double.tryParse(dataMap['Interest payable u/s 115TE']?.replaceAll(',', '') ?? '0.0') ?? 0.0,
    additionalTaxAndInterestPayable: double.tryParse(dataMap['Additional tax and interest payable']?.replaceAll(',', '') ?? '0.0') ?? 0.0,
    taxAndInterestPaid: double.tryParse(dataMap['Tax and interest paid']?.replaceAll(',', '') ?? '0.0') ?? 0.0,
    finalTaxPayableOrRefundable: double.tryParse(dataMap['Final Tax payable / Refundable']?.replaceAll(',', '') ?? '0.0') ?? 0.0,
  );
}
