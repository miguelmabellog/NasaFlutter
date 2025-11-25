import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nasa_flutter/config/helpers/utils.dart';
import 'package:nasa_flutter/core/ui/atoms/atoms.dart';
import 'package:nasa_flutter/core/ui/organisms/organisms.dart';
import 'package:nasa_flutter/core/ui/pages/there_is_not_data.dart';
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
      return Scaffold(body: const Center(child: CircularProgressIndicator()));
    }

    final nearEarthObjects = result
        .nearEarthObjectResponse
        ?.nearEarthObjects[Utils.currentDateYYYYMMDD()];

    if (nearEarthObjects == null || nearEarthObjects.isEmpty) {
      return const ThereIsNotData();
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Near Earth Objects')),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.calendar_today),
                  CustomText('Date: ${Utils.currentDateYYYYMMDD()}'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: CustomText(
                "There are ${nearEarthObjects.length} passing near Earth today",
                fontStyle: FontStyle.italic,
                textAlign: TextAlign.center,
              ),
            ),

            const SizedBox(height: 32),

            Expanded(
              child: ListView.builder(
                itemCount: nearEarthObjects.length,
                itemBuilder: (context, index) {
                  final nearEarthObject = nearEarthObjects[index];
                  return NearEarthObjectCard(nearEarthObject: nearEarthObject);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
