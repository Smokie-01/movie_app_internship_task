import 'package:flutter/material.dart';
import 'package:movie_app_task/model/movie_model.dart';
import 'package:movie_app_task/screens/detailed_screen.dart';
import 'package:movie_app_task/services/movie_api_service.dart';
import 'package:movie_app_task/widgets/movie_widget.dart';

import '../search_screen.dart';

class HomeScreenTab extends StatefulWidget {
  const HomeScreenTab({super.key});

  @override
  State<HomeScreenTab> createState() => _HomeScreenTabState();
}

class _HomeScreenTabState extends State<HomeScreenTab> {
  MovieApiService movieApiService = MovieApiService();
  List<MovieModel> movies = [];

  getAllmovies() async {
    movies = await movieApiService.getMovies();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getAllmovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text('Home Screen'),
          actions: [
            IconButton(
              icon: const Icon(Icons.search, color: Colors.red),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const SearchScreenTab(),
                  ),
                );
              },
            ),
          ],
        ),
        body: movies.isEmpty
            ? const Center(
                child: Text("data Loading"),
              )
            : Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemBuilder: ((context, index) {
                        var singleMovie = movies[index].show;
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    MovieDetailScreen(movie: movies[index])));
                          },
                          child: MovieWidget(
                              imageUrl: singleMovie?.image?.medium?.toString(),
                              title: singleMovie?.name.toString(),
                              summary: singleMovie?.summary.toString()),
                        );
                      }),
                      itemCount: movies.length,
                    ),
                  ),
                ],
              ));
  }
}
