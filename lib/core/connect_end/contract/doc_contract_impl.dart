import 'package:injectable/injectable.dart';
import 'package:my_doc_lab/core/api_folder/doc_api.dart';
import 'package:my_doc_lab/core/connect_end/model/doctor_availability_entity_model/doctor_availability_entity_model.dart';
import 'package:my_doc_lab/core/connect_end/model/get_doc_detail_response_model/get_doc_detail_response_model.dart';
import 'package:my_doc_lab/core/connect_end/model/update_doctor_entity_model.dart';

import '../../core_folder/app/app.locator.dart';
import '../model/get_message_index_response_model/get_message_index_response_model.dart';
import '../model/post_user_cloud_entity_model.dart';
import '../model/post_user_verification_cloud_response/post_user_verification_cloud_response.dart';
import '../model/received_message_response_model/received_message_response_model.dart';
import '../model/send_message_entity_model.dart';

@lazySingleton
class DocContractsImpl {
  final _api = locator<DocAuthApi>();

  Future<GetDocDetailResponseModel> getDoctorDetail() async =>
      await _api.getDoctorDetail();
  Future<dynamic> updateDoctorDetail(
    String id, {
    UpdateDoctorEntityModel? updateDoctor,
  }) async => await _api.updateDoctor(id, updateDoctor: updateDoctor);
  Future<dynamic> doctorsAvailability(
    String id, {
    DoctorAvailabilityEntityModel? availability,
  }) async =>
      await _api.doctorsAvailabilty(id, doctorAvailability: availability);
  Future<PostUserVerificationCloudResponse> postCloudinary(
    PostUserCloudEntityModel postCloudinary,
  ) async => await _api.postTocloudinary(postCloudinary);
  Future<GetMessageIndexResponseModelList> chatIndex() async =>
      await _api.chatIndex();
  Future<ReceivedMessageResponseModelList> receiveMessage(String id) async =>
      await _api.receiveConversation(id);
  Future<dynamic> sendMessage(SendMessageEntityModel send) async =>
      await _api.sendMessage(send);
}
