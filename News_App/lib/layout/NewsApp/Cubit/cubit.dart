import 'package:bloc/bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:login_screen/layout/NewsApp/Cubit/states.dart';
import 'package:login_screen/modules/business/business_screen.dart';
import 'package:login_screen/modules/scince/Scince_Screen.dart';

import 'package:login_screen/modules/sports/Sport_Screen.dart';
import 'package:login_screen/shared/network/DioHelpper/Dio.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomItm = [
    BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Business'),
    BottomNavigationBarItem(icon: Icon(Icons.sports), label: 'Sports'),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: 'Science'),
  ];

  List<Widget> Screens = [
    Business_Screen(),
    Sport_Screen(),
    Scince_Screen(),
  ];

  void cangeIndex(index) {
    currentIndex = index;
    if (index == 1) getSport();

    if (index == 2) getScience();

    emit(NewBottomNavState());
  }

  List<dynamic> business = [];

  void getBusiness() {
    emit(NewGetBussinessLodingState());

    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'business',
        'apiKey': '35d4da74bbbb4abbb66c36b8fa2452f4'
      },
    ).then((value) {
      print(value.data['articles'][1]['title']);
      business = value.data['articles'];
      print(business[0]['title']);
      emit(NewGetBussinessSuccessState());
    }).catchError((error) {
      print('thr Error is $error');
      emit(NewGetBussinessErrorState(error.toString()));
    });
  }

  List<dynamic> sport = [];

  void getSport() {
    emit(NewGetSportLodingState());
    if (sport.length == 0) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'sports',
          'apiKey': '35d4da74bbbb4abbb66c36b8fa2452f4'
        },
      ).then((value) {
        // print (value.data['articles'][1]['title']);
        sport = value.data['articles'];
        print(sport[0]['title']);
        emit(NewGetSportSuccessState());
      }).catchError((error) {
        print('thr Error is $error');
        emit(NewGetSportErrorState(error.toString()));
      });
    } else {
      emit(NewGetSportSuccessState());
    }
  }

  List<dynamic> science = [];

  void getScience() {
    emit(NewGetScinceLodingState());
    if (science.length == 0) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'science',
          'apiKey': '35d4da74bbbb4abbb66c36b8fa2452f4'
        },
      ).then((value) {
        // print (value.data['articles'][1]['title']);
        science = value.data['articles'];

        science[0]['urlToImage'] =
            'https://upload.wikimedia.org/wikipedia/commons/thumb/7/70/Solid_white.svg/2048px-Solid_white.svg.png';

        emit(NewGetScinceSuccessState());
      }).catchError((error) {
        print('thr Error is $error');
        emit(NewGetScinceErrorState(error.toString()));
      });
    } else {
      emit(NewGetScinceSuccessState());
    }
  }

  bool dark = false;
  void ChangeMode() {
    dark = !dark;
    emit(DarkmodeState());
    print(dark.toString());
  }
}
