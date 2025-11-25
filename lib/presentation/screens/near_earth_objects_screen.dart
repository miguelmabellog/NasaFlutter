import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nasa_flutter/config/helpers/utils.dart';
import 'package:nasa_flutter/core/ui/atoms/atoms.dart';
import 'package:nasa_flutter/presentation/providers/near_earth_objects/near_earth_objects_by_dates_provider.dart';

class NearEarthObjectsScreen extends ConsumerStatefulWidget {
  const NearEarthObjectsScreen({super.key});

  static final String routeName = '/near_earth_objects';
  static final String nearEarthObjectsPath = '/near_earth_objects';

  @override
  ConsumerState<NearEarthObjectsScreen> createState() =>
      _NearEarthObjectsScreenState();
}

class _NearEarthObjectsScreenState
    extends ConsumerState<NearEarthObjectsScreen> {
  @override
  void initState() {
    ref
        .read(nearEarthObjectsByDatesProvider.notifier)
        .loadNearEarthObjectsByDates(
          Utils.currentDateYYYYMMDD(),
          Utils.currentDateYYYYMMDD(),
        );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final result = ref.watch(nearEarthObjectsByDatesProvider);

    if (result.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    final nearEarthObjects = result
        .nearEarthObjectResponse
        ?.nearEarthObjects[Utils.currentDateYYYYMMDD()];

    debugPrint("result: ${nearEarthObjects?.length}");

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            for (final nearEarthObject in nearEarthObjects ?? [])
              CustomText(nearEarthObject.name),
          ],
        ),
      ),
    );
  }
}
