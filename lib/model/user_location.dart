
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
  factory UserLocation.fromMap(Map<String,dynamic>json){
     final coordinates=LocationCoordinates.fromMap(json['coordinates']);
      

      final street= LocationStreet.fromMap(json['street']);

      final timezone=LocationTimeZone.fromMap(json['timezone']);

       return UserLocation(
       city:json['city'], 
       state:json['state'], 
       country:json['country'], 
       postcode:json['postcode'].toString(), 
       coordinates: coordinates, 
       timezone: timezone,
       street: street);
  }
   
}


class LocationCoordinates{
      final String latitude;
      final String longitude;

  LocationCoordinates({
      required this.longitude,
      required this.latitude
}); 
    factory LocationCoordinates.fromMap(Map<String,dynamic>json){
        return  LocationCoordinates(
      longitude:json['longitude'], 
      latitude:json['latitude']);

    }
}

class LocationTimeZone{
      final String offset;
      final String description;

  LocationTimeZone({
    required this.offset,
    required this.description
  });
   factory LocationTimeZone.fromMap(Map<String,dynamic>json){
        return LocationTimeZone(offset:json['offset'],description: json['description'],);
 }
}


class LocationStreet{
    final int number;
    final String name;

LocationStreet({
  required this.name,
  required  this.number
});
    factory LocationStreet.fromMap(Map<String,dynamic>json){
      return LocationStreet(name:json['name'], number:json['number'],) ;
    }

}