import 'package:flutter/material.dart';

class DeductionScreen extends StatelessWidget {
  final List<Map<String, String>> deductions = [
    {"section": "80C", "deductionTowards": "Life Insurance Premium, Provident Fund, Tuition Fees, etc.", "deductionLimit": "₹ 1,50,000"},
    {"section": "80CCC", "deductionTowards": "Annuity plan of LIC or other insurer", "deductionLimit": "₹ -"},
    {"section": "80CCD(1)", "deductionTowards": "Pension Scheme of Central Government", "deductionLimit": "₹ 1,50,000"},
    {"section": "80CCD(1B)", "deductionTowards": "Pension Scheme of Central Government (additional)", "deductionLimit": "₹ 50,000"},
    {"section": "80CCD(2)", "deductionTowards": "Employer contribution to Pension Scheme", "deductionLimit": "10% or 14% of salary"},
    {"section": "80CCH", "deductionTowards": "Contribution to Agnipath Scheme", "deductionLimit": "-"},
    {"section": "80D", "deductionTowards": "Health Insurance Premium", "deductionLimit": "₹ 25,000 (₹ 50,000 for Senior Citizens)"},
    {"section": "80D", "deductionTowards": "Preventive Health Check-up", "deductionLimit": "Included in above limits"},
    {
      "section": "80DDB",
      "deductionTowards": "Medical treatment of specified diseases",
      "deductionLimit": "₹ 40,000 (₹ 1,00,000 for Senior Citizens)"
    },
    {"section": "80E", "deductionTowards": "Interest on loan for higher education", "deductionLimit": "Total amount paid"},
    {"section": "80EE", "deductionTowards": "Interest on loan for residential house (FY 2016-17)", "deductionLimit": "₹ 50,000"},
    {"section": "80EEA", "deductionTowards": "Interest on loan for first-time home buyers (FY 2019-22)", "deductionLimit": "₹ 1,50,000"},
    {"section": "80EEB", "deductionTowards": "Interest on loan for Electric Vehicle (FY 2019-23)", "deductionLimit": "₹ 1,50,000"},
    {"section": "80G", "deductionTowards": "Donations to prescribed Funds, Charitable Institutions", "deductionLimit": "100% or 50% deduction"},
    {"section": "80GG", "deductionTowards": "Rent paid (where HRA is not part of salary)", "deductionLimit": "Least of specified limits"},
    {"section": "80GGA", "deductionTowards": "Donations for Scientific Research or Rural Development", "deductionLimit": "100% or 50% deduction"},
    {"section": "80GGC", "deductionTowards": "Donations to Political Party or Electoral Trust", "deductionLimit": "-"},
    {"section": "80TTA", "deductionTowards": "Interest on savings account (Non-Senior Citizens)", "deductionLimit": "₹ 10,000"},
    {"section": "80TTB", "deductionTowards": "Interest on deposits (Senior Citizens)", "deductionLimit": "₹ 50,000"},
    {"section": "80U", "deductionTowards": "Taxpayer with Disability", "deductionLimit": "₹ 75,000 (₹ 1,25,000 for Severe Disability)"},
  ];

  DeductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Theme.of(context).primaryColor.withOpacity(0.1),
            Theme.of(context).scaffoldBackgroundColor,
          ],
        ),
      ),
      child: ListView.builder(
        itemCount: deductions.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ExpansionTile(
                title: Text(
                  "Section ${deductions[index]['section']}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                subtitle: Text(
                  deductions[index]['deductionTowards']!,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Deduction Towards:",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          deductions[index]['deductionTowards']!,
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          "Deduction Limit:",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          deductions[index]['deductionLimit']!,
                          style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
