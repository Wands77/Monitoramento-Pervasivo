# Trabalho 02 - Monitoramento Pervasivo 

Este projeto consiste em um sistema de monitoramento pervasivo composto por um aplicativo android (desenvolvido em Flutter) e um servidor de backend (desenvolvido em Python). O objetivo é coletar dados de sensores do dispositivo mobile e transmiti-los via sockets TCP para um servidor centralizado.

## 🚀 Funcionalidades

* **Coleta de Dados:** Obtém o nível de bateria e as coordenadas geográficas (Latitude e Longitude) do dispositivo.
* **Comunicação em Tempo Real:** Envia os dados formatados para um servidor Python através de Sockets TCP.
* **Persistência de Log:** O servidor exibe os dados no console e os armazena em um arquivo `log_sensores.txt` com timestamp.

## 🛠️ Tecnologias Utilizadas

* **App:** [Flutter](https://flutter.dev/) (Linguagem Dart)
* **Servidor:** [Python 3](https://www.python.org/)
* **Comunicação:** Sockets TCP/IP
* **Plugins Flutter:** `geolocator`, `battery_plus`

## 📦 Como Instalar e Rodar

### 1. Servidor (PC)
Certifique-se de ter o Python instalado. Na pasta `python_server`, execute:
```bash
python server.py
```
### 2. Instale o APK do Aplicativo android
Acesse o link abaixo e instale o apk em algum dispositivo android:
https://drive.google.com/drive/folders/1SO21AFJW-aDdggzag-V3kUeNr7UJtoVI?usp=sharing

> **IMPORTANTE:** Ao abrir o aplicativo, conceda a permissão de **Localização** (GPS) para que o monitoramento funcione. Se a permissão for negada, o app exibirá um alerta de erro e não enviará as coordenadas.

### 3. Instruções de uso
1. **Inicie o Servidor:** Execute o `server.py` no seu computador. Ele exibirá a mensagem: `Aguardando dados dos sensores...`.
2. **Identifique o IP:** No terminal do Windows, digite `ipconfig` e localize o seu **Endereço IPv4** (Ex: `192.168.1.17`).
3. **Configure o App:** - No campo **IP do Servidor**, digite o endereço identificado no passo anterior.
   - No campo **Porta**, utilize a porta padrão: `65432`.
4. **Envie os Dados:** Clique no botão de envio. O log aparecerá instantaneamente no terminal do PC e será salvo no arquivo de texto.

## Prints da tela de funcionamento do Aplicativo e janela do servidor ao receber os logs
# Tela do Aplicativo (sem executar os comandos)
<img width="1080" height="2400" alt="image" src="https://github.com/user-attachments/assets/7e75d398-9ae2-4fc3-af7a-91953fe2f5b2" />

# Tela de erro ao nao conceder permissão de localização 
<img width="720" height="1600" alt="image" src="https://github.com/user-attachments/assets/013911bb-1cf9-4887-a95a-1e1d4fbe3c0a" />

# Tela de erro ao não estar executando a comunicação naquele IP 
<img width="1080" height="2400" alt="image" src="https://github.com/user-attachments/assets/cbed144d-320c-49fd-a1ef-c1aeabf9dbc2" />

# Tela com o envio dos dados 
<img width="1080" height="2400" alt="image" src="https://github.com/user-attachments/assets/bcbdd5c7-f501-49c9-ae60-12b202987610" />

# Print da janela do servidor ao receber os logs do app
<img width="1245" height="243" alt="image" src="https://github.com/user-attachments/assets/e63b6445-c840-4d40-9c98-ea3f47043b74" />
