import 'package:blockapi/blocs/user_events.dart';

import '../resources/resources.dart';
import 'user_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomerBloc extends Bloc<UserEvent, UserState>{
  final UserData _userdata;
  CustomerBloc(this._userdata) : super(UserLoadingState()){
    on<LoadUserEvent>((event,emmit) async{
      emit(UserLoadingState());
      try{
        final users = await _userdata.getUsers();
        emit(UserLoadedState(users));
      }catch(e){
        emit(UserErrorState(e.toString()));
      }
      // print("loading the data");

    });
  }

}