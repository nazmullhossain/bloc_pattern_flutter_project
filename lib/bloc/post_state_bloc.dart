

import '../model/post_model.dart';

abstract class PostsState {}
class PostsInitial extends PostsState {}
abstract class PostActionState extends PostsState{}
class PostFetchingSucessfulSate extends PostsState{
  PostFetchingSucessfulSate({required this.posts});
  final List<PostModel> posts;
}