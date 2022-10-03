import 'package:blockapi/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/user_blocs.dart';
import 'blocs/user_events.dart';
import 'blocs/user_states.dart';
import 'models/model.dart';
import 'userscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // home:MainPage(title:'Bloc Demo',),
       home:RepositoryProvider(
        create: (context) => UserData(),
        child:const MainPage(title: 'Bloc Demo',),
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.title});

  final String title;

  @override
  State<MainPage> createState() => _MyMainPageState();
}

class _MyMainPageState extends State<MainPage> {


  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(providers: [
      BlocProvider(
      create: (context)=> CustomerBloc(
        RepositoryProvider.of<UserData>(context),
      )..add(LoadUserEvent())
      )],
      child: Scaffold(
        appBar: AppBar(
          title:Text(widget.title),
          backgroundColor: Colors.green,
          shadowColor: Colors.blue,
          centerTitle: true,
        ),
        body:BlocBuilder<CustomerBloc, UserState>(
          builder: (context,state) {
            if(state is UserLoadingState){
              return const Center(
                child:CircularProgressIndicator(
                  color: Colors.green,
                ),
              );
            }
            if(state is UserLoadedState){
              List<CustomerModel> userList = state.users;
              return ListView.builder(
                itemCount:userList.length,
                itemBuilder: (_,index){
                  return Padding(

                    padding:const EdgeInsets.symmetric(horizontal: 10),
                    child:SizedBox(
                      height:130,
                      width:130,
                     child:InkWell(
                       onTap:(){
                         Navigator.of(context).push(
                           MaterialPageRoute(
                               builder:(context)=> DetailScreen(
                                 e:userList[index],
                               ),
                           ),
                         );
                       },
                     child:Card(
                    color: Colors.lightGreen,
                    elevation:10,
                    margin: const EdgeInsets.symmetric(vertical: 10),

                    child:ListTile(
                      leading: const CircleAvatar(
                        maxRadius: 40,
                        backgroundImage: NetworkImage('https://cdn.pixabay.com/photo/2022/09/28/05/53/squirrel-7484292_960_720.jpg'),
                      ),
                      title:Text("Name: ${userList[index].name}",
                          style:const TextStyle(
                              color:Colors.white,
                          )),
                      subtitle: Text("Email: ${userList[index].email}",style:const TextStyle(
                        color:Colors.white,
                      )),
                    )
                  ),
                     ),
                    ),
                  );
                },
              );
            }
            if(state is UserErrorState){
              return const Center(child:Text("Error"));
            }
            return Container();
        }
        )
      )
    );

  }
}
