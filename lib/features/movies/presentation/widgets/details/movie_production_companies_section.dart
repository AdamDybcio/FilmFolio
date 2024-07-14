import 'package:flutter/widgets.dart';

import '../../../../../common/widgets/texts/header.dart';
import '../../../data/models/production_company_model.dart';

class MovieProductionCompaniesSection extends StatelessWidget {
  const MovieProductionCompaniesSection({super.key, required this.productionCompanies});

  final List<ProductionCompanyModel> productionCompanies;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(height: size.height * 0.05),
        const Header(title: 'Production Companies'),
      ],
    );
  }
}
