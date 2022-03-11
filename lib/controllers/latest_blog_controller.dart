import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/models/blogModel/blog.dart';
import 'package:myapp/repositories/blog_repository.dart';

class BlogController extends StateNotifier<AsyncValue<Blog>> {
  BlogController(this._blogRepository) : super(const AsyncValue.loading()) {
    getlatestSeppoBlog();
  }
  final HttpBlogRepository _blogRepository;

  Future<void> getlatestSeppoBlog() async {
    try {
      state = const AsyncValue.loading();
      const path = '/v2api/blog/latest_seppo_blog';
      final forecast = await _blogRepository.getOneBlog(path: path);
      state = AsyncValue.data(forecast);
    } catch (err) {
      state = AsyncValue.error(err);
    }
  }
}

final blogControllerProvider = StateNotifierProvider.autoDispose
    .family<BlogController, AsyncValue<Blog>, String>((ref, method) {
  final blogRepository = ref.watch(blogRepositoryProvider);
  return BlogController(blogRepository);
});
