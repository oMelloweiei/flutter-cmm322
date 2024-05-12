import 'package:binny_application/data/models/topicModel.dart';
import 'package:binny_application/data/models/userModel.dart';
import 'package:binny_application/data/repositories/topic/topic_repository.dart';
import 'package:binny_application/data/repositories/user/user_repository.dart';
import 'package:binny_application/widgets/loaders/snackbar.dart';
import 'package:get/get.dart';

class topicController extends GetxController {
  static topicController get instance => Get.find();

  final _userRepository = Get.put(UserRepository());
  final _topicRepository = Get.put(TopicRepository());

  final isLoading = false.obs;
  RxList<TopicModel> allTopic = <TopicModel>[].obs;

  @override
  void onInit() {
    fetchTopics();
    super.onInit();
  }

  //Load Topic data
  Future<void> fetchTopics() async {
    try {
      //Show Loader while loading topic
      isLoading.value = true;

      //Fetch topic from data source (Firestore, API, etc,)
      final topics = await _topicRepository.getAllTopic();

      //Update the topic list
      allTopic.assignAll(topics);
      // await fetchUsersForTopics(topics);
    } catch (e) {
      Loaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      //Finally Remove Loader
    }
  }

  // Future<void> fetchUsersForTopics(List<TopicModel> topics) async {
  //   try {
  //     final List<UserModel> users = await _userRepository.getAllUsers();

  //     // Iterate over each topic to find the host user
  //     for (final topic in topics) {
  //       // Find the user who created the topic
  //       final hostUser = users.firstWhere(
  //         (user) => user.topicId?.contains(topic.id) ?? false,
  //         orElse: () => UserModel.empty(),
  //       );

  //       // Assign the host user to the topic
  //       topic.user = hostUser;
  //       print(hostUser);
  //     }
  //   } catch (e) {
  //     // Handle any errors
  //   }
  // }

  // // Extract unique user IDs
  // final userIds = topics.map((topic) => topic.userId).toSet();

  // // Fetch user data for each user ID in parallel
  // final users =
  //     await Future.wait(userIds.map((id) => _userRepository.getUserById(id)));

  // // Assign users to topics
  // for (final topic in topics) {
  //   // Find the user who created the topic
  //   final user = users.firstWhere((user) => user.id == topic.userId,
  //       orElse: () => UserModel.empty());
  //   // Assign the user to the topic
  //   topic.user = user;
  // }
}

  //Load selected topic data

  //Get Topic or Sub Topic

