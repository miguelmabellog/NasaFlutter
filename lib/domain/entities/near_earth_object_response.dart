class NearEarthObjectResponse {
  final NearEarthObjectResponseLinks links;
  final int elementCount;
  final Map<String, List<NearEarthObject>> nearEarthObjects;

  NearEarthObjectResponse({
    required this.links,
    required this.elementCount,
    required this.nearEarthObjects,
  });

  factory NearEarthObjectResponse.fromJson(Map<String, dynamic> json) {
    return NearEarthObjectResponse(
      links: NearEarthObjectResponseLinks.fromJson(json['links']),
      elementCount: json['element_count'],
      nearEarthObjects: Map<String, List<NearEarthObject>>.from(
        json['near_earth_objects'].map(
          (k, v) => MapEntry(
            k,
            List<NearEarthObject>.from(
              v.map((x) => NearEarthObject.fromJson(x)),
            ),
          ),
        ),
      ),
    );
  }

  @override
  String toString() {
    return 'NearEarthObjectResponse(links: $links, elementCount: $elementCount, nearEarthObjects: $nearEarthObjects)';
  }
}

class NearEarthObjectResponseLinks {
  final String next;
  final String previous;
  final String self;

  NearEarthObjectResponseLinks({
    required this.next,
    required this.previous,
    required this.self,
  });

  factory NearEarthObjectResponseLinks.fromJson(Map<String, dynamic> json) {
    return NearEarthObjectResponseLinks(
      next: json['next'],
      previous: json['previous'] ?? '',
      self: json['self'],
    );
  }

  @override
  String toString() {
    return 'NearEarthObjectResponseLinks(next: $next, previous: $previous, self: $self)';
  }
}

class NearEarthObject {
  final NearEarthObjectLinks links;
  final String id;
  final String neoReferenceId;
  final String name;
  final String nasaJplUrl;
  final double absoluteMagnitudeH;
  final EstimatedDiameter estimatedDiameter;
  final bool isPotentiallyHazardousAsteroid;
  final List<CloseApproachDatum> closeApproachData;
  final bool isSentryObject;

  NearEarthObject({
    required this.links,
    required this.id,
    required this.neoReferenceId,
    required this.name,
    required this.nasaJplUrl,
    required this.absoluteMagnitudeH,
    required this.estimatedDiameter,
    required this.isPotentiallyHazardousAsteroid,
    required this.closeApproachData,
    required this.isSentryObject,
  });

  factory NearEarthObject.fromJson(Map<String, dynamic> json) {
    return NearEarthObject(
      links: NearEarthObjectLinks.fromJson(json['links']),
      id: json['id'],
      neoReferenceId: json['neo_reference_id'],
      name: json['name'],
      nasaJplUrl: json['nasa_jpl_url'],
      absoluteMagnitudeH: json['absolute_magnitude_h'].toDouble(),
      estimatedDiameter: EstimatedDiameter.fromJson(json['estimated_diameter']),
      isPotentiallyHazardousAsteroid: json['is_potentially_hazardous_asteroid'],
      closeApproachData: List<CloseApproachDatum>.from(
        json['close_approach_data'].map((x) => CloseApproachDatum.fromJson(x)),
      ),
      isSentryObject: json['is_sentry_object'],
    );
  }

  @override
  String toString() {
    return 'NearEarthObject(links: $links, id: $id, neoReferenceId: $neoReferenceId, name: $name, nasaJplUrl: $nasaJplUrl, absoluteMagnitudeH: $absoluteMagnitudeH, estimatedDiameter: $estimatedDiameter, isPotentiallyHazardousAsteroid: $isPotentiallyHazardousAsteroid, closeApproachData: $closeApproachData, isSentryObject: $isSentryObject)';
  }
}

class CloseApproachDatum {
  final DateTime closeApproachDate;
  final String closeApproachDateFull;
  final int epochDateCloseApproach;
  final RelativeVelocity relativeVelocity;
  final MissDistance missDistance;
  final OrbitingBody orbitingBody;

  CloseApproachDatum({
    required this.closeApproachDate,
    required this.closeApproachDateFull,
    required this.epochDateCloseApproach,
    required this.relativeVelocity,
    required this.missDistance,
    required this.orbitingBody,
  });

