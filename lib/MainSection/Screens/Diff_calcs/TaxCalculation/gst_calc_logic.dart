class GstCalculator {
  double price;

  GstCalculator(this.price);

  Map<String, double> calculateGST() {
    // Define GST rate (as a percentage, e.g., 18%)
    double gstRate = 18.0;

    // Calculate GST amount
    double gstAmount = (price * gstRate) / 100;

    // Split GST into CGST and SGST (half each)
    double cgstAmount = gstAmount / 2;
    double sgstAmount = gstAmount / 2;

    // Prepare the result as a map
    Map<String, double> gstDetails = {
      'GST': gstAmount,
      'CGST': cgstAmount,
      'SGST': sgstAmount,
    };

    return gstDetails;
  }
}

void main() {
  double price = 1000.0; // Replace with the actual price of the item
  GstCalculator gstCalculator = GstCalculator(price);
  Map<String, double> gstDetails = gstCalculator.calculateGST();

  print('GST: ${gstDetails['GST']}');
  print('CGST: ${gstDetails['CGST']}');
  print('SGST: ${gstDetails['SGST']}');
}
