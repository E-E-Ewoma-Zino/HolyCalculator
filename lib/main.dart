import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'calculator.dart';
import 'CalcControl.dart';

void main() {
  runApp(
	MaterialApp(
	  debugShowCheckedModeBanner: false,
	  home: Scaffold(
		body: SafeArea(
		  child: MoneyCounter(),
		),
	  ),
	),
  );
}

class MoneyCounter extends StatefulWidget {
  @override
  _MoneyCounterState createState() => _MoneyCounterState();
}

//
Control control = Control();

List<int> caption = [];

Color active = Colors.white;
Color inActive = Color(0xa794947d);
Color textColor = Colors.white;
Color containerColor = Color(0xff444242);
//0xff73411c brown + bg-1 //bad ?
//0xff383535 dark + bg-2
//0xff2d2b2b

//only portrait rotation is allowed
void _portraitModeOnly() {
  SystemChrome.setPreferredOrientations([
	DeviceOrientation.portraitUp,
	DeviceOrientation.portraitDown,
  ]);
}

class _MoneyCounterState extends State<MoneyCounter> {
  @override
  Widget build(BuildContext context) {
	_portraitModeOnly();

	print('Ready!');

	String convertToString2() {
	  String numText = '';

	  for (int i = 0; i < caption.length; i++) {
		numText += caption[i].toString();
	  }
	  return numText;
	}

	String strText = convertToString2();

	void show(int num) {
	  print('strNum $num');
	  setState(() {
		caption.add(num);
	  });
	}

	print('caption $caption');

	Color colorController(int num) {
	  if (control.getCounter() == num) {
		return active;
	  }
	  return inActive;
	}

// This class will solve it all
	Calculator calculate = Calculator(
		num1000: control.getValue(1),
		num500: control.getValue(2),
		num200: control.getValue(3),
		num100: control.getValue(4),
		num50: control.getValue(5),
		num20: control.getValue(6),
		num10: control.getValue(7),
		num5: control.getValue(8));

	return Scaffold(
	  appBar: AppBar(
		centerTitle: true,
		backgroundColor: containerColor,
		//          this is the first column. it holds the total of he money
		title: Text(
		  'Total: ${calculate.add()}',
		  style: TextStyle(
			  fontSize: 25.00, fontWeight: FontWeight.bold, color: textColor),
		),
	  ),
	  body: Container(
		decoration: BoxDecoration(
//        color: Color(0xffcfd3d6),
		  image: DecorationImage(
			  image: AssetImage('assets/images/background-img2.png'),
			  fit: BoxFit.cover),
		),
		child: Column(
		  children: <Widget>[
//          this is the horizontal tab that shows the active money
			Expanded(
			  flex: 0,
			  child: Container(
				margin: EdgeInsets.all(8.00),
				decoration: BoxDecoration(
					color: containerColor,
					border: Border.all(width: 2.00, color: inActive),
					borderRadius: BorderRadius.circular(4.00)),
				child: Row(
				  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
				  children: <Widget>[
					buildText(colorController, 1000, 1),
					buildText(colorController, 500, 2),
					buildText(colorController, 200, 3),
					buildText(colorController, 100, 4),
					buildText(colorController, 50, 5),
					buildText(colorController, 20, 6),
					buildText(colorController, 10, 7),
					buildText(colorController, 5, 8),
				  ],
				),
			  ),
			),
//          this is the text to be typed.
			Expanded(
			  flex: 0,
			  child: Container(
				padding: EdgeInsets.all(10.00),
				decoration: BoxDecoration(
				  color: inActive,
				  border: Border.all(
					width: 2.00,
					color: containerColor,
				  ),
				  borderRadius: BorderRadius.circular(4.00),
				),
				child: Text(
				  '${control.placeholder(strText)}',
				  style: TextStyle(
					color: textColor,
				  ),
				),
			  ),
			),
//          this is the board that lines out all the money
			Expanded(
			  flex: 2,
			  child: Container(
				margin: EdgeInsets.all(8.00),
				decoration: BoxDecoration(
					color: containerColor,
					borderRadius: BorderRadius.circular(10.00)),
//              TODO: Style the Money numbers
				child: Padding(
				  padding: const EdgeInsets.symmetric(
					  vertical: 8.0, horizontal: 0.00),
				  child: Column(
//                  mainAxisAlignment: MainAxisAlignment.center,
					children: <Widget>[
//                    expanded for the user value
					  Expanded(
						child: Row(
						  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
						  children: <Widget>[
							buildTextContainer(colorController, 1000, 1),
							buildTextContainer(colorController, 500, 2),
						  ],
						),
					  ),
//                    expanded for total value TODO:
					  textValue(calculate, 1, 2),
					  Expanded(
						child: Row(
						  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
						  children: <Widget>[
							buildTextContainer(colorController, 200, 3),
							buildTextContainer(colorController, 100, 4),
						  ],
						),
					  ),
//                    expanded for total value TODO:
					  textValue(calculate, 3, 4),
					  Expanded(
						child: Row(
						  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
						  children: <Widget>[
							buildTextContainer(colorController, 50, 5),
							buildTextContainer(colorController, 20, 6),
						  ],
						),
					  ),
//                    expanded for total value TODO:
					  textValue(calculate, 5, 6),
					  Expanded(
						child: Row(
						  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
						  children: <Widget>[
							buildTextContainer(colorController, 10, 7),
							buildTextContainer(colorController, 5, 8),
						  ],
						),
					  ),
//                    expanded for total value TODO:
					  textValue(calculate, 7, 8)
					],
				  ),
				),
			  ),
			),
			Container(
			  margin: EdgeInsets.all(8.00),
//            i removed the expanded that parented this row
			  child: Row(
				children: <Widget>[
				  Expanded(
					flex: 20,
					child: Column(
					  mainAxisAlignment: MainAxisAlignment.center,
					  children: <Widget>[
						Row(
						  children: <Widget>[
//                  This is the button for numbers
//                TODO: Make the buttons look like number button
							buttonContainer(show, 7),
							buttonContainer(show, 8),
							buttonContainer(show, 9),
						  ],
						),
						Row(
						  children: <Widget>[
//                  This is the button for numbers
//                TODO: Make the buttons look like number button
							buttonContainer(show, 6),
							buttonContainer(show, 5),
							buttonContainer(show, 4),
						  ],
						),
						Row(
						  children: <Widget>[
//                  This is the button for numbers
//                TODO: Make the buttons look like number button
							buttonContainer(show, 1),
							buttonContainer(show, 2),
							buttonContainer(show, 3),
						  ],
						),
						Row(
						  children: <Widget>[
//                  This is the button for numbers
//                TODO: Make the buttons look like number button
							Expanded(
							  child: Container(
								decoration: BoxDecoration(
								  color: containerColor,
								  borderRadius: BorderRadius.circular(4.00),
								),
								width: double.infinity,
								margin: EdgeInsets.all(3.00),
								child: FlatButton(
								  padding: EdgeInsets.all(0.00),
								  onPressed: () {
									print('cancel');
									setState(() {
									  caption.clear();
									  control.cancel();
									});
								  },
								  child: Text(
									'clear',
									style: TextStyle(color: textColor),
								  ),
								),
							  ),
							),
							buttonContainer(show, 0),
							Expanded(
							  child: Container(
								decoration: BoxDecoration(
								  color: containerColor,
								  borderRadius: BorderRadius.circular(4.00),
								),
								width: double.infinity,
								margin: EdgeInsets.all(3.00),
								child: FlatButton(
								  padding: EdgeInsets.all(0.00),
								  onPressed: () {
									setState(() {
									  caption.clear();
									  control.next();
									  control.convertToInt();
									});
								  },
								  child: Icon(
									Icons.navigate_next,
									size: 35.00,
									color: textColor,
								  ),
								),
							  ),
							)
						  ],
						)
					  ],
					),
				  ),
				  Expanded(
					flex: 5,
					child: Container(
					  decoration: BoxDecoration(
						color: containerColor,
						borderRadius: BorderRadius.circular(4.00),
					  ),
					  width: double.infinity,
					  margin: EdgeInsets.all(3.00),
					  child: FlatButton(
						padding: EdgeInsets.all(0.00),
						onPressed: () {
						  print('cancel');
						  setState(() {
							control.clearAll();
							caption.clear();
							print('cancel ctr ${control.getCounter()}');
						  });
						},
						child: Icon(
						  Icons.cancel,
						  color: textColor,
						),
					  ),
					),
				  )
				],
			  ),
			)
		  ],
		),
	  ),
	);
  }

