import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_bloc_app/core/utils/strings/url_strings.dart';

import '../../../../../common/styles/styles.dart';
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
        Container(
          height: size.height * 0.2,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ListView.builder(
            itemCount: productionCompanies.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final company = productionCompanies[index];
              return FadeIn(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: size.width * 0.3,
                    decoration: Styles(context: context).cardBoxDecoration,
                    child: Column(
                      children: [
                        Container(
                          decoration: Styles(context: context).cardBoxDecoration.copyWith(color: Colors.white),
                          child: Padding(
                            padding: const EdgeInsets.all(4),
                            child: CachedNetworkImage(
                              imageUrl: UrlStrings.imageUrl + company.logoPath,
                              height: size.height * 0.075,
                              width: size.width * 0.25,
                              errorWidget: (context, url, error) => FadeIn(
                                child: const Icon(
                                  Icons.image_not_supported_rounded,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Padding(
                          padding: const EdgeInsets.all(2),
                          child: AutoSizeText(
                            company.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
