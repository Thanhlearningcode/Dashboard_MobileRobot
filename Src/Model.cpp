#include "Model.h"

Model::Model()
    : m_motorSpeed(0), m_motorStatus("Stopped"), m_batteryLevel(100) {}

Model::~Model() {
    // Destructor có thể để trống hoặc xử lý gì đó nếu cần
}

int Model::motorSpeed() const {
    return m_motorSpeed;
}

QString Model::motorStatus() const {
    return m_motorStatus;
}

int Model::batteryLevel() const {
    return m_batteryLevel;
}

void Model::setMotorSpeed(int speed) {
    if (m_motorSpeed != speed) {
        m_motorSpeed = speed;
        emit motorSpeedChanged(m_motorSpeed);  // Phát tín hiệu khi thay đổi
    }
}

void Model::setMotorStatus(const QString &status) {
    if (m_motorStatus != status) {
        m_motorStatus = status;
        emit motorStatusChanged(m_motorStatus);  // Phát tín hiệu khi thay đổi
    }
}

void Model::setBatteryLevel(int level) {
    if (m_batteryLevel != level) {
        m_batteryLevel = level;
        emit batteryLevelChanged(m_batteryLevel);  // Phát tín hiệu khi thay đổi
    }
}
