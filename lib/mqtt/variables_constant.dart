import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
// import 'package:shared_preferences/shared_preferences.dart';

//Single devices widget
String commandMessage = "";
int commandDigit = 0;


//MQTT EMQX Credentials
final client =
    MqttServerClient.withPort('broker.emqx.io', 'nurowapp_client123456789', 1883);
var pongCount = 0, connStatus = 0;
const pubTopic = 'Nurowapp/Appcommand';
final builder = MqttClientPayloadBuilder();
const subTopic = 'Nurowapp/Appresponse';
