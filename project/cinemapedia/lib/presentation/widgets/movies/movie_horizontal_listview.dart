


import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter/material.dart';

class MovieHorizontalListview extends StatefulWidget {

  final List<Movie> movies;
  final String? title;
  final String? subTitle;
  final VoidCallback? loadNextPage;

  const MovieHorizontalListview({
    super.key, 
    required this.movies,
    this.title, 
    this.subTitle, 
    this.loadNextPage
  });

  @override
  State<MovieHorizontalListview> createState() => _MovieHorizontalListviewState();
}

class _MovieHorizontalListviewState extends State<MovieHorizontalListview> {
  @override
  Widget build(BuildContext context) {
    return Placeholder();
  }
}