import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/similar/similar_bloc.dart';
import 'package:movie_app/presentation/widgets/app_card_movie_widget.dart';

@RoutePage()
class SimilarScreen extends StatefulWidget {
  final int movieId;
  const SimilarScreen({super.key, required this.movieId});

  @override
  State<SimilarScreen> createState() => _SimilarScreen();
}

class _SimilarScreen extends State<SimilarScreen> {
  final SimilarBloc _similarBloc = SimilarBloc();

  @override
  void initState() {
    _similarBloc.add(GetDetailMovieSimilar(movieId: widget.movieId));
    super.initState();
  }

  @override
  Widget build(context) {
    return Scaffold(
      backgroundColor: const Color(0xFF141A26),
      appBar: AppBar(
        title: const Text('Similar Movie',
            style: TextStyle(
                color: Colors.white,
                fontSize: 21.0,
                fontWeight: FontWeight.w700)),
        backgroundColor: const Color(0xFF141A26),
        iconTheme: const IconThemeData(
          color: Colors.white, //change your color here
        ),
      ),
      body: BlocProvider(
          create: (context) => _similarBloc,
          child: RefreshIndicator(
            onRefresh: () async => _similarBloc
                .add(GetDetailMovieSimilar(movieId: widget.movieId)),
            child: BlocBuilder<SimilarBloc, SimilarState>(
                builder: (context, state) {
              if (state is SimilarLoading) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    backgroundColor: Colors.blueGrey,
                  ),
                );
              } else if (state is SimilarSuccess) {
                final data = state.similar;

                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // number of items in each row
                      mainAxisSpacing: 24.0, // spacing between rows
                      crossAxisSpacing: 14.0,
                      mainAxisExtent: 250.0 // spacing between columns
                      ),
                  padding: const EdgeInsets.all(8.0), // padding around the grid
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return AppCardMovieWidget(
                        data: data[index], isTvSeries: false);
                  },
                );
              } else if (state is SimilarError) {
                return Text(state.e,
                    style: const TextStyle(color: Colors.white));
              } else {
                return Container();
              }
            }),
          )),
    );
  }
}
