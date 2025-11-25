import 'package:flutter/material.dart';
import 'package:nasa_flutter/core/ui/atoms/custom_text/custom_text.dart';
import 'package:nasa_flutter/domain/entities/near_earth_object_response.dart';

import '../../../config/helpers/utils.dart';

class NearEarthObjectCard extends StatelessWidget {
  final NearEarthObject nearEarthObject;

  const NearEarthObjectCard({super.key, required this.nearEarthObject});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          spacing: 8,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 4,
                  children: [
                    CustomText(nearEarthObject.name, fontSize: 16),

                    Column(
                      children: [
                        const CustomText(
                          "Diameter",
                          fontSize: 12,
                          fontStyle: FontStyle.italic,
                          color: Colors.grey,
                        ),

                        CustomText(
                          "${Utils.formatDoubleToHumanFormat(nearEarthObject.estimatedDiameter.kilometers.estimatedDiameterMax)} km",
                          fontSize: 12,
                          fontStyle: FontStyle.italic,
                        ),
                      ],
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomText(
                          "Velocity",
                          fontSize: 12,
                          fontStyle: FontStyle.italic,
                          color: Colors.grey,
                        ),

                        CustomText(
                          "${Utils.velocityToKms(nearEarthObject.closeApproachData.first.relativeVelocity.kilometersPerHour)} km/h",
                          fontSize: 12,
                          fontStyle: FontStyle.italic,
                        ),
                      ],
                    ),
                  ],
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  spacing: 8,
                  children: [
                    Icon(Icons.warning_amber_rounded, color: Colors.amber),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const CustomText(
                          "Miss Distance",
                          fontSize: 12,
                          fontStyle: FontStyle.italic,
                          color: Colors.grey,
                        ),

                        CustomText(
                          "${Utils.formatDoubleToHumanFormatString(nearEarthObject.closeApproachData.first.missDistance.kilometers)} km",
                          fontStyle: FontStyle.italic,
                        ),
                      ],
                    ),

                    CustomText(
                      "Today",
                      color: Colors.green,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
