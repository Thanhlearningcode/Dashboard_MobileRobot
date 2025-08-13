#include <QApplication>
#include <QQmlApplicationEngine>
#include "Model.h"
#include "Controller.h"  // Bao gồm Controller.h thay vì RobotController.h

int main(int argc, char *argv[]) {
    QApplication app(argc, argv);

    // Tạo đối tượng Model
    Model model;

    // Tạo đối tượng engine
    QQmlApplicationEngine engine;

    // Tạo đối tượng Controller và truyền Model vào
    Controller controller(&model);

    // Tải giao diện QML
    engine.load(QUrl(QStringLiteral("qrc:/View.qml")));

    return app.exec();  // Bắt đầu vòng lặp sự kiện của ứng dụng
}
