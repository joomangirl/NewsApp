import 'dart:math';

import 'package:flutter/material.dart';

import 'myresult.dart';

class BMICALC extends StatefulWidget {


  @override
  _BMICALCState createState() => _BMICALCState();
}

class _BMICALCState extends State<BMICALC> {
  double hight=120.0;
  double weaght=60;
  double age=22;
  bool ismale=true;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('My BMI'),
      ),

      body: Padding(
        padding: const EdgeInsets.only(top: 10,left: 10,right: 10),
        child: Column(

          children: [
            Expanded(

              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    mycard(
                      ontap: (){
                        setState(() {
                          ismale=true;
                        });
                      },
                      color:ismale ? Colors.blue: Colors.blue[50],
                      child: Column(

                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [
                        Image(
                          height: 100,
                          width: 100,
                          image: AssetImage('images/boy.png',)

                          ),
                          SizedBox(height: 10,),
                          Text('Male',style: TextStyle(
                            color: Colors.black,
                            fontSize: 40,
                            fontWeight: FontWeight.bold


                          ),)





                        ],
                      ),

                    ),
                    SizedBox(width: 20,),
                    mycard(
                      ontap: (){
                        setState(() {
                          ismale=false;
                        });
                      },
                      color:  !ismale? Colors.blue: Colors.blue[50] ,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [
                          Image(
                              height: 100,
                              width: 100,
                              image: AssetImage('images/girl.png',)

                          ),
                          SizedBox(height: 10,),
                          Text('Male',style: TextStyle(
                              color: Colors.black,
                              fontSize: 40,
                              fontWeight: FontWeight.bold


                          ),)





                        ],
                      ),
                    ),


                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color:Colors.blue[50],
                    borderRadius: BorderRadius.circular(10),

                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Hight',style: TextStyle(
                          color: Colors.black,
                          fontSize: 40,
                          fontWeight: FontWeight.bold


                      ),),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        mainAxisAlignment: MainAxisAlignment.center,
                        textBaseline: TextBaseline.alphabetic,

                        children: [
                          Text('${hight.round()}',style: TextStyle(
                              color: Colors.black,
                              fontSize: 50,
                              fontWeight: FontWeight.bold


                          ),),
                          Text('cm',style: TextStyle(fontSize: 30,color: Colors.black,fontWeight: FontWeight.bold),)
                        ],
                      ),
                      Slider(
                          value:hight ,

                          min: 60,
                          max: 220,
                          onChanged: (double value){
                            setState(() {
                              hight=value;
                              print(value.round());
                            });
                          }


                      )


                    ],



                  ),




            ),
              ),),
            Expanded(
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    mycard(
                      color: Colors.blue[50],
                      child: Column(
                        children: [
                          Text('Weaght',style: TextStyle(

                              color: Colors.black,
                              fontSize: 40,
                              fontWeight: FontWeight.bold


                          ),),
                          Text('${weaght.round()}',style: TextStyle(
                              color: Colors.black,
                              fontSize: 40,
                              fontWeight: FontWeight.bold


                          ),),
                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,

                            children: [
                              FloatingActionButton(
                                backgroundColor: Colors.blue[500],
                                  onPressed: (){
                                  setState(() { 
                                    weaght++;
                                  });
                                  },
                                child: Icon(Icons.add,color: Colors.white,),

                              ),
                              SizedBox(width: 10,),
                              FloatingActionButton(
                                backgroundColor: Colors.blue[500],
                                onPressed: (){
                                  setState(() {
                                    weaght--;
                                  });
                                },
                                child: Icon(Icons.remove,color: Colors.white,),

                              ),


                            ],
                          )



                        ],
                      ),




                    ),
                    SizedBox(width: 20,),
                    mycard(
                      color: Colors.blue[50],
                      child: Column(
                        children: [
                          Text('Age',style: TextStyle(
                              color: Colors.black,
                              fontSize: 40,
                              fontWeight: FontWeight.bold


                          ),),
                          Text('${age.round()}',style: TextStyle(
                              color: Colors.black,
                              fontSize: 40,
                              fontWeight: FontWeight.bold


                          ),),
                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,

                            children: [
                              FloatingActionButton(
                                backgroundColor: Colors.blue[500],
                                onPressed: (){
                                  setState(() {
                                    age++;
                                  });
                                },
                                child: Icon(Icons.add,color: Colors.white,),

                              ),
                              SizedBox(width: 10,),
                              FloatingActionButton(
                                backgroundColor: Colors.blue[500],
                                onPressed: (){
                                  setState(() {
                                    age--;
                                  });
                                },
                                child: Icon(Icons.remove,color: Colors.white,),

                              ),


                            ],
                          )



                        ],
                      ),

                    ),


                  ],
                ),
              ),
            ),
            SizedBox(height: 15,),
            Container(
              width: double.infinity,
              height: 70,
              child: MaterialButton(

                height: 70,
                  minWidth: double.infinity,

                  color: Colors.blue,
                child: Text('Calculat',style: TextStyle(color: Colors.white),),
                onPressed: (){
                  double result =weaght  / pow(hight / 100, 2);
                  print(result.round());
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => natega(
                        age: age,
                        gender: ismale,
                        grade: result,



                      ),


                  ));






                },
              ),
            )






          ],




        ),
      ),








    );
  }
}

class mycard extends StatelessWidget {


   Widget child ;
   Color color;
 Function ontap;

 mycard({ this.color, this.ontap, this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(color:color,borderRadius: BorderRadius.circular(10) ),
        child: child,
        height: 200,
        width: 150,


      ),
    );
  }
}
