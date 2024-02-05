import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class PdfReader extends StatelessWidget {
  const PdfReader({super.key});

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
      // body: PDFView(
      //   filePath: 'assets/2021.pdf',
      //   // onPageChanged: (int page, int total) {
      //   //   print('Page $page of $total');
      //   // },
      //   onViewCreated: (PDFViewController controller) {
      //     // Do something with the controller if needed.
      //   },
      // ),
      body:
      return Scaffold(
         body: SfPdfViewer.asset(
            'assets/2021.pdf'));}
    // );
  }
// }
