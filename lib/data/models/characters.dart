
class Character{

  late int charId;
  late String name;
  late String birthday;
  late List<dynamic> occupation;
  late String image;
  late String status;
  late String nickName;
  late String portrayed;
  //late List<dynamic> category;
  late List<dynamic> appearance;
  late List<dynamic> better_call_saul_appearance;

  Character.fromJson (Map<String , dynamic> json){
    charId = json['char_id'];
    name = json['name'];
    birthday = json['birthday'];
    occupation = json['occupation'];
    image = json['img'];
    status = json['status'];
    nickName = json['nickname'];
    portrayed = json['portrayed'];
    //category = json['category'];
    appearance = json['appearance'];
    better_call_saul_appearance = json['better_call_saul_appearance'];
  }

}
