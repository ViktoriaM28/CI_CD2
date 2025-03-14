# Используем официальный образ C++ (например, gcc)
FROM gcc:latest

# Устанавливаем рабочую директорию внутри контейнера
WORKDIR /app

# Копируем исходный код в контейнер
COPY main.cpp .

# Устанавливаем зависимости (cpp-httplib)
RUN apt-get update && apt-get install -y git
RUN git clone https://github.com/yhirose/cpp-httplib.git

# Компилируем программу
RUN g++ -o server main.cpp -Icpp-httplib -lpthread

# Открываем порт 5000 для HTTP запросов
EXPOSE 5000

# Команда, которая будет выполнена при запуске контейнера
CMD ["./server"]
