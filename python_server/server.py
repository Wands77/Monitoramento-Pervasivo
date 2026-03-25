import socket
from datetime import datetime

# Configurações do servidor
HOST = '0.0.0.0'  
PORT = 65432

def start_server():
    # Cria o socket TCP
    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
        try:
            s.bind((HOST, PORT))
            s.listen()
            print(f"--- Servidor de Monitoramento Pervasivo ---")
            print(f"Aguardando dados dos sensores no IP {HOST}:{PORT}...")

            while True:
                # Aceita a conexão do app Android
                conn, addr = s.accept()
                with conn:
                    # Recebe os dados (até 1024 bytes) e decodifica a String
                    data = conn.recv(1024).decode('utf-8')
                    
                    if data:
                        timestamp = datetime.now().strftime('%d/%m/%Y %H:%M:%S')
                        
                        # Formata a mensagem para exibição e log
                        log_entry = f"[{timestamp}] Recebido de {addr}: {data}"
                        
                        # Exibe no console
                        print(log_entry)
                        
                        # Salva em arquivo .txt (Log)
                        with open("log_sensores.txt", "a") as f:
                            f.write(log_entry + "\n")
        
        except Exception as e:
            print(f"Erro no servidor: {e}")

if __name__ == "__main__":
    start_server()
