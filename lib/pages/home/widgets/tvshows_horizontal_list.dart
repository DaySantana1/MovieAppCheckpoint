import 'package:flutter/material.dart';
import 'package:movie_app/models/tvshow_model.dart';
import 'package:movie_app/pages/home/widgets/tvshows_horizontal_item.dart';

class TvShowsHorizontalList extends StatelessWidget {
  final List<TvShow> tvShows;
  const TvShowsHorizontalList({super.key, required this.tvShows});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 28, vertical: 10),
      height: 230,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: tvShows.length,
        itemBuilder: (context, index) {
          return TvShowHorizontalItem(tvShow: tvShows[index]);
        },
      ),
    );
  }
}
