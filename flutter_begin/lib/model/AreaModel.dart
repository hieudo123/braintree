class Area{
  int id;
  String area_name;

  Area(this.id, this.area_name);
  Area.fromJson(Map<String, dynamic> json)
      : id = int.parse(json['Id']),
        area_name = json['Area_name'];
  Map<String, dynamic> toJson()=>
      {
        'Id' :id,
        'Area_name': area_name,
      };
}