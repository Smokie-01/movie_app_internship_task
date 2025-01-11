import 'package:flutter/material.dart';
import 'package:movie_app_task/constants/constants.dart';
import 'package:movie_app_task/screens/detailed_screen.dart';
import 'package:movie_app_task/services/movie_api_service.dart';

import '../model/movie_model.dart' hide Image;

class SearchScreenTab extends StatefulWidget {
  const SearchScreenTab({super.key});

  @override
  State<SearchScreenTab> createState() => _SearchScreenTabState();
}

class _SearchScreenTabState extends State<SearchScreenTab> {
  MovieApiService movieApiService = MovieApiService();
  List<MovieModel> searchedMoviesList = [];
  String serachQuery = "";
  bool isLoading = false;
  FocusNode focusNode = FocusNode();

  void searchMovies(String query) async {
    if (query.isEmpty) {
      setState(() {
        searchedMoviesList = [];
      });
      return;
    }
    setState(() {
      isLoading = true;
    });

    try {
      final movies = await movieApiService.searchMovies(query);
      setState(() {
        searchedMoviesList = movies;
      });
    } catch (e) {
      // Handle error, in case API call fails
      setState(() {
        searchedMoviesList = [];
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                focusNode: focusNode,
                onChanged: (value) async {
                  serachQuery = value;
                  searchMovies(serachQuery);
                },
                cursorColor: Colors.white,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  prefixIconColor: Colors.red,
                  focusColor: Colors.red,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.red, width: 2.0),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.red, width: 1.0),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  hintText: 'Search Movies',
                  hintStyle: TextStyle(color: Colors.white),
                  prefixIcon: const Icon(Icons.search),
                ),
              ),
            ),
            Expanded(
              child: isLoading
                  ? const Center(
                      child:
                          CircularProgressIndicator()) // Show loading indicator when API call is in progress
                  : searchedMoviesList.isEmpty
                      ? (focusNode.hasFocus
                          ? const Center(
                              child: Text(
                                "No movies found",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            )
                          : Container()) // Show no data message

                      : ListView.builder(
                          itemCount: searchedMoviesList.isEmpty
                              ? 0
                              : searchedMoviesList.length,
                          itemBuilder: ((context, index) {
                            return Column(
                              children: [
                                ListTile(
                                  tileColor: Colors.grey,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  leading: searchedMoviesList[index]
                                              .show
                                              ?.image !=
                                          null
                                      ? ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Image.network(
                                            searchedMoviesList[index]
                                                    .show
                                                    ?.image
                                                    ?.medium ??
                                                "",
                                            width: 150,
                                            height: 300,
                                            fit: BoxFit.cover,
                                            errorBuilder:
                                                (context, error, stackTrace) {
                                              return Image.asset(
                                                'images/placeholder_image.png',
                                                width: 150,
                                                height: 300,
                                                fit: BoxFit.cover,
                                              );
                                            },
                                          ),
                                        )
                                      : const Icon(Icons.image),
                                  title: Text(
                                    searchedMoviesList[index].show?.name ??
                                        "Unknown Title",
                                    style: titleText,
                                  ),
                                  subtitle: Text(
                                    searchedMoviesList[index]
                                            .show
                                            ?.summary
                                            ?.replaceAll(
                                                RegExp(r'<[^>]*>'), '') ??
                                        "No Summary Available",
                                    style: summaryText,
                                    maxLines: 3,
                                  ),
                                  onTap: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) => MovieDetailScreen(
                                          movie: searchedMoviesList[index]),
                                    ));
                                  },
                                ),
                                const SizedBox(
                                  height: 10,
                                )
                              ],
                            );
                          }),
                        ),
            ),
          ],
        ),
      ),
    );
  }
}
