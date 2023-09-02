import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PDFScreen extends StatelessWidget {
  const PDFScreen({super.key});

  @override
  Widget build(BuildContext context) {
    File file;
    file = ModalRoute.of(context)?.settings.arguments as File;

    return Scaffold(
      appBar: AppBar(title: Text(path.basename(file.path)), centerTitle: true),
      body: SfPdfViewer.file(
        file,
        canShowPageLoadingIndicator: true,
        maxZoomLevel: 20,
        
      ),
    );
  }
}
