import 'package:flutter/material.dart';
import 'package:pdf_view_and_create/view/pdf_view_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Material App',
      home: PdfViewScreen(),
    );
  }
}