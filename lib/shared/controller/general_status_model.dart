import 'package:get/get.dart';

class GeneralStatusModel{
  Rx<GeneralStatus> status =GeneralStatus.waiting.obs;
  RxString? errorMsg=''.obs;
  RxList? errorList=[].obs;
  void updateStatus(GeneralStatus newStatus){
    status.value=newStatus;
  }void updateError(String newError){
    errorMsg!.value=newError;
  }void updateListError(List newListError){
    errorList!.value=newListError;
  }
}
enum GeneralStatus{waiting,success,error}