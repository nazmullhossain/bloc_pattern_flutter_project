import 'dart:async';
import 'dart:convert';

import 'package:api_bloc/bloc/post_event_bloc.dart';
import 'package:api_bloc/bloc/post_state_bloc.dart';
import 'package:api_bloc/model/post_model.dart';
import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
class PostBloc extends Bloc<PostsEvent, PostsState> {
  PostBloc() : super(PostsInitial()) {
    on<PostInitalFetchEvent>(postInitalFetchEvent);
  }

  FutureOr<void> postInitalFetchEvent(
      PostInitalFetchEvent event, Emitter emit)async {
    String url="https://jsonplaceholder.typicode.com/posts";
    List<PostModel>posts=[];
    try{
      http.Response response=await http.get(Uri.parse(url));
      List result=jsonDecode(response.body);
      print(response.body);
      if(response.statusCode==200){
        for (int i=0; i<result.length;i++){
          PostModel postModel=PostModel.fromJson(result[i] as Map<String, dynamic>);

          posts.add(postModel);
        }
      }
emit(PostFetchingSucessfulSate(posts: posts));
    }catch(e){
      print(e.toString());

    }

  }
}
