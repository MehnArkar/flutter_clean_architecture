import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:flutter_clean_architecture/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';
import 'package:flutter_clean_architecture/features/daily_news/presentation/widgets/article_widget.dart';

class DailyNews extends StatelessWidget {
   const DailyNews({super.key});

   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         title: const Text('Daily News'),
       ),
       body: buildBody(),
     );
   }

   Widget buildBody(){
     return BlocBuilder<RemoteArticlesBloc,RemoteArticlesState>(
         builder: (context,state){
           if(state is RemoteArticlesLoading){
             return const CircularProgressIndicator();
           }

           if(state is RemoteArticlesDone){
             return ListView.builder(
                 itemCount: state.articles!.length,
                 itemBuilder: (context,index)=>ArticleWidget(article: state.articles![index],));
           }

           return Container();
         }
     );
   }

 }
