#ifndef CONTROLLER_H
#define CONTROLLER_H

#include <QObject>
#include "Model.h"

class Controller : public QObject {
    Q_OBJECT

public:
    Controller(Model *model);
    ~Controller();  // Đảm bảo khai báo destructor

private slots:
    void onStartMotor();
    void onStopMotor();
    void onUpdateBattery(int level);

private:
    Model *m_model;
};

#endif // CONTROLLER_H
