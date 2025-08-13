#include "Controller.h"

Controller::Controller(Model *model)
    : m_model(model) {}

Controller::~Controller() {
    // Destructor có thể để trống nếu không cần giải phóng tài nguyên đặc biệt
}

void Controller::onStartMotor() {
    m_model->setMotorStatus("Running");
    m_model->setMotorSpeed(100);  // Mặc định tốc độ động cơ là 100
}

void Controller::onStopMotor() {
    m_model->setMotorStatus("Stopped");
    m_model->setMotorSpeed(0);    // Dừng động cơ
}

void Controller::onUpdateBattery(int level) {
    m_model->setBatteryLevel(level);  // Cập nhật mức pin
}
