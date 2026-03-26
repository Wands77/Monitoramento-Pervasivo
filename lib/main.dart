import 'dart:io';
import 'package:flutter/material.dart';
import 'package:battery_plus/battery_plus.dart';
import 'package:geolocator/geolocator.dart';

void main() => runApp(MaterialApp(home: MonitorPervasivo()));

class MonitorPervasivo extends StatefulWidget {
  const MonitorPervasivo({super.key});

  @override
  _MonitorPervasivoState createState() => _MonitorPervasivoState();
}

class _MonitorPervasivoState extends State<MonitorPervasivo> {
  final TextEditingController _ipController = TextEditingController();
  final TextEditingController _portaController = TextEditingController();
  String _status = "Aguardando envio...";

  Future<void> enviarDados() async {
    try {
      setState(() => _status = "Coletando dados...");
      
      // Coleta Bateria
      int nivel = await Battery().batteryLevel;
      
      // Coleta GPS 
      Position pos = await Geolocator.getCurrentPosition();

      String mensagem = "Bateria: $nivel% | Lat: ${pos.latitude} | Lon: ${pos.longitude}";

      // Conecta ao Socket
      Socket socket = await Socket.connect(
        _ipController.text, 
        int.parse(_portaController.text),
        timeout: Duration(seconds: 5)
      );
      
      socket.write(mensagem);
      await socket.flush();
      await socket.close();

      setState(() => _status = "Enviado com sucesso!");
    } catch (e) {
      setState(() => _status = "Erro: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Monitor Pervasivo")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: _ipController, decoration: InputDecoration(labelText: "IP do Servidor")),
            TextField(controller: _portaController, decoration: InputDecoration(labelText: "Porta")),
            SizedBox(height: 20),
            ElevatedButton(onPressed: enviarDados, child: Text("Enviar Status Agora")),
            SizedBox(height: 20),
            Text(_status, style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
