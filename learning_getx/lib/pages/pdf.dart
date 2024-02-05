import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class PdfReader extends StatelessWidget {
  const PdfReader({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PDFView(
        filePath: 'assets/2021.pdf',
        enableSwipe: true,
        swipeHorizontal: true,
        autoSpacing: false,
        pageFling: false,
        onRender: (_pages) {
          // setState(() {
          //   pages = _pages;
          //   isReady = true;
          // });
        },
        onError: (error) {
          print(error.toString());
        },
        onPageError: (page, error) {
          print('$page: ${error.toString()}');
        },
        // onViewCreated: (PDFViewController pdfViewController) {
        //   _controller.complete(pdfViewController);
        // },
        // onPageChanged: (int page, int total) {
        //   print('page change: $page/$total');
        // },
      ),
    );
  }
}