  factory CloseApproachDatum.fromJson(Map<String, dynamic> json) {
    return CloseApproachDatum(
      closeApproachDate: DateTime.parse(json['close_approach_date']),
      closeApproachDateFull: json['close_approach_date_full'],
      epochDateCloseApproach: json['epoch_date_close_approach'],
      relativeVelocity: RelativeVelocity.fromJson(json['relative_velocity']),
      missDistance: MissDistance.fromJson(json['miss_distance']),
      orbitingBody: OrbitingBody.values.firstWhere(
        (e) => e.name == json['orbiting_body'],
        orElse: () => OrbitingBody.EARTH,
      ),
    );
  }

  @override
  String toString() {
    return 'CloseApproachDatum(closeApproachDate: $closeApproachDate, closeApproachDateFull: $closeApproachDateFull, epochDateCloseApproach: $epochDateCloseApproach, relativeVelocity: $relativeVelocity, missDistance: $missDistance, orbitingBody: $orbitingBody)';
  }
}

class MissDistance {
  final String astronomical;
  final String lunar;
  final String kilometers;
  final String miles;

  MissDistance({
    required this.astronomical,
    required this.lunar,
    required this.kilometers,
    required this.miles,
  });

  factory MissDistance.fromJson(Map<String, dynamic> json) {
    return MissDistance(
      astronomical: json['astronomical'],
      lunar: json['lunar'],
      kilometers: json['kilometers'],
      miles: json['miles'],
    );
  }

  @override
  String toString() {
    return 'MissDistance(astronomical: $astronomical, lunar: $lunar, kilometers: $kilometers, miles: $miles)';
  }
}

enum OrbitingBody { EARTH }

class RelativeVelocity {
  final String kilometersPerSecond;
  final String kilometersPerHour;
  final String milesPerHour;

  RelativeVelocity({
    required this.kilometersPerSecond,
    required this.kilometersPerHour,
    required this.milesPerHour,
  });

  factory RelativeVelocity.fromJson(Map<String, dynamic> json) {
    return RelativeVelocity(
      kilometersPerSecond: json['kilometers_per_second'],
      kilometersPerHour: json['kilometers_per_hour'],
      milesPerHour: json['miles_per_hour'],
    );
  }

  @override
  String toString() {
    return 'RelativeVelocity(kilometersPerSecond: $kilometersPerSecond, kilometersPerHour: $kilometersPerHour, milesPerHour: $milesPerHour)';
  }
}

class EstimatedDiameter {
  final Feet kilometers;
  final Feet meters;
  final Feet miles;
  final Feet feet;

  EstimatedDiameter({
    required this.kilometers,
    required this.meters,
    required this.miles,
    required this.feet,
  });

  factory EstimatedDiameter.fromJson(Map<String, dynamic> json) {
    return EstimatedDiameter(
      kilometers: Feet.fromJson(json['kilometers']),
      meters: Feet.fromJson(json['meters']),
      miles: Feet.fromJson(json['miles']),
      feet: Feet.fromJson(json['feet']),
    );
  }

  @override
  String toString() {
    return 'EstimatedDiameter(kilometers: $kilometers, meters: $meters, miles: $miles, feet: $feet)';
  }
}

class Feet {
  final double estimatedDiameterMin;
  final double estimatedDiameterMax;

  Feet({
    required this.estimatedDiameterMin,
    required this.estimatedDiameterMax,
  });

  factory Feet.fromJson(Map<String, dynamic> json) {
    return Feet(
      estimatedDiameterMin: json['estimated_diameter_min'].toDouble(),
      estimatedDiameterMax: json['estimated_diameter_max'].toDouble(),
    );
  }

  @override
  String toString() {
    return 'Feet(estimatedDiameterMin: $estimatedDiameterMin, estimatedDiameterMax: $estimatedDiameterMax)';
  }
}

class NearEarthObjectLinks {
  final String self;

  NearEarthObjectLinks({required this.self});

  factory NearEarthObjectLinks.fromJson(Map<String, dynamic> json) {
    return NearEarthObjectLinks(self: json['self']);
  }

  @override
  String toString() {
    return 'NearEarthObjectLinks(self: $self)';
  }
}
