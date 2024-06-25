import 'dart:convert';

import 'package:http/http.dart' as http;
class constantFunction{


static Future<List<Map<String,dynamic>>>getResponse(String findRecipe)async{
  /*String id ="b3907eee";
  String key ='68fd63fdd3380b4501b96cc72e5afeeb';*/
  
  String api="https://api.edamam.com/search?q=$findRecipe&app_id=b3907eee&app_key=68fd63fdd3380b4501b96cc72e5afeeb&from=0&to=20&calories=591-722&health=alcohol-free";

final response=await http.get(Uri.parse(api));
List<Map<String , dynamic>> recipe=[];

if(response.statusCode==200){
var data = jsonDecode(response.body);
if(data['hits']!=null){
  for(var hit in data['hits']){
    recipe.add(hit['recipe']);
  }
}
return recipe;
}

return recipe;

}
}
