
class CustomerModel {
  final int id;
  final String name;
  final String username;
  final String email;
  final String phone;
  final String website;

  CustomerModel( {required this.id,required this.name, required this.username, required this.email, required this.phone, required this.website}
      );

  factory CustomerModel.fromJson(Map<String, dynamic> json){
    return CustomerModel(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      email: json['email'],
      phone: json['phone'],
      website: json['website'],
    );
  }
}