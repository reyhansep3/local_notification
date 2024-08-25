import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'SecondPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {

  @override
  _HomepageState createState() => _HomepageState();
}



class _HomepageState extends State<Homepage> {
  
  FlutterLocalNotificationsPlugin? localNotification;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var androidInitialize = new AndroidInitializationSettings('icon_burger');

    var IOSInitialize = new IOSInitializationSettings();
    var initialzationSettings = new  InitializationSettings(android:  androidInitialize, iOS: IOSInitialize);
    
    localNotification= new FlutterLocalNotificationsPlugin();
    localNotification!.initialize(initialzationSettings, onSelectNotification: onSelectionNotif);
  }

  Future _showNotification() async{
    var androidDetails = AndroidNotificationDetails(
      'notification_channel_id',
      'notification_added',
      sound: RawResourceAndroidNotificationSound('succeededmessagetone')
      ,playSound: true
      ,importance: Importance.high
      ,priority: Priority.high,
    );
    var iosDetails = new IOSNotificationDetails();
    var generalNotificationDetails = new NotificationDetails(android: androidDetails, iOS: iosDetails);
    await localNotification!.show(0, "Albert Einstein Jr.", "Hello, i love physics and hamburgers, dont forget to eat", generalNotificationDetails); 
  }
  
  Future<void> onSelectionNotif (String? payload) async{
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Secondpage()),
    );
  }

  Future _scheduleNotification() async{
    var androidDetails = AndroidNotificationDetails(
      'notification_channel_id',
      'notification_added',
      sound: RawResourceAndroidNotificationSound('succeededmessagetone')
      ,playSound: true
      ,importance: Importance.high
      ,priority: Priority.high,
    );
    var iosDetails = new IOSNotificationDetails();
    var generalNotificationDetails = new NotificationDetails(android: androidDetails, iOS: iosDetails);
    
    var scheduleTime = DateTime.now().add(Duration(seconds : 10));
    localNotification!.schedule(1, "Queen Alizabeth Jr.", "Dont forget to eat Taco and rest!", scheduleTime, generalNotificationDetails);
  }

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(scaffoldBackgroundColor: const Color(0xFFe8ebf1)),
      home: Scaffold(
        body: Center(
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.only(left: 20, top: 100, right: 20),
            child: Column(
              children: [
                SizedBox(height: 30,),
                Container(
                  child: Container(
                    child: new Image.network('https://i.pinimg.com/originals/51/91/ff/5191ff6f9c185ca58958409513eb5cb6.gif'),
                  ),
                ),
                SizedBox(height: 30,),
                Text(
                  "Lunch Time Notification!",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    ),
                ),
                SizedBox(height: 5,),
                Text("Get reminded by your friend to eat lunch!"),
                SizedBox(height: 30,),
                Container(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: _showNotification,
                    child: Text(
                      "Show Notification"
                    ),
                    style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: Color(0xff1C5D99)),
                  ),
                ),
                SizedBox(height: 30,),
                Container(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: _scheduleNotification,
                    child: Text(
                      "Schedule Notification"
                    ),
                    style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: Color(0xff1C5D99)),
                  ),
                ),
              ],
            ),
            ),
          ),
        ),
      );
  }
}
