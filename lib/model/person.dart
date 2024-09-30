class Person {
  int id;
  String firstName;
  String lastName;
  String email;
  String phone;
  DateTime birthday;
  String gender;
  Address address;
  String imgURL;
  String website;

  Person(this.id, this.firstName, this.lastName, this.email, this.phone,
      this.birthday, this.gender, this.address, this.imgURL, this.website);

  Person.fromMap(Map<String, Object?> map)
      : id = map["id"] as int,
        firstName = map["firstname"] as String,
        lastName = map["lastname"] as String,
        email = map["email"] as String,
        phone = map["phone"] as String,
        birthday = DateTime.parse(map["birthday"] as String),
        gender = map["gender"] as String,
        address = Address.fromMap(map["address"] as Map<String, Object?>),
        imgURL = "https://i.pravatar.cc/100?random=${map["id"]}",
        website = map["website"] as String;
}

class Address {
  int id;
  String street;
  String streetName;
  String buildingNumber;
  String city;
  String zipcode;
  String country;
  String countryCode;
  double lat;
  double long;

  Address(this.id, this.street, this.streetName, this.buildingNumber, this.city,
      this.zipcode, this.country, this.countryCode, this.lat, this.long);

  Address.fromMap(Map<String, Object?> map)
      : id = map["id"] as int,
        street = map["street"] as String,
        streetName = map["streetName"] as String,
        buildingNumber = map["buildingNumber"] as String,
        city = map["city"] as String,
        zipcode = map["zipcode"] as String,
        country = map["country"] as String,
        countryCode = map["country_code"] as String,
        lat = map["latitude"] as double,
        long = map["longitude"] as double;

  @override
  String toString() {
    return "$street $streetName $buildingNumber $city $zipcode $country $countryCode";
  }
}
