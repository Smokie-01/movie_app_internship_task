import 'package:flutter/material.dart';
import 'package:movie_app_task/constants/constants.dart';
import 'package:movie_app_task/model/movie_model.dart' hide Image;

class MovieDetailScreen extends StatelessWidget {
  final MovieModel movie;

  const MovieDetailScreen({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(movie.show?.name ?? "Movie Details"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Movie Image
              if (movie.show?.image?.original != null)
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    movie.show?.image?.medium ?? 'No Image',
                    width: 200,
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                ),
              const SizedBox(height: 16),
              // Movie Title
              Padding(
                padding: const EdgeInsets.all(16.0),
                child:
                    Text(movie.show?.name ?? "Unknown Title", style: titleText),
              ),
              // Movie Summary
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                    movie.show?.summary?.replaceAll(RegExp(r'<[^>]*>'), '') ??
                        "No Summary Available",
                    style: summaryText),
              ),
              // Add other movie details here (genres, rating, etc.)
            ],
          ),
        ),
      ),
    );
  }
}
