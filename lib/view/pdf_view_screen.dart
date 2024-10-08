import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:open_file_plus/open_file_plus.dart';
//import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf_view_and_create/mdoel/cart_item.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

class PdfViewScreen extends StatelessWidget {
  const PdfViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<CartItem> cartItems = [
      CartItem(productName: 'Product 1', quantity: 2, price: 50.0),
      CartItem(productName: 'Product 2', quantity: 1, price: 30.0),
      CartItem(productName: 'Product 3', quantity: 3, price: 20.0),
    ];

    return Scaffold(
      body: SizedBox(
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('PDF File Create And View'),
            ElevatedButton(
                onPressed: () async {
                  PdfDocument document = PdfDocument();

                  PdfPage page = document.pages.add();

                  PdfGraphics graphics = page.graphics;
                  
                  // NEED TO KNOW //
                  '''
                  here Pdf working like stack, the last element will appears first in page,
                  
                  ''';
                

                  // Load the image from assets as bytes.
                  final Uint8List imageData =
                      await loadImageFromAssets('assets/logos/diu_logo.png');

                  // Create a PdfBitmap from the image data.
                  final PdfBitmap logo = PdfBitmap(imageData);

                  // Get the page width and height.
                  final double pageWidth = page.getClientSize().width;
                  final double pageHeight = page.getClientSize().height;

                  // Get the logo width and height.
                  const double logoWidth =
                      80; // Set this to the actual width of your logo
                  const double logoHeight =
                      80; // Set this to the actual height of your logo

                  // Calculate the x and y positions to center the logo.
                  final double x = (pageWidth - logoWidth) / 2;
                  final double y = (pageHeight - logoHeight) / 2;

                  // Draw the logo at the calculated position.
                  graphics.drawImage(
                      logo, Rect.fromLTWH(x, 0, logoWidth, logoHeight));

               

                  // Create a standard font.
                  PdfFont standardFontFamilySize =
                      PdfStandardFont(PdfFontFamily.timesRoman, 20);

                  // The text to be drawn.
                  String diuTitleText = 'Daffodil International University';

                  // Get the size of the text.
                  final Size diuTextSize =
                      standardFontFamilySize.measureString(diuTitleText);

                  // Calculate the x position to center the text.
                  final double forTitleTextX =
                      (pageWidth - diuTextSize.width) / 2;

                  // Draw the text at the calculated position.
                  graphics.drawString(
                      diuTitleText,
                      bounds: Rect.fromLTWH(forTitleTextX, 80,
                          diuTextSize.width, diuTextSize.height),
                      standardFontFamilySize);

                 

                  // ---------------- Assignment On Title ---------------- //

                  const assignmentString = 'Assignment On';

                  // Get the size of the text.
                  final Size assignmentFontSize =
                      standardFontFamilySize.measureString(assignmentString);

                  // Calculate the x position to center the text.
                  final double assignmentFontX =
                      (pageWidth - assignmentFontSize.width) / 2;

                  graphics.drawString(
                      assignmentString,
                      bounds: Rect.fromLTWH(assignmentFontX, 140, 0, 0),
                      standardFontFamilySize);

                  // ---------------- Course Code and Title  ---------------- //
                  // Draw the placeholders for "Course Code" and "Course Title"

                  // bodyTextFont Size and Family
                  PdfFont bodyFontFamilySize =
                      PdfStandardFont(PdfFontFamily.timesRoman, 14);

                  const String courseCodeString = 'Course Code';

                  graphics.drawString(
                      courseCodeString,
                      bounds: const Rect.fromLTWH(20, 200, 200, 100),
                      bodyFontFamilySize);

                  graphics.drawString(
                      'Course Title:',
                      bounds: const Rect.fromLTWH(20, 250, 200, 100),
                      bodyFontFamilySize);

                  // ---------------- Course Code and Title  ---------------- //
                  // Draw the text "Submitted To:"
                  graphics.drawString(
                      'Submitted To:',
                      bounds: const Rect.fromLTWH(20, 400, 200, 100),
                      bodyFontFamilySize);

                  // Draw the placeholders for "Teacher Name", "Designation", and "Department"
                  graphics.drawString(
                      'Teacher Name: ',
                      bounds: const Rect.fromLTWH(20, 450, 200, 100),
                      bodyFontFamilySize);
                  graphics.drawString(
                      'Designation:',
                      bounds: const Rect.fromLTWH(20, 500, 200, 100),
                      bodyFontFamilySize);
                  graphics.drawString(
                      'Department of',
                      bounds: const Rect.fromLTWH(20, 550, 200, 100),
                      bodyFontFamilySize);
                  graphics.drawString(
                      'Daffodil International University',
                      bounds: const Rect.fromLTWH(20, 600, 400, 100),
                      bodyFontFamilySize);

                  // Draw the text "Submitted By:"
                  graphics.drawString(
                      'Submitted By:',
                      bounds: const Rect.fromLTWH(350, 400, 200, 100),
                      bodyFontFamilySize);

                  // Draw the placeholders for "Name", "ID", and "Department"
                  graphics.drawString(
                      'Name:',
                      bounds: const Rect.fromLTWH(350, 450, 200, 100),
                      bodyFontFamilySize);
                  graphics.drawString(
                      'ID:',
                      bounds: const Rect.fromLTWH(350, 500, 200, 100),
                      bodyFontFamilySize);
                  graphics.drawString(
                      'Department of',
                      bounds: const Rect.fromLTWH(350, 550, 200, 100),
                      bodyFontFamilySize);
                  graphics.drawString(
                      'Daffodil International University',
                      bounds: const Rect.fromLTWH(350, 600, 400, 100),
                      bodyFontFamilySize);

                  // ------------ Draw the text "Date of Submission: ------------ "

                  const dueSubmission = 'Due of Submission';

                  // Get the size of the text.
                  final Size dueSubmissionFontSize =
                      standardFontFamilySize.measureString(dueSubmission);

                  // Calculate the x position to center the text.
                  final double dueSubmissionX =
                      (pageWidth - dueSubmissionFontSize.width) / 2;

                  graphics.drawString(
                      'Date of Submission:',
                      bounds: Rect.fromLTWH(dueSubmissionX, 670, 220, 100),
                      standardFontFamilySize);
                   
                   // ------------- Water Mark ------------- //  
                  //Set transparency //
                  graphics.setTransparency(0.15);

                  final double waterMarkX = (pageWidth - 400) / 2;
                   final double waterMarkY = (pageHeight - 400) / 2;

                  //Add text watermark
                  graphics.drawImage(logo,
                        Rect.fromLTWH(waterMarkX, waterMarkY, 400, 400));    

                  // ------------- Create Table Insert Data From List ------------- //
                  // Create a PdfGrid to display the cart items
                  final PdfGrid grid = PdfGrid();
                  grid.columns.add(count: 4);

                  // // Add header to the grid
                  final PdfGridRow headerRow = grid.headers.add(1)[0];
                  headerRow.cells[0].value = 'Product Name';
                  headerRow.cells[1].value = 'Quantity';
                  headerRow.cells[2].value = 'Price';
                  headerRow.cells[3].value = 'Total';

                  //Add data to the grid
                  for (var item in cartItems) {
                    PdfGridRow row = grid.rows.add();
                    row.cells[0].value = item.productName;
                    row.cells[1].value = item.quantity.toString();
                    row.cells[2].value = '\$${item.price.toStringAsFixed(2)}';
                    row.cells[3].value =
                        '\$${(item.price * item.quantity).toStringAsFixed(2)}';
                  }

                  //Set the grid style
                  grid.style = PdfGridStyle(
                      cellPadding:
                          PdfPaddings(left: 2, right: 3, top: 4, bottom: 5),
                      backgroundBrush: PdfBrushes.white,
                      textBrush: PdfBrushes.black,
                      font: PdfStandardFont(
                        PdfFontFamily.timesRoman,
                        25,
                      ));

                  // Draw the grid on the PDF page
                  grid.draw(
                    page: page,
                    bounds: const Rect.fromLTWH(0, 900, 0, 0),
                  );

                  // ------------- Save And Open File  ------------- //
                  // Save the PDF file to the local storage
                  final output = await getExternalStorageDirectory();
                  final file = File("${output!.path}/example.pdf");
                  await file.writeAsBytes(await document.save(), flush: true);
                  if (await file.exists()) {
                    // Open the PDF file
                    final result = await OpenFile.open(file.path);
                    if (result.type != ResultType.done) {
                      Get.snackbar(
                          "Ops", "Failed to open file: ${result.message}");
                    } else if (result.type == ResultType.error) {
                      Get.snackbar("Ops", "Something went wrong");
                    } else if (result.type == ResultType.fileNotFound) {
                      Get.snackbar("Ops", "File Not Found");
                    } else if (result.type == ResultType.noAppToOpen) {
                      Get.snackbar("Ops", "No App To Open This File");
                    } else if (result.type == ResultType.permissionDenied) {
                      Get.snackbar("Ops", "User Permissidon Denied");
                    } else {
                      null;
                    }
                  }
                },
                child: const Text('Generate Pdf'))
          ],
        ),
      ),
    );
  }
}

// Function to load the image from the assets folder.
Future<Uint8List> loadImageFromAssets(String path) async {
  final ByteData data = await rootBundle.load(path);
  return data.buffer.asUint8List();
}
