class UserLocation{
  final String city;
  final String state;
  final String country;
  final String postcode;
  final LocationCoordinates coordinates;
  final LocationTimeZone timezone;
  final LocationStreet street;

  UserLocation({
   required this.city,
   required this.state,
   required this.country,
   required this.postcode,
   required this.coordinates,
   required this.timezone,
   required this.street,
  });
}


class LocationCoordinates{
  final String latitude;
  final String longitude;

LocationCoordinates({
  required this.longitude,
  required this.latitude
});
}

class LocationTimeZone{
  final String offset;
  final String description;

  LocationTimeZone({
    required this.offset,
    required this.description
  });
}
class LocationStreet{
    final int number;
   final String name;

LocationStreet({
  required this.name,
  required  this.number
});
}