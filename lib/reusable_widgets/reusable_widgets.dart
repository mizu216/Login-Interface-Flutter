import 'package:flutter/material.dart';

Image logoWidget(String imageName){
  return Image.asset(
    imageName,
    fit:BoxFit.fitWidth,
    width: 240,
    height: 240,
    color: Colors.white,
    );
}

TextField reusableTextField(String text,IconData icon,bool isPasswordType,TextEditingController controller){
  return TextField(
    obscureText: isPasswordType,

    enableSuggestions: ! isPasswordType,

    autocorrect: !isPasswordType,

    cursorColor: Colors.black,

    style: TextStyle(color: Colors.black.withOpacity(0.9)),

    decoration: InputDecoration(
      prefixIcon: Icon(
        icon,
        color: Colors.grey.withOpacity(0.9),
      ),
      labelText: text,
      labelStyle: TextStyle(
        color: Colors.grey.withOpacity(0.9)
      ),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: Colors.white.withOpacity(0.9),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none)
      )  
    ),

    keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
    
    controller: controller  
  );
}

Container reusableButton(BuildContext context, bool isLogin,Function onTap){
  return Container(
    width: MediaQuery.of(context).size.width,

    height:50,

    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),

    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(90)
    ),

    child: ElevatedButton(
      onPressed: (){
        onTap();
      },

      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith(
          (states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.black26;
            }
            return Colors.white;
          },
        ),

        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        )
      ),
      
      child: Text(
        isLogin?'Log in':'Sign Up',
        style: const TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        )
      )
    )
  );
}