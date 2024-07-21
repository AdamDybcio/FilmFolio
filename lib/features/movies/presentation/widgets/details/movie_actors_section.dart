import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movie_bloc_app/common/styles/styles.dart';
import 'package:movie_bloc_app/core/utils/strings/url_strings.dart';
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
                      padding: const EdgeInsets.all(8),
                      child: SizedBox(
                        width: size.width * 0.25,
                        child: Column(
                          children: [
                            Container(
                              decoration: Styles(context: context).cardBoxDecoration.copyWith(
                                    borderRadius: BorderRadius.circular(size.width * 0.1),
                                  ),
                              child: CircleAvatar(
                                  radius: size.height * 0.05,
                                  backgroundColor: Theme.of(context).colorScheme.primary,
                                  backgroundImage: actor.profilePath.trim() != ''
                                      ? ExtendedNetworkImageProvider(
                                          UrlStrings.imageUrl + actor.profilePath,
                                          cache: true,
                                          printError: false,
                                        )
                                      : null,
                                  child: actor.profilePath.trim() == ''
                                      ? const FittedBox(
                                          fit: BoxFit.fill,
                                          child: FaIcon(
                                            FontAwesomeIcons.solidUser,
                                            color: Colors.white,
                                          ),
                                        )
                                      : null),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: AutoSizeText(
                                actor.name,
                                textAlign: TextAlign.center,
                                maxFontSize: 24,
                                maxLines: 2,
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
