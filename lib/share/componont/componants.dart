
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

Widget  defoltbuttom({required String name,required void Function()? onpris}){

  return Container(
      height: 7.h,
      width: 90.w,


      child: ElevatedButton(

          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xff12CDD9),

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0.sp), // Adjust the radius as needed
            ),


          ),
          onPressed: onpris, child: Text(name,
        style: TextStyle(
            fontSize: 20
        ),
      )));



}


Widget roundboutom (
{
required  Widget wedjet,
  required Color color,

}
    ){

  return Container(
    height: 8.h,
    width: 17.w,
    child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: color,
            shape:RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(50.sp))
            )
        ),
        onPressed: (){}, child: wedjet),
  );
}


Widget customtextform({ required String hinttext,required TextEditingController? control,String? onchange,
  Widget? sufix,
  Widget? prefx


}){

  return
    Container(
      width: 88.w,
      height: 7.h,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey, // Change the border color here
          width: 1.5, // Change the border width here
        ),
        borderRadius: BorderRadius.circular(20.0.sp),
      ),
      child: TextFormField(

        onChanged: (input){
          onchange = input ;
        },

        controller: control,
        style: TextStyle(
          color: Colors.grey,

        ),
        decoration: InputDecoration(
          hintText: hinttext ,

          hintStyle: TextStyle(
              color: Colors.grey
          ),
          suffixIcon: sufix,
          prefixIcon: prefx,


          border: InputBorder.none, // Hide the default border
        ),
      ),
    );



}


Future navigate( context, screen){
    return Navigator.push(context, MaterialPageRoute(builder: (context) {
    return screen;
  },)) ;


}