import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:nasa_flutter/domain/entities/apod.dart';
import 'package:nasa_flutter/shared/widgets/image_card.dart';

class ApodMasonry extends StatefulWidget {
  final List<Apod> apods;
  final Future<void> Function()? loadNextPage;

  const ApodMasonry({super.key, required this.apods, this.loadNextPage});

  @override
  State<ApodMasonry> createState() => _ApodMasonryState();
}

class _ApodMasonryState extends State<ApodMasonry> {
  bool isLastPage = false;
  bool isLoading = false;
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      if (scrollController.position.pixels + 200 >=
          scrollController.position.maxScrollExtent) {
        loadNextPageMovies();
      }
    });
  }

  void loadNextPageMovies() async {
    if (isLoading || isLastPage) return;

    if (widget.loadNextPage == null) return;
    isLoading = true;

    await widget.loadNextPage?.call();

    isLoading = false;
  }

  @override
  void dispose() {
    scrollController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      controller: scrollController,
      crossAxisCount: 3,
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      padding: const EdgeInsets.all(8),
      itemCount: widget.apods.length,
      itemBuilder: (context, index) {
        final apod = widget.apods[index];

        if (index == 1) {
          return Column(
            children: [
              const SizedBox(height: 24),
              ImageCard(imageUrl: apod.url),
            ],
          );
        }
        return ImageCard(imageUrl: apod.url);
      },
    );
  }
}
