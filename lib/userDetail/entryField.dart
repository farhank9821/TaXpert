import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tax_xpert/MainSection/Screens/salaryNincome.dart';
import 'package:tax_xpert/homeMainTry.dart';
import 'package:tax_xpert/model/user_model.dart';
import 'package:tax_xpert/userDetail/calculation.dart';

class TaxDeductionForm extends ConsumerStatefulWidget {
  const TaxDeductionForm({super.key});

  @override
  _TaxDeductionFormState createState() => _TaxDeductionFormState();
}

class _TaxDeductionFormState extends ConsumerState<TaxDeductionForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // Define controllers for each text field
  final TextEditingController _salaryIncomeController = TextEditingController();

  final TextEditingController _incomeFromInterestController = TextEditingController();
  final TextEditingController _rentalIncomeController = TextEditingController();
  final TextEditingController _incomeFromOtherSourcesController = TextEditingController();
  // Controllers for deduction sections
  final TextEditingController _lifeInsuranceController = TextEditingController();
  final TextEditingController _providentFundController = TextEditingController();
  final TextEditingController _tuitionFeesController = TextEditingController();
  final TextEditingController _annuitiesController = TextEditingController();
  final TextEditingController _pensionSchemeController = TextEditingController();
  final TextEditingController _additionalPensionSchemeController = TextEditingController();
  final TextEditingController _employerPensionContributionController = TextEditingController();
  final TextEditingController _agnipathContributionController = TextEditingController();
  final TextEditingController _healthInsuranceController = TextEditingController();
  final TextEditingController _preventiveCheckupController = TextEditingController();
  final TextEditingController _medicalTreatmentController = TextEditingController();
  final TextEditingController _educationLoanInterestController = TextEditingController();
  final TextEditingController _homeLoanInterestController = TextEditingController();
  final TextEditingController _firstTimeHomeBuyerInterestController = TextEditingController();
  final TextEditingController _electricVehicleLoanInterestController = TextEditingController();
  final TextEditingController _donationsController = TextEditingController();
  final TextEditingController _rentPaidController = TextEditingController();
  final TextEditingController _scientificResearchDonationsController = TextEditingController();
  final TextEditingController _politicalPartyDonationsController = TextEditingController();
  final TextEditingController _savingsAccountInterestController = TextEditingController();
  final TextEditingController _depositsInterestController = TextEditingController();
  final TextEditingController _disabilityDeductionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final user = UserModel();
    initializeControllers(user);
  }

  void initializeControllers(UserModel user) {
    _salaryIncomeController.text = user.salary?.toString() ?? '';
    _incomeFromInterestController.text = user.incomeFromInterest?.toString() ?? '';
    _rentalIncomeController.text = user.rentalIncome?.toString() ?? '';
    _incomeFromOtherSourcesController.text = user.incomeFromOtherSources?.toString() ?? '';

    _lifeInsuranceController.text = user.lifeInsurance?.toString() ?? '';
    _providentFundController.text = user.providentFund?.toString() ?? '';
    _tuitionFeesController.text = user.tuitionFees?.toString() ?? '';
    _annuitiesController.text = user.annuities?.toString() ?? '';
    _pensionSchemeController.text = user.pensionScheme?.toString() ?? '';
    _additionalPensionSchemeController.text = user.additionalPensionScheme?.toString() ?? '';
    _employerPensionContributionController.text = user.employerPensionContribution?.toString() ?? '';
    _agnipathContributionController.text = user.agnipathContribution?.toString() ?? '';
    _healthInsuranceController.text = user.healthInsurance?.toString() ?? '';
    _preventiveCheckupController.text = user.preventiveCheckup?.toString() ?? '';
    _medicalTreatmentController.text = user.medicalTreatment?.toString() ?? '';
    _educationLoanInterestController.text = user.educationLoanInterest?.toString() ?? '';
    _homeLoanInterestController.text = user.homeLoanInterest?.toString() ?? '';
    _firstTimeHomeBuyerInterestController.text = user.firstTimeHomeBuyerInterest?.toString() ?? '';
    _electricVehicleLoanInterestController.text = user.electricVehicleLoanInterest?.toString() ?? '';
    _donationsController.text = user.donations?.toString() ?? '';
    _rentPaidController.text = user.rentPaid?.toString() ?? '';
    _scientificResearchDonationsController.text = user.scientificResearchDonations?.toString() ?? '';
    _politicalPartyDonationsController.text = user.politicalPartyDonations?.toString() ?? '';
    _savingsAccountInterestController.text = user.savingsAccountInterest?.toString() ?? '';
    _depositsInterestController.text = user.depositsInterest?.toString() ?? '';
    _disabilityDeductionController.text = user.disabilityDeduction?.toString() ?? '';
  }

  void updateUserModel(UserModel user) {
    user.salary = double.tryParse(_salaryIncomeController.text);
    user.incomeFromInterest = double.tryParse(_incomeFromInterestController.text);
    user.rentalIncome = double.tryParse(_rentalIncomeController.text);
    user.incomeFromOtherSources = double.tryParse(_incomeFromOtherSourcesController.text);

    user.lifeInsurance = double.tryParse(_lifeInsuranceController.text);
    user.providentFund = double.tryParse(_providentFundController.text);
    user.tuitionFees = double.tryParse(_tuitionFeesController.text);
    user.annuities = double.tryParse(_annuitiesController.text);
    user.pensionScheme = double.tryParse(_pensionSchemeController.text);
    user.additionalPensionScheme = double.tryParse(_additionalPensionSchemeController.text);
    user.employerPensionContribution = double.tryParse(_employerPensionContributionController.text);
    user.agnipathContribution = double.tryParse(_agnipathContributionController.text);
    user.healthInsurance = double.tryParse(_healthInsuranceController.text);
    user.preventiveCheckup = double.tryParse(_preventiveCheckupController.text);
    user.medicalTreatment = double.tryParse(_medicalTreatmentController.text);
    user.educationLoanInterest = double.tryParse(_educationLoanInterestController.text);
    user.homeLoanInterest = double.tryParse(_homeLoanInterestController.text);
    user.firstTimeHomeBuyerInterest = double.tryParse(_firstTimeHomeBuyerInterestController.text);
    user.electricVehicleLoanInterest = double.tryParse(_electricVehicleLoanInterestController.text);
    user.donations = double.tryParse(_donationsController.text);
    user.rentPaid = double.tryParse(_rentPaidController.text);
    user.scientificResearchDonations = double.tryParse(_scientificResearchDonationsController.text);
    user.politicalPartyDonations = double.tryParse(_politicalPartyDonationsController.text);
    user.savingsAccountInterest = double.tryParse(_savingsAccountInterestController.text);
    user.depositsInterest = double.tryParse(_depositsInterestController.text);
    user.disabilityDeduction = double.tryParse(_disabilityDeductionController.text);
  }

  @override
  void dispose() {
    // Dispose controllers when the widget is removed from the widget tree
    _salaryIncomeController.dispose();
    _incomeFromInterestController.dispose();
    _rentalIncomeController.dispose();
    _incomeFromOtherSourcesController.dispose();
    _lifeInsuranceController.dispose();
    _providentFundController.dispose();
    _tuitionFeesController.dispose();
    _annuitiesController.dispose();
    _pensionSchemeController.dispose();
    _additionalPensionSchemeController.dispose();
    _employerPensionContributionController.dispose();
    _agnipathContributionController.dispose();

    //--80D
    _healthInsuranceController.dispose();
    _preventiveCheckupController.dispose();
    _medicalTreatmentController.dispose();
    //--80E
    _educationLoanInterestController.dispose();
    _homeLoanInterestController.dispose();
    _firstTimeHomeBuyerInterestController.dispose();
    _electricVehicleLoanInterestController.dispose();
    _donationsController.dispose();
    _rentPaidController.dispose();
    _scientificResearchDonationsController.dispose();
    _politicalPartyDonationsController.dispose();
    _savingsAccountInterestController.dispose();
    _depositsInterestController.dispose();
    _disabilityDeductionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tax Deduction Form")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _salaryIncomeController,
                decoration: const InputDecoration(
                  labelText: "Gross Income From Salary",
                ),
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                controller: _incomeFromInterestController,
                decoration: const InputDecoration(
                  labelText: "Income From Interest",
                ),
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                controller: _rentalIncomeController,
                decoration: const InputDecoration(
                  labelText: "Rental Income Received",
                ),
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                controller: _incomeFromOtherSourcesController,
                decoration: const InputDecoration(
                  labelText: "Income From Other Sources",
                ),
                keyboardType: TextInputType.number,
              ),
              const Text(
                "Under Section 80C Deduction",
                style: TextStyle(fontSize: 50),
              ),
              _buildSection(
                context,
                "Life Insurance Premium, Provident Fund, Tuition Fees - 80C",
                "Life Insurance Premium, Provident Fund, Tuition Fees, etc. Deduction Limit: ₹ 1,50,000 under Section 80C",
                [
                  "Life Insurance Premium",
                  "Provident Fund",
                  "Tuition Fees",
                ],
                [
                  _lifeInsuranceController,
                  _providentFundController,
                  _tuitionFeesController,
                ],
              ),
              _buildSection(
                context,
                "Annuity plan of LIC or other insurer - Section 80CCC",
                "Example:- Annuity plan: You invest a lump sum (or regular payments) with an insurer. In return, you receive regular income (like a pension) for a fixed period or your lifetime. It's like trading your money for a guaranteed income stream.",
                [
                  "Contribution to Annuity Plan",
                ],
                [
                  _annuitiesController,
                ],
              ),
              _buildSection(
                context,
                "Pension Scheme of Central Government - Section 80CCD(1)",
                "You contribute ₹1,50,000 to the National Pension System (NPS). This amount can be claimed as a tax deduction under Section 80CCD(1) of the Income Tax Act. NPS is a government-backed retirement savings scheme that offers tax benefits and pension income after retirement.",
                [
                  "Contribution to Pension Scheme",
                ],
                [
                  _pensionSchemeController,
                ],
              ),
              _buildSection(
                context,
                "Section 80CCD(1B)",
                "Pension Scheme of Central Government (additional). Deduction Limit: ₹ 50,000",
                [
                  "Additional Contribution to Pension Scheme",
                ],
                [
                  _additionalPensionSchemeController,
                ],
              ),
              _buildSection(
                context,
                "Section 80CCD(2)",
                "Employer contribution to Pension Scheme. Deduction Limit: 10% or 14% of salary",
                [
                  "Employer Contribution to Pension Scheme",
                ],
                [
                  _employerPensionContributionController,
                ],
              ),
              _buildSection(
                context,
                "Section 80CCH",
                "Contribution to Agnipath Scheme.",
                [
                  "Contribution to Agnipath Scheme",
                ],
                [
                  _agnipathContributionController,
                ],
              ),
              const Text(
                "Under Section 80D Deduction",
                style: TextStyle(fontSize: 50),
              ),
              _buildSection(
                context,
                "Health Insurance Premium - Section 80D",
                "Deduction towards payments made towards Medical treatment of Self or Dependant for specified diseases. Health Insurance Premium. Deduction Limit: ₹ 25,000 (₹ 50,000 for Senior Citizens) \nPreventive Health Check-up deduction limit - ₹ 5000",
                [
                  "Health Insurance Premium",
                  "Preventive Health Check-up",
                ],
                [
                  _healthInsuranceController,
                  _preventiveCheckupController,
                ],
              ),
              _buildSection(
                context,
                "Medical Treatment Expenses - Section 80DDB",
                "Medical treatment of specified diseases. Deduction Limit: ₹ 40,000 (₹ 1,00,000 for Senior Citizens)",
                [
                  "Medical Treatment Expenses",
                ],
                [
                  _medicalTreatmentController,
                ],
              ),
              const Text(
                "Other Deduction",
                style: TextStyle(fontSize: 50),
              ),
              _buildSection(
                context,
                "Interest on Education Loan - Section 80E",
                "Interest on loan for higher education. Deduction Limit: Total amount paid",
                [
                  "Interest on Education Loan",
                ],
                [
                  _educationLoanInterestController,
                ],
              ),
              _buildSection(
                context,
                "Interest on Home Loan - Section 80EE",
                "Interest on loan for residential house (FY 2016-17). Deduction Limit: ₹ 50,000",
                [
                  "Interest on Home Loan (FY 2016-17)",
                ],
                [
                  _homeLoanInterestController,
                ],
              ),
              _buildSection(
                context,
                "Interest on loan for first-time home buyers - Section 80EEA",
                "Interest on loan for first-time home buyers (FY 2019-22). Deduction Limit: ₹ 1,50,000",
                [
                  "Interest on Home Loan (FY 2019-22)",
                ],
                [
                  _firstTimeHomeBuyerInterestController,
                ],
              ),
              _buildSection(
                context,
                "Interest on loan for Electric Vehicle - Section 80EEB",
                "Interest on loan for Electric Vehicle (FY 2019-23). Deduction Limit: ₹ 1,50,000",
                [
                  "Interest on Electric Vehicle Loan",
                ],
                [
                  _electricVehicleLoanInterestController,
                ],
              ),
              _buildSection(
                context,
                "Donations to Charitable Institutions - Section 80G",
                "Donations to prescribed Funds, Charitable Institutions. Deduction Limit: 100% or 50% deduction",
                [
                  "Donations to Charitable Institutions",
                ],
                [
                  _donationsController,
                ],
              ),
              _buildSection(
                context,
                "Rent - Section 80GG",
                "Rent paid (where HRA is not part of salary). Deduction Limit: Least of specified limits",
                [
                  "Rent Paid",
                ],
                [
                  _rentPaidController,
                ],
              ),
              _buildSection(
                context,
                "Donations for Rural Development - Section 80GGA",
                "Donations for Scientific Research or Rural Development. Deduction Limit: 100% or 50% deduction",
                [
                  "Donations for Scientific Research",
                  "Donations for Rural Development",
                ],
                [
                  _scientificResearchDonationsController,
                ],
              ),
              _buildSection(
                context,
                "Donations to Political Party - Section 80GGC",
                "Donations to Political Party or Electoral Trust.",
                [
                  "Donations to Political Party",
                ],
                [
                  _politicalPartyDonationsController,
                ],
              ),
              _buildSection(
                context,
                "Interest on Savings Account - Section 80TTA",
                "Interest on savings account (Non-Senior Citizens). Deduction Limit: ₹ 10,000",
                [
                  "Interest on Savings Account",
                ],
                [
                  _savingsAccountInterestController,
                ],
              ),
              _buildSection(
                context,
                "Interest on Deposits - Section 80TTB",
                "Interest on deposits (Senior Citizens). Deduction Limit: ₹ 50,000",
                [
                  "Interest on Deposits",
                ],
                [
                  _depositsInterestController,
                ],
              ),
              _buildSection(
                context,
                "Disability Deduction - Section 80U",
                "Taxpayer with Disability. Deduction Limit: ₹ 75,000 (₹ 1,25,000 for Severe Disability)",
                [
                  "Disability Deduction",
                ],
                [
                  _disabilityDeductionController,
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    final user = UserModel();
                    updateUserModel(user);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreenTry(),
                      ),
                    );
                  }
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection(BuildContext context, String sectionTitle, String description, List<String> fields, List<TextEditingController> controllers) {
    if (fields.length != controllers.length) {
      return Container(); // Return an empty container or an error message
    }

    return ExpansionTile(
      title: Row(
        children: [
          Expanded(child: Text(sectionTitle)),
          IconButton(
            icon: const Icon(Icons.info_outline),
            tooltip: description,
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text(sectionTitle),
                    content: Text(description),
                    actions: [
                      TextButton(
                        child: const Text("Close"),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      children: List.generate(fields.length, (index) {
        return TextFormField(
          controller: controllers[index],
          decoration: InputDecoration(
            labelText: fields[index],
          ),
          keyboardType: TextInputType.number,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your';
            }
            return null;
          },
        );
      }),
    );
  }
}
