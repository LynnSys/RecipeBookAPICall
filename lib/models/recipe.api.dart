import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:recipebook/models/recipe.dart';

class RecipeApi {
  static Future<List<Recipe>> getRecipe() async {
    var uri = Uri.https('yummly2.p.rapidapi.com', '/feeds/list',
        {"limit": "100", "start": "0", "tag": "list.recipe.popular"});

    final response = await http.get(uri, headers: {
      "x-rapidapi-key": "8dc7c6db25mshc33db5fb8ccf462p149995jsnba91cfffa993",
      "x-rapidapi-host": "yummly2.p.rapidapi.com",
      "useQueryString": "true"
    });

    Map data = jsonDecode(response.body);
    List temp = [];

    for (var i in data['feed']) {
      // temp.add(i['content']['details']);
      // print(temp[i]['details']);
      temp.add(data['content']['details']);
    }
    return Recipe.recipes(temp);
  }
}