  Expanded textValue(Calculator calculate, int num1, int num2) {
	return Expanded(
	  child: Row(
		mainAxisAlignment: MainAxisAlignment.spaceAround,
		children: <Widget>[
		  Text(
			'-->${calculate.addOnly(num1)}',
			style: TextStyle(fontSize: 11.0, color: inActive),
		  ),
		  Text(
			'-->${calculate.addOnly(num2)}',
			style: TextStyle(fontSize: 11.0, color: inActive),
		  )
		],
	  ),
	);
  }

  GestureDetector buildTextContainer(
	  Color colorController(int num), int amount, int num) {
	return GestureDetector(
	  onTap: () {
		setState(() {
		  control.setActive(num);
		});
	  },
//      i removed the expanded that parented this text
	  child: Text(
		'₦$amount: ${control.getValue(num)}',
		style: TextStyle(
		  fontSize: 15.00,
		  fontWeight: FontWeight.bold,
		  color: colorController(num),
		),
		textAlign: TextAlign.center,
	  ),
	);
  }

//this shows the amount text on screen. from 1000 - 5 naira.
  Text buildText(Color colorController(int num), int amount, int num) {
	return Text(
	  '₦$amount',
	  style: TextStyle(
		fontSize: 13.00,
		color: colorController(num),
	  ),
	);
  }

//  button control
  Expanded buttonContainer(void show(int num), int intNum) {
	return Expanded(
	  child: Container(
		decoration: BoxDecoration(
		  color: containerColor,
		  borderRadius: BorderRadius.circular(4.00),
		),
		width: double.infinity,
		margin: EdgeInsets.all(3.00),
		child: FlatButton(
		  padding: EdgeInsets.all(0.00),
		  onPressed: () {
			print('$intNum');
			control.holdNum(intNum);

			show(intNum);
			print('captions $caption');
		  },
		  child: Text(
			'$intNum',
			style: TextStyle(fontSize: 20.00, color: textColor),
		  ),
		),
	  ),
	);
  }
}
