import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/casts/casts_bloc.dart';
import 'package:movie_app/presentation/pages/casts/widget/content_cast_widget.dart';
import 'package:movie_app/presentation/widgets/widget.dart';

@RoutePage()
class CastScreen extends StatefulWidget {
  final int movieId;
  final bool isTvSeries;
  final List<Map<String, String>> casts;

  const CastScreen(
      {super.key,
      required this.movieId,
      required this.casts,
      required this.isTvSeries});

  @override
  State<CastScreen> createState() => _CastScreen();
}

class _CastScreen extends State<CastScreen> {
  final CastsBloc _castsBloc = CastsBloc();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(context) {
    return Scaffold(
      backgroundColor: const Color(0xFF141A26),
      appBar: AppBar(
        title: const Text('Casts & Crew',
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
          create: (context) => _castsBloc,
          child: AppContainerWidget(
            onRefresh: () async => _castsBloc.add(GetDetailMovieCasts(
                movieId: widget.movieId, isTvSeries: widget.isTvSeries)),
            child:
                BlocBuilder<CastsBloc, CastsState>(builder: (context, state) {
              switch (state) {
                case CastsLoading():
                  return const AppLoadingWidget();
                case CastsSuccess():
                  return ContentCastWidget(data: state.castsMovie);
                case CastsError():
                  return AppErrorMessageWidget(errorMessage: state.e);
                default:
                  return ContentCastWidget(data: widget.casts);
              }
            }),
          )),
    );
  }
}
