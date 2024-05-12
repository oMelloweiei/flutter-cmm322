import 'package:binny_application/data/models/replyModel.dart';
import 'package:binny_application/data/repositories/reply_repository.dart';
import 'package:binny_application/data/repositories/topic_repository.dart';
import 'package:binny_application/widgets/loaders/snackbar.dart';
import 'package:get/get.dart';

class ReplyController extends GetxController {
  static ReplyController get instance => Get.find();

  // final _replyRepository = Get.find<ReplyRepository>();
  final _replyRepository = Get.put(ReplyRepository());

  final isLoading = false.obs;
  RxList<ReplyModel> replies = <ReplyModel>[].obs;

  @override
  void onInit() {
    // fetchReplies();
    super.onInit();
  }

  Future<void> fetchReplies(String topicId) async {
    try {
      isLoading.value = true;
      final List<ReplyModel> topicReplies =
          await _replyRepository.getRepliesForTopic(topicId);
      replies.assignAll(topicReplies);
    } catch (e) {
      // Handle errors
    } finally {
      isLoading.value = false;
    }
  }
}
