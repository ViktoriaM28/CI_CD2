#include <httplib.h>
#include <iostream>

int main() {
    // Создаем HTTP сервер
    httplib::Server server;

    // Обработчик GET запроса по корневому маршруту
    server.Get("/", [](const httplib::Request& req, httplib::Response& res) {
        res.set_content("Hello, C++!", "text/plain");
        res.status = 200; // Устанавливаем код состояния 200 (ОК)
    });

    // Запускаем сервер на порту 5000
    std::cout << "Server started at http://localhost:5000" << std::endl;
    server.listen("0.0.0.0", 5000);

    return 0;
}
