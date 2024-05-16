import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/search/search_bloc.dart';
import 'package:movie_app/data/model/movie_model.dart';
import 'package:movie_app/helper/functions.dart';
import 'package:movie_app/presentation/constants/app_constants.dart';
import 'package:movie_app/presentation/widgets/widget.dart';
import 'package:movie_app/routes/router.dart';
import 'dart:async';

@RoutePage()
class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreen();
}

class _SearchScreen extends State<SearchScreen> {
  final TextEditingController _searchController =
      TextEditingController(text: '');
  final SearchBloc _searchBloc = SearchBloc();
  String search = '';
  Timer? _debounce;

  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    if (query.isEmpty) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 800), () {
      setState(() {
        search = query;
      });
      _searchBloc.add(GetMovieBySearch(query: query, currentPage: 1));
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _debounce?.cancel();
    _searchController.clear();
    _searchController.dispose();
  }

  @override
  Widget build(context) {
    return AppScaffoldWidget(
      isUsingAppBar: true,
      appBarTitle: 'Search',
      body: BlocProvider(
        create: (context) => _searchBloc,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                child: TextField(
                  autocorrect: false,
                  controller: _searchController,
                  onChanged: _onSearchChanged,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(14),
                    prefixIcon: IconButton(
                      icon: const Icon(
                        Icons.search,
                        color: Colors.white,
                        size: 24,
                      ),
                      onPressed: () => {},
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.black, width: 1.0),
                      borderRadius: BorderRadius.circular(28.0),
                    ),
                    hintText: 'What do you want to play?',
                    hintStyle:
                        const TextStyle(fontSize: 16, color: Colors.grey),
                    fillColor: const Color(0xFF28303D),
                    border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.black, width: 1.0),
                      borderRadius: BorderRadius.circular(28.0),
                    ),
                    filled: true,
                    counterText: "",
                  ),
                ),
              ),
              const SizedBox(height: 21),
              if (search.isEmpty)
                const CardGenreContent()
              else
                BlocBuilder<SearchBloc, SearchState>(builder: (context, state) {
                  switch (state.status) {
                    case Status.loading:
                      return const AppLoadingWidget();
                    case Status.success:
                      final data = state.searchMovie;
                      if (data.isNotEmpty) {
                        return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12.0, vertical: 8.0),
                            child: GridView.count(
                              mainAxisSpacing: 20,
                              crossAxisCount: 1,
                              shrinkWrap: true,
                              primary: false,
                              childAspectRatio: 2.2 / 1.1,
                              children: data
                                  .map((item) => CardSearchContent(data: item))
                                  .toList(),
                            ));
                      }
                      return const Center(
                        child: Text('No data',
                            style: TextStyle(color: Colors.white)),
                      );
                    case Status.error:
                      return AppErrorMessageWidget(
                          errorMessage: state.errorMessage);
                    default:
                      return Container();
                  }
                }),
            ],
          ),
        ),
      ),
    );
  }
}

class CardGenreContent extends StatelessWidget {
  const CardGenreContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Browse All',
            style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold)),
        const SizedBox(height: 21),
        GridView.count(
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          crossAxisCount: 2,
          shrinkWrap: true,
          primary: false,
          childAspectRatio: 2.3 / 1.1,
          children: AppConstant.listGenres.map((item) {
            return GestureDetector(
              onTap: () => context.router.push(
                  GenreRoute(genreId: item['id'], genreName: item['name'])),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 4, horizontal: 14),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: item['bg']),
                child: Text(item['name'],
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
              ),
            );
          }).toList(),
        )
      ],
    );
  }
}

class CardSearchContent extends StatelessWidget {
  final MovieModel data;
  const CardSearchContent({super.key, required this.data});

  String renderImage(String? image) {
    if (image != null) {
      return "${ImageConstant.tmbdImageCard}/$image";
    }
    return ImageConstant.defaultImage;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.router
            .replace(DetailMovieRoute(movieId: data.id, isTvSeries: false));
      },
      child: SizedBox(
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    renderImage(data.poster_path),
                    fit: BoxFit.cover,
                    width: 200.0,
                    height: 154.0,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: 8.0),
                  child: FittedBox(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 10.0),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.bottomRight,
                              colors: [
                                Colors.black.withOpacity(0.7),
                                Colors.black.withOpacity(0.5),
                              ]),
                          borderRadius: BorderRadius.circular(50.0)),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.star,
                                color: Colors.yellow, size: 18.0),
                            const SizedBox(width: 5),
                            Text(
                              data.vote_average.toStringAsFixed(1),
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 14.0),
                            )
                          ]),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  width: 124.0,
                  child: Text(data.title,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 16)),
                ),
                const SizedBox(height: 12.0),
                Container(
                  width: 124.0,
                  child: Text(formatDate(data.release_date),
                      style: const TextStyle(color: Color(0xff9ba0a6))),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
