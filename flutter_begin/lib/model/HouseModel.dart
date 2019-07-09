class HouseModel {
  int id;
  String idUser;
  String idClass;
  String address;
  String acreage;
  String area;
  String floor;
  String rooms;
  String bathrooms;
  String image;
  String price;
  String description;
  String status;

  HouseModel (
      {this.id,
        this.idUser,
        this.idClass,
        this.address,
        this.acreage,
        this.area,
        this.floor,
        this.rooms,
        this.bathrooms,
        this.image,
        this.price,
        this.description,
        this.status});

  HouseModel .fromJson(Map<String, dynamic> json) {
    id = int.parse(json['Id'].toString());
    idUser = json['Id_user'];
    idClass = json['Id_class'];
    address = json['Address'];
    acreage = json['Acreage'];
    area = json['Area'];
    floor = json['Floor'];
    rooms = json['Rooms'];
    bathrooms = json['Bathrooms'];
    image = json['Image'];
    price = json['Price'];
    description = json['Description'];
    status = json['Status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id.toString();
    data['Id_user'] = this.idUser;
    data['Id_class'] = this.idClass;
    data['Address'] = this.address;
    data['Acreage'] = this.acreage;
    data['Area'] = this.area;
    data['Floor'] = this.floor;
    data['Rooms'] = this.rooms;
    data['Bathrooms'] = this.bathrooms;
    data['Image'] = this.image;
    data['Price'] = this.price;
    data['Description'] = this.description;
    data['Status'] = this.status;
    return data;
  }
}