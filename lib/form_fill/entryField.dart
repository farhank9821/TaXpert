import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tax_xpert/MainSection/navigationbarScreen.dart';
import 'package:tax_xpert/Repo/UserCalculationRepo.dart';
import 'package:tax_xpert/Repo/userModelRepo.dart';
import 'package:tax_xpert/model/user_model.dart'; // Adjust import based on actual file location
import 'package:tax_xpert/Home_Screen/home.dart'; // Adjust import based on actual file location
import 'package:intl/intl.dart';
import 'package:tax_xpert/utils/theme.dart';

class TaxDeductionForm extends ConsumerStatefulWidget {
  const TaxDeductionForm({super.key});

  @override
  _TaxDeductionFormState createState() => _TaxDeductionFormState();
}

class _TaxDeductionFormState extends ConsumerState<TaxDeductionForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _salaryIncomeController = TextEditingController(text: "0");
  final TextEditingController _incomeFromInterestController = TextEditingController(text: "0");
  final TextEditingController _rentalIncomeController = TextEditingController(text: "0");
  final TextEditingController _incomeFromOtherSourcesController = TextEditingController(text: "0");

// Deduction Controllers
  final TextEditingController _lifeInsuranceController = TextEditingController(text: "0");
  final TextEditingController _providentFundController = TextEditingController(text: "0");
  final TextEditingController _tuitionFeesController = TextEditingController(text: "0");
  final TextEditingController _annuitiesController = TextEditingController(text: "0");
  final TextEditingController _pensionSchemeController = TextEditingController(text: "0");
  final TextEditingController _additionalPensionSchemeController = TextEditingController(text: "0");
  final TextEditingController _employerPensionContributionController = TextEditingController(text: "0");
  final TextEditingController _agnipathContributionController = TextEditingController(text: "0");
  final TextEditingController _healthInsuranceController = TextEditingController(text: "0");
  final TextEditingController _preventiveCheckupController = TextEditingController(text: "0");
  final TextEditingController _medicalTreatmentController = TextEditingController(text: "0");
  final TextEditingController _educationLoanInterestController = TextEditingController(text: "0");
  final TextEditingController _homeLoanInterestController = TextEditingController(text: "0");
  final TextEditingController _firstTimeHomeBuyerInterestController = TextEditingController(text: "0");
  final TextEditingController _electricVehicleLoanInterestController = TextEditingController(text: "0");
  final TextEditingController _donationsController = TextEditingController(text: "0");
  final TextEditingController _rentPaidController = TextEditingController(text: "0");
  final TextEditingController _scientificResearchDonationsController = TextEditingController(text: "0");
  final TextEditingController _politicalPartyDonationsController = TextEditingController(text: "0");
  final TextEditingController _savingsAccountInterestController = TextEditingController(text: "0");
  final TextEditingController _depositsInterestController = TextEditingController(text: "0");
  final TextEditingController _disabilityDeductionController = TextEditingController(text: "0");

  final TextEditingController _tdsController = TextEditingController(text: "0");
  final TextEditingController _self_assement_Controller = TextEditingController(text: "0");
  final TextEditingController _advance_Tax_Controller = TextEditingController(text: "0");

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

    _tdsController.text = user.tds?.toString() ?? '';
    _self_assement_Controller.text = user.self_assessment_tax?.toString() ?? '';
    _advance_Tax_Controller.text = user.advanceTax?.toString() ?? '';
  }

  @override
  void dispose() {
    // Dispose controllers to prevent memory leaks
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
    _healthInsuranceController.dispose();
    _preventiveCheckupController.dispose();
    _medicalTreatmentController.dispose();
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

    _advance_Tax_Controller.dispose();
    _tdsController.dispose();
    _self_assement_Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(userProvider);
    ref.watch(taxCalculationProvider);
    return Scaffold(
      appBar: AppBar(title: const Text("Tax Deduction Form")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              _buildTextField(_salaryIncomeController, "Gross Income From Salary",
                  (value) => ref.read(userProvider.notifier).updateUser(salary: double.tryParse(value))),
              _buildTextField(_incomeFromInterestController, "Income From Interest",
                  (value) => ref.read(userProvider.notifier).updateUser(incomeFromInterest: double.tryParse(value))),
              _buildTextField(_rentalIncomeController, "Rental Income Received",
                  (value) => ref.read(userProvider.notifier).updateUser(rentalIncome: double.tryParse(value))),
              _buildTextField(_incomeFromOtherSourcesController, "Income From Other Sources",
                  (value) => ref.read(userProvider.notifier).updateUser(incomeFromOtherSources: double.tryParse(value))),
              Text("Under Section 80C Deduction", style: Theme.of(context).textTheme.displayMedium),
              _buildSection(
                context,
                "Life Insurance Premium, Provident Fund, Tuition Fees - 80C",
                "Deduction Limit: ₹ 1,50,000 under Section 80C",
                ["Life Insurance Premium", "Provident Fund", "Tuition Fees"],
                [_lifeInsuranceController, _providentFundController, _tuitionFeesController],
                [
                  (value) => ref.read(userProvider.notifier).updateUser(lifeInsurance: double.tryParse(value)),
                  (value) => ref.read(userProvider.notifier).updateUser(providentFund: double.tryParse(value)),
                  (value) => ref.read(userProvider.notifier).updateUser(tuitionFees: double.tryParse(value))
                ],
              ),
              _buildSection(
                context,
                "Annuity Plan of LIC or Other Insurer - Section 80CCC",
                "Deduction for annuity plans.",
                ["Contribution to Annuity Plan"],
                [_annuitiesController],
                [(value) => ref.read(userProvider.notifier).updateUser(annuities: double.tryParse(value))],
              ),
              _buildSection(
                context,
                "Pension Scheme of Central Government - Section 80CCD(1)",
                "Contribution to NPS. Deduction Limit: ₹1,50,000",
                ["Contribution to Pension Scheme"],
                [_pensionSchemeController],
                [(value) => ref.read(userProvider.notifier).updateUser(pensionScheme: double.tryParse(value))],
              ),
              _buildSection(
                context,
                "Section 80CCD(1B)",
                "Additional Contribution to NPS. Deduction Limit: ₹ 50,000",
                ["Additional Contribution to Pension Scheme"],
                [_additionalPensionSchemeController],
                [(value) => ref.read(userProvider.notifier).updateUser(additionalPensionScheme: double.tryParse(value))],
              ),
              _buildSection(
                context,
                "Section 80CCD(2)",
                "Employer Contribution to Pension Scheme. Deduction Limit: 10% or 14% of salary",
                ["Employer Contribution to Pension Scheme"],
                [_employerPensionContributionController],
                [(value) => ref.read(userProvider.notifier).updateUser(employerPensionContribution: double.tryParse(value))],
              ),
              _buildSection(
                context,
                "Section 80CCH",
                "Contribution to Agnipath Scheme.",
                ["Contribution to Agnipath Scheme"],
                [_agnipathContributionController],
                [(value) => ref.read(userProvider.notifier).updateUser(agnipathContribution: double.tryParse(value))],
              ),
              Text("Under Section 80D Deduction", style: Theme.of(context).textTheme.displayMedium),
              _buildSection(
                context,
                "Health Insurance Premium - Section 80D",
                "Deduction for health insurance premiums paid for self, spouse, children, and parents.",
                ["Health Insurance Premium", "Preventive Health Checkup"],
                [_healthInsuranceController, _preventiveCheckupController],
                [
                  (value) => ref.read(userProvider.notifier).updateUser(healthInsurance: double.tryParse(value)),
                  (value) => ref.read(userProvider.notifier).updateUser(preventiveCheckup: double.tryParse(value))
                ],
              ),
              _buildSection(
                context,
                "Medical Treatment - Section 80DDB",
                "Deduction for medical treatment of specified diseases. Deduction Limit: ₹ 40,000 or ₹ 1,00,000 for senior citizens",
                ["Medical Treatment"],
                [_medicalTreatmentController],
                [(value) => ref.read(userProvider.notifier).updateUser(medicalTreatment: double.tryParse(value))],
              ),
              _buildSection(
                context,
                "Education Loan Interest - Section 80E",
                "Deduction for interest on education loan. No maximum limit on the amount.",
                ["Education Loan Interest"],
                [_educationLoanInterestController],
                [(value) => ref.read(userProvider.notifier).updateUser(educationLoanInterest: double.tryParse(value))],
              ),
              _buildSection(
                context,
                "Home Loan Interest - Section 24(b)",
                "Deduction for interest on home loan. Deduction Limit: ₹ 2,00,000",
                ["Interest on Home Loan"],
                [_homeLoanInterestController],
                [(value) => ref.read(userProvider.notifier).updateUser(homeLoanInterest: double.tryParse(value))],
              ),
              _buildSection(
                context,
                "First-Time Home Buyer - Section 80EE",
                "Additional deduction for interest on home loan for first-time home buyers. Deduction Limit: ₹ 50,000",
                ["Interest on Home Loan (First-Time Buyer)"],
                [_firstTimeHomeBuyerInterestController],
                [(value) => ref.read(userProvider.notifier).updateUser(firstTimeHomeBuyerInterest: double.tryParse(value))],
              ),
              _buildSection(
                context,
                "Electric Vehicle Loan Interest - Section 80EEB",
                "Deduction for interest on loan for electric vehicle purchase. Deduction Limit: ₹ 1,50,000",
                ["Interest on Electric Vehicle Loan"],
                [_electricVehicleLoanInterestController],
                [(value) => ref.read(userProvider.notifier).updateUser(electricVehicleLoanInterest: double.tryParse(value))],
              ),
              _buildSection(
                context,
                "Donations - Section 80G",
                "Deduction for donations to charitable institutions. Deduction limit varies based on the institution.",
                ["Donations"],
                [_donationsController],
                [(value) => ref.read(userProvider.notifier).updateUser(donations: double.tryParse(value))],
              ),
              _buildSection(
                context,
                "Rent Paid - Section 80GG",
                "Deduction for rent paid by self-employed individuals. Deduction Limit: ₹ 5,000 per month",
                ["Rent Paid - Per Month"],
                [_rentPaidController],
                [(value) => ref.read(userProvider.notifier).updateUser(rentPaid: double.tryParse(value))],
              ),
              _buildSection(
                context,
                "Scientific Research Donations - Section 35(1)(ii)",
                "Deduction for donations to institutions engaged in scientific research.",
                ["Scientific Research Donations"],
                [_scientificResearchDonationsController],
                [(value) => ref.read(userProvider.notifier).updateUser(scientificResearchDonations: double.tryParse(value))],
              ),
              _buildSection(
                context,
                "Political Party Donations - Section 80GGC",
                "Deduction for donations to political parties.",
                ["Political Party Donations"],
                [_politicalPartyDonationsController],
                [(value) => ref.read(userProvider.notifier).updateUser(politicalPartyDonations: double.tryParse(value))],
              ),
              _buildSection(
                context,
                "Savings Account Interest - Section 80TTA",
                "Deduction for interest earned on savings accounts. Deduction Limit: ₹ 10,000",
                ["Interest on Savings Account"],
                [_savingsAccountInterestController],
                [(value) => ref.read(userProvider.notifier).updateUser(savingsAccountInterest: double.tryParse(value))],
              ),
              _buildSection(
                context,
                "Deposits Interest - Section 80TTB",
                "Deduction for interest earned on deposits for senior citizens. Deduction Limit: ₹ 50,000",
                ["Interest on Deposits"],
                [_depositsInterestController],
                [(value) => ref.read(userProvider.notifier).updateUser(depositsInterest: double.tryParse(value))],
              ),
              _buildSection(
                context,
                "Disability Deduction - Section 80U",
                "Deduction for individuals with disabilities. Deduction Limit: ₹ 75,000 or ₹ 1,25,000 for severe disability.",
                ["Disability Deduction"],
                [_disabilityDeductionController],
                [(value) => ref.read(userProvider.notifier).updateUser(disabilityDeduction: double.tryParse(value))],
              ),
              Text("Tax Paid", style: Theme.of(context).textTheme.displayMedium),
              _buildSection(
                context,
                "TDS - Tax Deducted at Source",
                "A portion of your income that is directly deducted by the payer (e.g., employer, bank, etc.) at the time of payment.\nHow it works: The payer deducts the TDS based on the specified tax rates and submits it to the government",
                ["TDS-Tax Deducted at Source"],
                [_tdsController],
                [
                  (value) => ref.read(userProvider.notifier).updateUser(tds: double.tryParse(value)),
                ],
              ),
              _buildSection(
                context,
                "Advance Tax",
                "Tax paid in advance throughout the financial year by individuals and businesses with an estimated annual income tax liability exceeding ₹10,000.\n How it works: The taxpayer estimates their annual income and pays the tax in quarterly installmentst",
                ["Advance Tax"],
                [_advance_Tax_Controller],
                [
                  (value) => ref.read(userProvider.notifier).updateUser(advanceTax: double.tryParse(value)),
                ],
              ),
              _buildSection(
                context,
                "Self-Assessment Tax",
                "The remaining tax liability after considering TDS and advance tax payments.\nHow it works: If the total TDS and advance tax paid is less than the actual tax liability, the taxpayer must pay the difference as self-assessment tax.",
                ["Self-Assessment Tax"],
                [_self_assement_Controller],
                [
                  (value) => ref.read(userProvider.notifier).updateUser(self_assessment_tax: double.tryParse(value)),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary, // Change this to your desired color
                ),
                onPressed: _handleSubmit,
                child: Text("Submit", style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Theme.of(context).colorScheme.surface)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, Function(String) onChange) {
    var theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        onChanged: (value) {
          String parsedValue = value.replaceAll(',', '');
          parsedValue = parsedValue.isEmpty ? '0' : parsedValue;

          double? numericValue = double.tryParse(parsedValue);
          if (numericValue != null) {
            String formattedValue = NumberFormat('#,##,##0').format(numericValue);
            controller.value = TextEditingValue(
              text: formattedValue,
              selection: TextSelection.collapsed(offset: formattedValue.length),
            );
          }

          onChange(parsedValue);

          ref.read(taxCalculationProvider.notifier).calculateTax(ref.read(userProvider), ref);
        },
        decoration: InputDecoration(
          labelText: label,
          labelStyle: theme.textTheme.titleSmall!.copyWith(color: theme.colorScheme.primary),
          filled: true,
          fillColor: Colors.transparent,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(color: theme.colorScheme.primaryContainer, width: 2.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: const BorderSide(color: Colors.grey, width: 1.0),
          ),
        ),
        style: theme.textTheme.bodyMedium,
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'[0-9,]')),
        ],
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter a number';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildSection(
    BuildContext context,
    String title,
    String description,
    List<String> labels,
    List<TextEditingController> controllers,
    List<void Function(String)> onChangeFunctions,
  ) {
    var theme = Theme.of(context);
    return ExpansionTile(
      title: Row(
        children: [
          Expanded(
              child: Text(
            title,
            style: theme.textTheme.bodyLarge,
          )),
          IconButton(
            color: theme.colorScheme.onPrimary,
            icon: const Icon(Icons.info_outline),
            tooltip: description,
            onPressed: () {
              showDialog(
                barrierDismissible: true,
                barrierColor: theme.colorScheme.surface.withOpacity(0.8),
                context: context,
                builder: (context) {
                  return AlertDialog(
                    elevation: 10,
                    backgroundColor: theme.colorScheme.onTertiary.withOpacity(0.8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          title,
                          style: theme.textTheme.bodyLarge!.copyWith(color: theme.colorScheme.onSurface),
                        ),
                        const SizedBox(height: 16), // Add some spacing
                        Text(
                          description,
                          style: theme.textTheme.displaySmall!.copyWith(color: theme.colorScheme.primary, fontSize: 18),
                        ),
                      ],
                    ),
                    actions: [
                      TextButton(
                        child: const Text("Close"),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                    // Add a blur effect when clicking the background
                  );
                },
              );
            },
          ),
        ],
      ),
      children: List.generate(
        labels.length,
        (index) => _buildTextField(
          controllers[index],
          labels[index],
          onChangeFunctions[index],
        ),
      ),
    );
  }

  void _handleSubmit() {
    if (_formKey.currentState?.validate() ?? false) {
      final user = ref.read(userProvider.notifier);
      final taxCalculator = ref.read(taxCalculationProvider.notifier);

      // Update user model with form data using copyWith
      user.updateUser(
        salary: double.tryParse(_salaryIncomeController.text),
        incomeFromInterest: double.tryParse(_incomeFromInterestController.text),
        rentalIncome: double.tryParse(_rentalIncomeController.text),
        incomeFromOtherSources: double.tryParse(_incomeFromOtherSourcesController.text),
        lifeInsurance: double.tryParse(_lifeInsuranceController.text),
        providentFund: double.tryParse(_providentFundController.text),
        tuitionFees: double.tryParse(_tuitionFeesController.text),
        annuities: double.tryParse(_annuitiesController.text),
        pensionScheme: double.tryParse(_pensionSchemeController.text),
        additionalPensionScheme: double.tryParse(_additionalPensionSchemeController.text),
        employerPensionContribution: double.tryParse(_employerPensionContributionController.text),
        agnipathContribution: double.tryParse(_agnipathContributionController.text),
        healthInsurance: double.tryParse(_healthInsuranceController.text),
        preventiveCheckup: double.tryParse(_preventiveCheckupController.text),
        medicalTreatment: double.tryParse(_medicalTreatmentController.text),
        educationLoanInterest: double.tryParse(_educationLoanInterestController.text),
        homeLoanInterest: double.tryParse(_homeLoanInterestController.text),
        firstTimeHomeBuyerInterest: double.tryParse(_firstTimeHomeBuyerInterestController.text),
        electricVehicleLoanInterest: double.tryParse(_electricVehicleLoanInterestController.text),
        donations: double.tryParse(_donationsController.text),
        rentPaid: double.tryParse(_rentPaidController.text),
        scientificResearchDonations: double.tryParse(_scientificResearchDonationsController.text),
        politicalPartyDonations: double.tryParse(_politicalPartyDonationsController.text),
        savingsAccountInterest: double.tryParse(_savingsAccountInterestController.text),
        depositsInterest: double.tryParse(_depositsInterestController.text),
        disabilityDeduction: double.tryParse(_disabilityDeductionController.text),
        tds: double.tryParse(_tdsController.text),
        advanceTax: double.tryParse(_advance_Tax_Controller.text),
        self_assessment_tax: double.tryParse(_self_assement_Controller.text),
      );
      taxCalculator.calculateTax(ref.read(userProvider), ref);

      // Navigate to the next screen or show a confirmation
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const BottomNavigationScreen()), // Adjust based on actual target screen
      );
    }
  }
}

class NumberInputFormatter extends TextInputFormatter {
  final NumberFormat numberFormat = NumberFormat("#,##0");

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty || double.tryParse(newValue.text.replaceAll(',', '')) == null) {
      return oldValue;
    }

    double value = double.parse(newValue.text.replaceAll(',', ''));

    String formattedValue = numberFormat.format(value);

    int cursorPosition = formattedValue.length - (newValue.text.length - newValue.selection.baseOffset);

    return TextEditingValue(
      text: formattedValue,
      selection: TextSelection.collapsed(offset: cursorPosition),
    );
  }
}
