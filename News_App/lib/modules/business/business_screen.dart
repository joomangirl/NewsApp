import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:login_screen/layout/NewsApp/Cubit/cubit.dart';
import 'package:login_screen/layout/NewsApp/Cubit/states.dart';
import 'package:login_screen/shared/components/componants.dart';

class Business_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (BuildContext context, NewsStates state) {},
      builder: (BuildContext context, NewsStates state) {
        var list = NewsCubit.get(context).business;
        return articalBuilder(list);
      },
    );
  }
}
