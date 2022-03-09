abstract class NewsStates{}

class NewInitialState extends NewsStates{}
class NewBottomNavState extends NewsStates{}




class NewGetBussinessLodingState extends NewsStates{}
class NewGetBussinessSuccessState extends NewsStates{}
class NewGetBussinessErrorState extends NewsStates{
  final String error;

  NewGetBussinessErrorState(this.error);
}



class NewGetSportLodingState extends NewsStates{}
class NewGetSportSuccessState extends NewsStates{}
class NewGetSportErrorState extends NewsStates{
  final String error;

  NewGetSportErrorState(this.error);
}




class NewGetScinceLodingState extends NewsStates{}
class NewGetScinceSuccessState extends NewsStates{}
class NewGetScinceErrorState extends NewsStates{
  final String error;

  NewGetScinceErrorState(this.error);
}

class DarkmodeState extends NewsStates{}