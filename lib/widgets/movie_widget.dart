import 'package:flutter/material.dart';

class MovieWidget extends StatelessWidget {
  final String? imageUrl;
  final String? title;
  final String? summary;

  const MovieWidget({
    Key? key,
    this.imageUrl,
    this.title,
    this.summary,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey,
      elevation: 4,
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Movie Image
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                imageUrl ?? 'No Image',
                width: 100,
                height: 150,
                fit: BoxFit.cover,
                errorBuilder: (BuildContext context, Object error,
                    StackTrace? stackTrace) {
                  return Image.asset(
                    'images/placeholder_image.png', // Path to your local placeholder image
                    width: 100,
                    height: 150,
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
            const SizedBox(width: 16),
            // Title and Summary
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Movie Title
                  Text(
                    title ?? 'No Title',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  // Movie Summary
                  Text(
                    summary?.replaceAll(RegExp(r'<[^>]*>'), '') ??
                        "No Summary Available",
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
