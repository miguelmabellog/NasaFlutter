import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nasa_flutter/config/helpers/utils.dart';
import 'package:nasa_flutter/core/ui/atoms/custom_text/custom_text.dart';
import 'package:nasa_flutter/presentation/providers/apod/apod_by_dates_provider.dart';

class PictureDayImageScreen extends ConsumerStatefulWidget {
  const PictureDayImageScreen({super.key});
  static final String routeName = '/picture_day';
  static final String pictureDayPath = '/picture_day';

  @override
  ConsumerState<PictureDayImageScreen> createState() => _PictureDayImageState();
}

class _PictureDayImageState extends ConsumerState<PictureDayImageScreen> {
  @override
  void initState() {
    super.initState();

    ref
        .read(apodByDatesProvider.notifier)
        .loadApodByDates(Utils.currentDateYYYYMMDD());
  }

  @override
  Widget build(BuildContext context) {
    final result = ref.watch(apodByDatesProvider);

    if (result.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (result.errorMessage.isNotEmpty) {
      return Scaffold(body: Center(child: Text(result.errorMessage)));
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Picture Day')),
      body: Center(
        child: Column(
          spacing: 4,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              result.apod!.url,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: const CircularProgressIndicator(strokeWidth: 2),
                  ),
                );
              },
            ),

            CustomText(result.apod!.title),
          ],
        ),
      ),
    );
  }
}
