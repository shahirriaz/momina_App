import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:momina_app/networking_and_firebase.dart';
import '../consts.dart';
import '../components/bottom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';




class MilkScreen extends StatefulWidget {
  static const String id = 'milk_screen';
  @override
  _MilkScreenState createState() => _MilkScreenState();
}

class _MilkScreenState extends State<MilkScreen> {


  int amountMilkToSendToFireStore;
  String typeMilkToSendToFireStore;
  String commmentToSendToFireStore;


  TextEditingController _controller = TextEditingController();
  List<String> melkeType = ['Tine', 'Hipp', 'LakstoseFri'];

  TextEditingController _controller2 = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
          appBar: AppBar(
            leading: BackButton(
                color: Color(0xFF424242)
            ),
            title: Text(
              'Momi',
              style: TextStyle(
                color: Color(0xFF424242)
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: IntrinsicHeight(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: EdgeInsets.all(15.0),
                    alignment: Alignment.centerLeft,
                    child: Text('MILK',
                      style: kTitleStyle,
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () => bottomModalSheetType(context),
                        child: Amount_Milk_Card(controller2: _controller2),
                      )
                  ),
                  Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () => bottomModalSheetAmount(context),
                        child: Type_Milk_Card(controller: _controller),
                      )
                  ),
                  Expanded(
                      flex: 2,
                      child: Comment_Card(
                        onChange: (value){
                          setState(() {
                            commmentToSendToFireStore = value;
                          });
                        },
                      )
                  ),

                  BottomButton(
                    onTap: () {
                      Networking().validateInputFromMilkScreenAndSendToFireBase(context: context, amount: amountMilkToSendToFireStore, type: typeMilkToSendToFireStore, comment: commmentToSendToFireStore);
                    },
                    buttonTitle: 'SUBMIT',
                  ),


                ],
              ),
            ),
          )
      ),
    );
  }
  


  void bottomModalSheetAmount(context){
    int _selectedNumber = 0;
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) =>
        Container(
          height: MediaQuery.of(context).size.height / 3,
          alignment: Alignment.center,
          child: CupertinoPicker(
            backgroundColor: kActiveCardColourPrimary,
            scrollController: FixedExtentScrollController(
              initialItem: _selectedNumber,
            ),
            itemExtent: 32.0,
            onSelectedItemChanged: (int value) {
              _controller.text = melkeType[value];

              setState(() {
                typeMilkToSendToFireStore = _controller.text;
              });
            },
            children: new List<Widget>.generate(
                melkeType.length, (int index) {
              return new Center(
                child: new Text(melkeType[index]),
              );
            })

      ),
    ),
    );
  }



  void bottomModalSheetType(context){
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) =>
          Container(
            height: MediaQuery.of(context).size.height / 3,
            alignment: Alignment.center,
            child: CupertinoPicker(
              scrollController: FixedExtentScrollController(
              ),
              itemExtent: 32.0,
              backgroundColor: kActiveCardColourPrimary,
              onSelectedItemChanged: (int value) {
                _controller2.text = (value + 1).toString();
                setState(() {
                  amountMilkToSendToFireStore = int.parse(_controller2.text);
                });
              },
              children: new List<Widget>.generate(100,
                  (int index) =>
                  Center(
                      child: new Text('${index + 1} ml')
                  ),
            ),

            ),
          ),
    );
  }


}

class Comment_Card extends StatelessWidget  {

  Comment_Card({this.onChange});

  final Function onChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: kInactiveCardColourPrimary,
          borderRadius: BorderRadius.circular(25.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade400.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 6,
            offset: Offset(2, 3), // changes position of shadow
          ),
        ],
      ),
      margin: EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: TextField(
                      onChanged: onChange,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: 'comment',
                        labelStyle: TextStyle(
                          color: Color(0xFF424242),
                        ),

                      ),
                      style: TextStyle(
                        fontSize: 20.0,
                          color: Color(0xFF424242)
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Type_Milk_Card extends StatelessWidget {
  const Type_Milk_Card({
    Key key,
    @required TextEditingController controller,
  }) : _controller = controller, super(key: key);

  final TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: kInactiveCardColourPrimary,
          borderRadius: BorderRadius.circular(25.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade400.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 6,
            offset: Offset(2, 3), // changes position of shadow
          ),
        ],
      ),
      margin: EdgeInsets.all(15.0),
      child: AbsorbPointer(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: TextField(
            keyboardType: TextInputType.text,
            controller: _controller,
            decoration: InputDecoration(
              prefixIcon: Icon(
                FontAwesomeIcons.plus,
                color: Colors.black,
              ),
              contentPadding: EdgeInsets.only(top: 50),
                border: OutlineInputBorder(),
                labelText: 'type',
                labelStyle: TextStyle(
                  color: Color(0xFF424242),
                ),
            ),
            style: TextStyle(
              fontSize: 25.0,
                color: Color(0xFF424242)
            ),
          ),
        ),
      ),
    );
  }
}

class Amount_Milk_Card extends StatelessWidget {
  const Amount_Milk_Card({
    Key key,
    @required TextEditingController controller2,
  }) : _controller2 = controller2, super(key: key);

  final TextEditingController _controller2;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: kInactiveCardColourPrimary,
        borderRadius: BorderRadius.circular(25.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade400.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 6,
            offset: Offset(2, 3), // changes position of shadow
          ),
        ],
      ),
      margin: EdgeInsets.all(15.0),
      child: AbsorbPointer(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: TextField(
            keyboardType: TextInputType.text,
            controller: _controller2,

            decoration: InputDecoration(
              prefixIcon: Icon(
                FontAwesomeIcons.plus,
                color: Colors.black,
              ),
              contentPadding: EdgeInsets.only(top: 50),
              border: OutlineInputBorder(),
              labelText: 'amount',
              labelStyle: TextStyle(
                color: Color(0xFF424242),
              ),
            ),
            style: TextStyle(
                fontSize: 25.0,
                color: Color(0xFF424242)
            ),
          ),
        ),
      ),
    );
  }
}










