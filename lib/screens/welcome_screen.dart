import 'package:flash_chat_me/screens/login_screen.dart';
import 'package:flash_chat_me/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat_me/components/Rounded_button.dart';

class WelcomeScreen extends StatefulWidget {

static String id='welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin{
  AnimationController controller;
  Animation animation;
  @override
  void initState(){
    super.initState();

    controller=AnimationController(
      duration: Duration(seconds: 3),
      vsync:this,
    );

   // animation = CurvedAnimation(parent: controller, curve: Curves.decelerate);

    animation=ColorTween(begin: Colors.blueGrey,end: Colors.white).animate(controller);

    controller.forward();

    // animation.addStatusListener((status) {
    //     if(status==AnimationStatus.completed){
    //       controller.reverse(from: 1);
    //     }else if (status==AnimationStatus.dismissed){
    //       controller.forward();
    //     }
    // });

    controller.addListener(() {
      setState(() {

      });
      print(animation.value);
    });

  }

  void dispose(){
    controller.dispose();
    super.dispose();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60,
                  ),
                ),
                TypewriterAnimatedTextKit(
                  text:['Flash Chat'],
                  textStyle: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(title:'Log in', colour: Colors.lightBlueAccent,onPressed:(){
              Navigator.pushNamed(context,LoginScreen.id);
            },),
           RoundedButton(title:'Register', colour:Colors.blueAccent,onPressed: (){
             Navigator.pushNamed(context, RegistrationScreen.id);
           })
          ],
        ),
      ),
    );
  }
}

class RoundedButton extends StatelessWidget {

  RoundedButton({this.colour,this.title,@required this.onPressed});


    final Color colour;
    final String title;
    final Function onPressed;



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: colour,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            title,
          ),
        ),
      ),
    );
  }
}