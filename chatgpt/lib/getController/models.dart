import 'package:chatgpt/services/api_services.dart';
import 'package:get/get.dart';

import '../models/models_models.dart';

class ModelsController extends GetxController{
  List<ModelsModel> modelsList = [];
  String? currentModel = "gpt-3.5-turbo";
  List<ModelsModel> get getModelsList {
    return modelsList;
  }

  String? get getCurrentModel {
    return currentModel;
  }

  void setCurrentModel (String newModel){
    currentModel = newModel;
    update();
  }

  Future<List<ModelsModel>> getAllModels () async{
    modelsList = await ApiService.getModels();
    return modelsList;
  }
}