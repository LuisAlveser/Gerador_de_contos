import 'dart:io';

import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class Pdf_servico {
  Future<String> generateAndSavePdf({
    required String texto,
    String? url_imagem,
  }) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Center(
            child: pw.Text(texto, style: pw.TextStyle(fontSize: 20)),
          );
        },
      ),
    );

    final fileName = 'documento_${DateTime.now().millisecondsSinceEpoch}.pdf';
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/${fileName}');
    await file.writeAsBytes(await pdf.save());
    try {
      await OpenFilex.open(file.path);
    } catch (e) {
      print('Erro ao tentar abrir o arquivo no Android: $e');
    }

    return file.path;
  }

  Future<String?> baixarPDF(String url) async {
    try {
     
      await FlutterDownloader.initialize(debug: true);

      
      final dir = await getApplicationDocumentsDirectory();
      final savedDir = dir.path;

     
      final taskId = await FlutterDownloader.enqueue(
        url: url,
        savedDir: savedDir,
        showNotification: true, 
        openFileFromNotification:
            true, 
        saveInPublicStorage: true, 
      );

      print('Download iniciado com o ID: $taskId');
      return taskId;
    } catch (e) {
      print('Erro ao iniciar o download: $e');
      return null;
    }
  }
}
