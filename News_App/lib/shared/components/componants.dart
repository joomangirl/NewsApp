import 'package:flutter/material.dart';
import 'package:login_screen/shared/components/constants.dart';


Widget buildbutton({
  double width = double.infinity,
  Color color = Colors.blue,
  bool isUppercase = true,
  double radiuss = 20.0,
  @required Function onpressed,
  @required String text,
}) =>
    Container(
      width: width,
      child: MaterialButton(
        onPressed: onpressed,
        child: Text(
          isUppercase ? text.toUpperCase() : text.toLowerCase(),
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radiuss),
        color: color,
      ),
    );

Widget defultTextFormFaild({
  @required TextEditingController controlle,
  @required TextInputType tybe,
  @required String lable,
  @required IconData prefix,
  @required Function validate,
  IconData sufix,
  bool ispassowrd = false,
  Function onchange,
  Function onsubmit,
  Function hideen,
  Function onTap,
}) {
  return TextFormField(
    onChanged: onchange,
    onTap: onTap,
    onFieldSubmitted: onsubmit,
    validator: validate,
    controller: controlle,
    keyboardType: tybe,
    obscureText: ispassowrd,
    decoration: InputDecoration(
      labelText: lable,
      border: OutlineInputBorder(),
      prefixIcon: Icon(prefix),
      suffixIcon: sufix != null
          ? IconButton(
              icon: Icon(sufix),
              onPressed: hideen,
            )
          : null,
    ),
  );
}




Widget buildArticalItem(list,context) => Padding(
      padding: EdgeInsets.all(20.0),
      child: Row(
        children: [
          Container(
            width: 120.0,
            height: 120.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                    image: list['urlToImage'] == null
                        ? NetworkImage(
                            'https://upload.wikimedia.org/wikipedia/commons/thumb/7/70/Solid_white.svg/2048px-Solid_white.svg.png')
                        : NetworkImage('${list['urlToImage']}'),
                    fit: BoxFit.cover)),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
              child: Container(
            height: 120,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    ' ${list['title']}',
                    style: Theme.of(context).textTheme.bodyText1,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '${list['publishedAt']}',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ))
        ],
      ),
    );

Widget articalBuilder(@required list) {
  if (list.length > 0) {
    return ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) => buildArticalItem(list[index],context),
        separatorBuilder: (context, index) {
          return Container(
            height: 1,
            width: double.infinity,
            color: Colors.grey[300],
          );
        },
        itemCount: list.length // cubit.business.length
        );
  } else {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
