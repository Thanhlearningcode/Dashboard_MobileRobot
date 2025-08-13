#ifndef MODEL_H
#define MODEL_H

#include <QObject>

class Model : public QObject {
    Q_OBJECT

public:
    Model();
    ~Model();  // Đảm bảo khai báo destructor

    int motorSpeed() const;
    QString motorStatus() const;
    int batteryLevel() const;

public slots:
    void setMotorSpeed(int speed);
    void setMotorStatus(const QString &status);
    void setBatteryLevel(int level);

signals:
    void motorSpeedChanged(int speed);
    void motorStatusChanged(const QString &status);
    void batteryLevelChanged(int level);

private:
    int m_motorSpeed;
    QString m_motorStatus;
    int m_batteryLevel;
};

#endif // MODEL_H
