import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:task23/presentation/controller.dart';
// ignore: depend_on_referenced_packages
import 'package:timeago/timeago.dart' as timeago;

import '../utils/shimmer_gradient.dart';
import 'model.dart';

class HomeScreen extends GetWidget<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All posts"),
      ),
      body: Obx(() => controller.isloading.value
          ? ListView.builder(
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                  child: Skelton(
                    width: MediaQuery.of(context).size.width - 24,
                    height: 90,
                  ),
                );
              })
          : ListView.builder(
              itemCount: controller.result.length,
              itemBuilder: (context, index) {
                List<Result> post = controller.result;
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey.shade300,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(12),
                      color: const Color.fromARGB(255, 251, 250, 250),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Thumbnail
                          post[index].jsonMetadata!.thumbnails!.isNotEmpty
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    post[index].jsonMetadata!.thumbnails![0],
                                    width: 80,
                                    height: 80,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.asset(
                                    "assets/image/no-image.jpg",
                                    width: 80,
                                    height: 80,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                          const SizedBox(width: 16),
                          // Post Details
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Title and Author
                                Row(
                                  children: [
                                    Text(
                                      post[index].author ?? "",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    if (post[index].authorRole != null)
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Text(
                                          "[${post[index].authorRole}]",
                                          style: const TextStyle(
                                            color: Colors.redAccent,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    
                                  ],
                                ),
                                Text(getRelativeTime(
                                        post[index].created )),
                                Text(
                                  "${post[index].community} • ",
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  post[index].title ?? "",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  post[index].jsonMetadata!.description ?? "",
                                  style: TextStyle(
                                    color: Colors.grey[700],
                                    fontSize: 12,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 8),
                                // Earnings, Votes, Comments
                                Row(
                                  children: [
                                    Text(
                                      post[index].payout.toString() ?? "",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green,
                                        fontSize: 12,
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    Text(
                                      "↑ ${post[index].stats!.totalVotes} • 💬 ${post[index].reblogs}",
                                      style: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            )),
    );
  }

  String getRelativeTime(DateTime created) {
    return timeago.format(created, locale: 'en'); // Relative time in words
  }
}
