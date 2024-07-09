import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movie_bloc_app/core/utils/strings/api_strings.dart';
import 'package:movie_bloc_app/features/movies/data/models/movie_details_model.dart';

class MovieCast extends StatelessWidget {
  const MovieCast({super.key, required this.details});

  final MovieDetailsModel details;

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      delay: const Duration(seconds: 1),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.35,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Theme.of(context).colorScheme.primary,
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).colorScheme.primary,
                offset: const Offset(0, 3),
                blurRadius: 6,
                spreadRadius: 4,
              ),
            ],
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
          child: details.actors.isNotEmpty
              ? ListView.builder(
                  itemCount: details.actors.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    return Padding(
                      padding: const EdgeInsets.all(16),
                      child: GestureDetector(
                        onTap: () {
                          //TODO: Add navigation to actor details
                        },
                        child: FadeIn(
                          child: Card(
                            elevation: 10,
                            shadowColor: Theme.of(context).colorScheme.primary,
                            color: Theme.of(context).scaffoldBackgroundColor,
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.35,
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: Column(
                                children: [
                                  Container(
                                    height: MediaQuery.of(context).size.height * 0.2,
                                    width: MediaQuery.of(context).size.width * 0.3,
                                    decoration: BoxDecoration(
                                      image: details.actors[index].profilePath != ''
                                          ? DecorationImage(
                                              image: CachedNetworkImageProvider(ApiStrings.imageUrl + details.actors[index].profilePath),
                                              fit: BoxFit.cover,
                                            )
                                          : null,
                                      border: Border.all(
                                        color: Theme.of(context).colorScheme.primary,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(15),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Theme.of(context).colorScheme.primary,
                                          offset: const Offset(0, 3),
                                          blurRadius: 3,
                                          spreadRadius: 2,
                                        ),
                                      ],
                                      color: Theme.of(context).scaffoldBackgroundColor,
                                    ),
                                    child: details.actors[index].profilePath != ''
                                        ? null
                                        : Center(
                                            child: FaIcon(FontAwesomeIcons.solidUser, color: Theme.of(context).colorScheme.primary, size: 50),
                                          ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Text(
                                      details.actors[index].name,
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
                                      maxLines: 2,
                                      softWrap: true,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
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
                      'No cast found.',
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
