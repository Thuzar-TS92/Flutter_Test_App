import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
    @override
    Widget build(BuildContext context) {  
        getData();      
        return MaterialApp(            
            home: Body(),
        );
    }
}

class Body extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        final sizeVal = MediaQuery.of(context).size;
        return Scaffold(
                body: Column(
                    children: [
                        Container(
                            child: Image.asset('images/main-banner.jpg'),
                        ),
                        SizedBox(height: 2.0),  

                        Container(
                            child: Row(
                                children: [
                                    // sample width percentage'
                                    Align(
                                        alignment: Alignment.topRight,
                                        child: 
                                        Container(
                                            decoration: BoxDecoration(color: Colors.blueGrey[500]),                                         
                                            width: sizeVal.width*0.5,
                                            height: 50.0,
                                            child: Center(
                                                child: Text('求人　新着順', 
                                                textAlign: TextAlign.center, 
                                                style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 14.0,
                                                        fontWeight: FontWeight.bold,
                                                        ),
                                            ),
                                            ),
                                        ),
                                    ),

                                    Align(
                                        alignment: Alignment.topLeft,
                                        child: 
                                        Container(  
                                            decoration: BoxDecoration(color: Colors.teal[400]),                                
                                            width: sizeVal.width*0.5,
                                            height: 50.0,
                                            child: Center(
                                                child: Text('スカウト待ってます　新着順', 
                                                textAlign: TextAlign.center, 
                                                style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 14.0,
                                                        fontWeight: FontWeight.bold,
                                                        ),
                                                ),
                                            ),
                                            
                                        ),
                                    ),
                                ],
                            ),
                        ),

                        Container(
                            height: 150.0,
                            child: Card(
                                margin: EdgeInsets.all(10.0),
                                color: Colors.white,  
                                child: Padding(                                    
                                    padding: EdgeInsets.all(16.0),                       
                                    child: Row(
                                        children: [
                                            Container(
                                                child: Image.asset('images/user.png'),
                                                // width: 100.0,
                                                // alignment: Alignment.topRight,
                                            ),
                                            SizedBox(width: 10.0,),
                                            Container(
                                                // child: ListTile(
                                                //         leading: Icon(
                                                //             Icons.wb_sunny,
                                                //             color: Colors.cyan,
                                                //         ),
                                                //         title: Text('Three-line ListTile'),
                                                       
                                                //     ),
                                                child: Column(
                                                    children: [
                                                        Text('FIGHT FOR DEMOCRACY'),
                                                        SizedBox(width: 10.0,),
                                                        Text('This is title This is title', 
                                                            style: TextStyle(
                                                                fontSize: 12.0,      
                                                            ),
                                                            textAlign: TextAlign.right,
                                                        ),
                                                    ],
                                                ),
                                            )
                                        ],
                                    ),
                                )
                                
                            ),
                        ),
                    
                        
                    ],
                ),
            );
    }
}

void getData() async{
    http.Response response = await http.get('https://testoverseas-jobs.management-partners.co.jp/api/v1/jobs/1');
    // print(response.body);

    var dataDecode = jsonDecode(response.body);
    print(dataDecode['data']['details']['title']);
}