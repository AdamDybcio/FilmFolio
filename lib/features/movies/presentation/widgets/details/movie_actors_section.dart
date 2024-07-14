import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movie_bloc_app/common/styles/styles.dart';
import 'package:movie_bloc_app/core/utils/strings/api_strings.dart';
import 'package:movie_bloc_app/features/movies/data/models/actor_model.dart';

import '../../../../../common/widgets/texts/header.dart';

class MovieActorsSection extends StatelessWidget {
  const MovieActorsSection({super.key, required this.actors});

  final List<ActorModel> actors;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(height: size.height * 0.05),
        const Header(title: 'Cast'),
        SizedBox(
          height: size.height * 0.2,
          child: Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: actors.length,
                itemBuilder: (context, index) {
                  final actor = actors[index];
                  return FadeIn(
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: SizedBox(
                        width: size.width * 0.3,
                        child: Column(
                          children: [
                            Container(
                              decoration: Styles(context: context).cardBoxDecoration.copyWith(
                                    borderRadius: BorderRadius.circular(size.width * 0.1),
                                  ),
                              child: GestureDetector(
                                onTap: () {
                                  //TODO: Add navigation to actor details
                                },
                                child: CircleAvatar(
                                    radius: size.width * 0.1,
                                    backgroundColor: Theme.of(context).colorScheme.primary,
                                    backgroundImage: actor.profilePath != '' ? CachedNetworkImageProvider(ApiStrings.imageUrl + actor.profilePath) : null,
                                    child: actor.profilePath == ''
                                        ? const FittedBox(
                                            fit: BoxFit.fill,
                                            child: FaIcon(
                                              FontAwesomeIcons.solidUser,
                                            ),
                                          )
                                        : null),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Text(
                                actor.name,
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
          ),
        ),
      ],
    );
  }
}
