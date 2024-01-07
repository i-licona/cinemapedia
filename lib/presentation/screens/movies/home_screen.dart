import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/providers.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeView(),
      bottomNavigationBar: NavigationBottom(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {

  @override
  void initState(){
    super.initState();
    // realiza una peticion al API
    ref.read( nowPlayingMoviesProvider.notifier ).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    // Esta al pendiente del provider
    final List<Movie> nowPlayingMovies = ref.watch( nowPlayingMoviesProvider );
    final List<Movie> slideshowMovies = ref.watch( moviesSlideshowProvider );

    return Column(
      children: [
        const CustomAppbar(),
        MoviesSlideshow(movies: slideshowMovies),
        if( nowPlayingMovies.isNotEmpty )
          MovieHorizontalListview(
            movies: nowPlayingMovies,
            title: 'En cines',
            subtitle: 'Lunes 20',
          )
      ],
    );
  }
}