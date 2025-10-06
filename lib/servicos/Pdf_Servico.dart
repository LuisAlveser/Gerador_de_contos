import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:http/http.dart' as http;
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class Pdf_servico {
  Future<String> generateAndSavePdf({
    required String texto,
    List<String>? urlsImagens,
  }) async {
    final pdf = pw.Document();
    final roboto = pw.Font.ttf(await rootBundle.load('assets/Roboto.ttf'));

    List<Uint8List> imagensBytes = [];
    if (urlsImagens != null && urlsImagens.isNotEmpty) {
      for (var url in urlsImagens) {
        final response = await http.get(Uri.parse(url));
        if (response.statusCode == 200) {
          imagensBytes.add(response.bodyBytes);
        }
      }
    }

    if (urlsImagens == null || urlsImagens.isEmpty) {
      // sem imagens
      pdf.addPage(
        pw.MultiPage(
          pageFormat: PdfPageFormat.a4,
          build: (pw.Context context) {
            return [
              pw.Paragraph(
                text: texto,
                style: pw.TextStyle(font: roboto, fontSize: 16),
              ),
            ];
          },
        ),
      ); //
    } else {
      // com imagens
      pdf.addPage(
        pw.MultiPage(
          pageFormat: PdfPageFormat.a4,
          build: (pw.Context context) {
            return [
              if (imagensBytes.isNotEmpty)
                pw.Image(
                  pw.MemoryImage(imagensBytes[0]),
                  fit: pw.BoxFit.contain,
                  width: PdfPageFormat.a4.availableWidth,
                  height: 300,
                ),

              pw.Text(texto, style: pw.TextStyle(font: roboto, fontSize: 16)),
              if (imagensBytes.length > 1) ...[
                pw.Image(
                  pw.MemoryImage(imagensBytes[1]),
                  fit: pw.BoxFit.contain,
                  height: 200,
                ),
              ],
            ];
          },
        ),
      ); //
    }

    final fileName = 'documento_${DateTime.now().millisecondsSinceEpoch}.pdf';
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/$fileName');
    await file.writeAsBytes(await pdf.save());

    try {
      await OpenFilex.open(file.path);
    } catch (e) {
      print('Erro ao abrir o PDF: $e');
    }

    return file.path;
  }
}
