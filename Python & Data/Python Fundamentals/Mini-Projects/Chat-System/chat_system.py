class User:
    def __init__(self, name):
        self.name = name

    def send_message(self, chatroom, content):
        message = Message(self, content)
        chatroom.add_message(message)


class Message:
    def __init__(self, sender, content):
        self.sender = sender
        self.content = content

    def display(self):
        print(f"{self.sender.name}: {self.content}")


class ChatRoom:
    def __init__(self):
        self.users = []
        self.messages = []

    def join(self, user):
        self.users.append(user)
        print(f"{user.name} joined the chat")

    def leave(self, user):
        self.users.remove(user)
        print(f"{user.name} left the chat")

    def add_message(self, message):
        self.messages.append(message)
        message.display()

    def show_history(self):
        print("\nChat History:")
        for msg in self.messages:
            msg.display()


# 🔹 Usage
chat = ChatRoom()

u1 = User("Harsh")
u2 = User("Prasansha")

chat.join(u1)
chat.join(u2)

u1.send_message(chat, "Hello!")
u2.send_message(chat, "Hi Harsh!")

chat.show_history()

chat.leave(u2)