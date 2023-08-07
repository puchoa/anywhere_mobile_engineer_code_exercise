import 'package:anywhere_code_exercise/flavor_config.dart';
import 'package:anywhere_code_exercise/models/viewer_model.dart';
import 'package:http/http.dart';

class CharacterRepository {
  Future getCharacters() async {
    Response response =
        await get(Uri.parse(FlavorConfig.instance.values.baseUrl));
    if (response.statusCode == 200) {
      return viewerModelFromJson(response.body);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
