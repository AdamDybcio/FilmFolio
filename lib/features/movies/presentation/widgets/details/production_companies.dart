import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movie_bloc_app/core/utils/strings/api_strings.dart';

import '../../../data/models/movie_details_model.dart';

class ProductionCompanies extends StatelessWidget {
  const ProductionCompanies({super.key, required this.details});

  final MovieDetailsModel details;

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      delay: const Duration(seconds: 1),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.15,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Theme.of(context).colorScheme.primary,
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).colorScheme.secondary,
                offset: const Offset(0, 3),
                blurRadius: 6,
                spreadRadius: 4,
              ),
            ],
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
          child: details.productionCompanies.isNotEmpty
              ? ListView.builder(
                  itemCount: details.productionCompanies.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          //TODO: Add navigation to production company details
                        },
                        child: FadeIn(
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.15,
                            width: MediaQuery.of(context).size.width * 0.4,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Theme.of(context).colorScheme.primary,
                                width: 2,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Theme.of(context).colorScheme.secondary,
                                  offset: const Offset(0, 0),
                                  blurRadius: 6,
                                  spreadRadius: 4,
                                ),
                              ],
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                            ),
                            child: details.productionCompanies[index].logoPath != ''
                                ? Container(
                                    width: MediaQuery.of(context).size.width * 0.4,
                                    height: MediaQuery.of(context).size.height * 0.15,
                                    padding: const EdgeInsets.all(8),
                                    child: CachedNetworkImage(
                                      imageUrl: '${ApiStrings.imageUrl}${details.productionCompanies[index].logoPath}',
                                      fit: BoxFit.scaleDown,
                                    ),
                                  )
                                : Stack(
                                    children: [
                                      Center(
                                        child: FaIcon(
                                          FontAwesomeIcons.film,
                                          size: 50,
                                          color: Theme.of(context).colorScheme.secondary.withOpacity(0.25),
                                        ),
                                      ),
                                      Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(16),
                                          child: Text(
                                            details.productionCompanies[index].name,
                                            maxLines: 3,
                                            overflow: TextOverflow.ellipsis,
                                            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                            textAlign: TextAlign.center,
                                            softWrap: true,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                          ),
                        ),
                      ),
                    );
                  },
                )
              : Center(
                  child: SizedBox(
                    child: Text(
                      'No production companies found.',
                      style: Theme.of(context).textTheme.headlineMedium,
                      overflow: TextOverflow.fade,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      maxLines: 2,
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
