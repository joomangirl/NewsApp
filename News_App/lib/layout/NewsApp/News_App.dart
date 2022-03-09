import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:login_screen/layout/NewsApp/Cubit/cubit.dart';
import 'package:login_screen/shared/network/DioHelpper/Dio.dart';

import 'Cubit/states.dart';

class News_app extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsCubit.get(context);

        return Scaffold(
          appBar: AppBar(
            title: Text('News App'),
            actions: [
              IconButton(onPressed: () {}, icon: Icon(Icons.search)),
              IconButton(
                  onPressed: () {
                    NewsCubit.get(context).ChangeMode();
                  },
                  icon: Icon(Icons.brightness_4)),
            ],
          ),
          body: cubit.Screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.cangeIndex(index);
            },
            items: cubit.bottomItm,
          ),
        );
      },
    );
  }
}
