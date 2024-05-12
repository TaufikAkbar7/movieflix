import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movie_app/presentation/constants/app_constants.dart';
import 'package:movie_app/presentation/widgets/widget.dart';
import 'package:movie_app/routes/router.dart';

@RoutePage()
class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreen();
}

class _SearchScreen extends State<SearchScreen> {
  TextEditingController _searchControler = TextEditingController();
  ScrollController _controller = new ScrollController();
  String search = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _searchControler.dispose();
    super.dispose();
  }

  void _search() {
    setState(() {
      search = _searchControler.text;
    });
  }

  @override
  Widget build(context) {
    return AppScaffoldWidget(
      isUsingAppBar: true,
      appBarTitle: 'Search',
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              child: TextField(
                autocorrect: false,
                controller: _searchControler,
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
                  hintStyle: const TextStyle(fontSize: 16, color: Colors.grey),
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
            Text(search, style: TextStyle(color: Colors.white)),
            const Text('Browse All',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 21),
            SearchContent(querySearch: _searchControler.text)
          ],
        ),
      ),
    );
  }
}

class SearchContent extends StatelessWidget {
  final String querySearch;
  const SearchContent({super.key, required this.querySearch});

  @override
  Widget build(BuildContext context) {
    if (querySearch.isEmpty) {
      return GridView.count(
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        crossAxisCount: 2,
        shrinkWrap: true,
        primary: false,
        childAspectRatio: 2.3 / 1.1,
        children: AppConstant.listGenres.map((item) {
          return GestureDetector(
            onTap: () => context.router
                .push(GenreRoute(genreId: item['id'], genreName: item['name'])),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 14),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0), color: item['bg']),
              child: Text(item['name'],
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold)),
            ),
          );
        }).toList(),
      );
    }
    return Text(querySearch,
        style: const TextStyle(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold));
  }
}
