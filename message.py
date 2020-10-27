import telegram
import sys 

CHAT_ID="1094536138"

def get_credentials(file_path):
    f = open(file_path)
    return f.readline().strip()

def get_chat_id(file_path):
    f = open(file_path)
    return f.readline().strip()

def main():
    cred = get_credentials("/code/telegram.token")
    chat_id = get_credentials("/code/telegram.id")
    message = " ".join(sys.argv[1:])
    bot = telegram.Bot(token=cred)
    bot.send_message(chat_id=chat_id, text=message)

if __name__ == "__main__":
    main()