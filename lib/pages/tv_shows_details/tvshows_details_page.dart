import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movie_app/common/utils.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/models/tvshowsdetails_model.dart';
import 'package:movie_app/services/api_services.dart';

class TvShowDetailsPage extends StatefulWidget {
  final int tvShowid;
  const TvShowDetailsPage({super.key, required this.tvShowid});

  @override
  State<TvShowDetailsPage> createState() => _TvShowDetailsPageState();
}

class _TvShowDetailsPageState extends State<TvShowDetailsPage> {
  ApiServices apiServices = ApiServices();

  late Future<TvShowDetails> tvShowDetail;
  late Future<Result> movieRecommendationModel;

  @override
  void initState() {
    fetchInitialData();
    super.initState();
  }

  fetchInitialData() {
    tvShowDetail = apiServices.getTvShowDetails(widget.tvShowid);
    movieRecommendationModel =
        apiServices.getMovieRecommendations(widget.tvShowid);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: tvShowDetail,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final tvShow = snapshot.data;

              String genresText =
                  tvShow!.genres.map((genre) => genre.name).join(', ');

              return Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: size.height * 0.4,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    "$imageUrl${tvShow.posterPath}"),
                                fit: BoxFit.cover)),
                        child: SafeArea(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.arrow_back_ios,
                                    color: Colors.white),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 25, left: 10, right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tvShow.name,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            Text(
                              DateFormat('dd-MM-yyyy')
                                  .format(tvShow.firstAirDate!)
                                  .toString(),
                              style: const TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            Text(
                              genresText,
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 17,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          tvShow.overview,
                          maxLines: 6,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
