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
      print('URLs de imagens: ${urlsImagens.length}');
      for (var url in urlsImagens) {
        final response = await http.get(Uri.parse(url));
        if (response.statusCode == 200) {
          imagensBytes.add(response.bodyBytes);
        }
      }
      print(imagensBytes.length);
    }

    if (imagensBytes.isEmpty) {
      // sem imagens
      pdf.addPage(
        pw.MultiPage(
          pageFormat: PdfPageFormat.a4,
          build: (pw.Context context) {
            return [
              pw.Paragraph(
                text: texto,
                style: pw.TextStyle(font: pw.Font.times(), fontSize: 16),
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
            final List<pw.Widget> widgets = [];
            widgets.add(
              pw.Padding(
                padding: const pw.EdgeInsets.only(bottom: 15),
                child: pw.Center(
                  child: pw.Image(
                    pw.MemoryImage(imagensBytes[0]),
                    fit: pw.BoxFit.contain,
                    width: PdfPageFormat.a4.availableWidth,
                    height: 300,
                  ),
                ),
              ),
            );

            widgets.add(
              pw.Paragraph(
                text: texto,
                style: pw.TextStyle(font: pw.Font.times(), fontSize: 16),
                padding: const pw.EdgeInsets.only(bottom: 15),
              ),
            );

            for (int i = 1; i < imagensBytes.length; i++) {
              widgets.add(
                pw.Padding(
                  padding: const pw.EdgeInsets.symmetric(vertical: 5),

                  child: pw.Center(
                    child: pw.Image(
                      pw.MemoryImage(imagensBytes[i]),
                      fit: pw.BoxFit.contain,
                      height: 300,
                      width: PdfPageFormat.a4.availableWidth,
                    ),
                  ),
                ),
              );
            }

            return widgets;
          },
        ),
      );
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
