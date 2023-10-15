import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';

import '../bloc/post_bloc.dart';
import '../bloc/post_event_bloc.dart';
import '../bloc/post_state_bloc.dart';

class PostPage extends StatefulWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  final PostBloc postBloc=PostBloc();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    postBloc.add(PostInitalFetchEvent());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts Page'),
      ),
      body: SingleChildScrollView(
        child: BlocConsumer<PostBloc,PostsState>(
          bloc: postBloc,
          listenWhen: (previous,current)=>current is PostActionState ,
          buildWhen: (previous,current)=>current is !PostActionState,
          listener: (context,state){

          },
          builder: (context, state) {
            switch(state.runtimeType){
              case PostFetchingSucessfulSate:
                final sucessRate=state as PostFetchingSucessfulSate;
         return SizedBox(
           height: MediaQuery.of(context).size.height *0.9,
           child: ListView.builder(
               itemCount: sucessRate.posts.length,
               itemBuilder: (context,index){
                 final data=sucessRate.posts[index];
             return Container(
               child: Column(
                 children: [
                   Text(data.title.toString())
                 ],
               ),
             );
           }) ,
         );
              default:
            }
            return Container(

            );
          }
        ),
      ),
    );
  }
}
