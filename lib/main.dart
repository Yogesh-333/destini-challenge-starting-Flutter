import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'story_brain.dart';

void main() => runApp(Destini());

class Destini extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: StoryPage(),
    );
  }
}


StoryBrain storyBrain=StoryBrain();
class StoryPage extends StatefulWidget {
  _StoryPageState createState() => _StoryPageState();
}
class _StoryPageState extends State<StoryPage> {
  @override
     Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
         padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
             decoration: BoxDecoration(
             color: Colors.lightBlueAccent,
             border: Border.all(
             color: Colors.black,
             width: 5,
             ),
             gradient: LinearGradient(
               begin: Alignment.bottomRight,
               end: Alignment.topLeft,

             colors: [Hexcolor('#29b6f6'),Hexcolor('40c4ff'),Hexcolor('#00e5ff'),Hexcolor('#00e5ff'),Hexcolor('#69f0ae')],
             ),
//              image:const DecorationImage(
//              image: AssetImage('images/background.png'),
//                fit: BoxFit.cover,
//              ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 12,
                child: Center(
                  child: Text(
                   storyBrain.getStory(),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25.0,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: RaisedButton(
                  elevation: 20.0,
                    splashColor: Colors.red[600],
                     shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.black)
                           ),
                   color: Colors.orange[300],
                   child: Text(
                  storyBrain.getChoice1(),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      storyBrain.nextStory(1);
                    }
                    );
                  },
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Expanded(
                flex: 2,
                child: Visibility(
                  visible: storyBrain.buttonShouldBeVisible(),
                  child: RaisedButton(
                    elevation: 20.0,
                    splashColor: Colors.orange[300],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.black) ,

                    ),
                    color: Colors.red[600],
                    child: Text(
                      storyBrain.getChoice2(),
                       style: TextStyle(
                         color: Colors.black,
                        fontSize: 20.0,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        storyBrain.nextStory(2);

                      });
//
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
