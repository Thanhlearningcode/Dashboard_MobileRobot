Bước 2: Cài đặt Qt 5
Sau khi gỡ bỏ Qt 6, bạn có thể cài đặt Qt 5 và Qt Creator. Làm theo các bước sau:

Cài đặt Qt 5:

bash
Copy
sudo apt update
sudo apt install qt5-qmake qtbase5-dev qtcreator
qt5-qmake: Công cụ dùng để xây dựng dự án Qt 5.

qtbase5-dev: Các gói phát triển cơ bản cho Qt 5.

qtcreator: IDE chính thức của Qt, dùng để phát triển ứng dụng Qt.

Cài đặt các gói Qt Quick cho Qt 5:
Nếu bạn sử dụng QML và Qt Quick, bạn cần cài đặt các gói này:

bash
Copy
sudo apt install qtquickcontrols2
sudo apt install qtdeclarative5-dev
Cài đặt thêm các gói phụ thuộc nếu cần:
Nếu bạn cần thêm các gói khác cho Qt 5, ví dụ như Qt 5 Widgets hoặc Qt 5 Serial Port, bạn có thể cài đặt thêm:

bash
Copy
sudo apt install qtserialport5-dev
sudo apt install libqt5widgets5
Bước 3: Kiểm tra Qt 5
Sau khi cài đặt Qt 5 và Qt Creator, bạn có thể kiểm tra xem Qt 5 đã được cài đặt thành công hay chưa bằng cách sử dụng lệnh:

bash
Copy
qmake --version
Lệnh này sẽ hiển thị thông tin về phiên bản Qt đang được sử dụng. Đảm bảo rằng nó hiển thị Qt 5.x.x.

Bước 4: Sử dụng Qt Creator
Mở Qt Creator từ menu ứng dụng hoặc bằng cách gõ lệnh qtcreator trong terminal.

Trong Qt Creator, chọn Qt 5 làm phiên bản cho dự án của bạn.

Tạo hoặc mở dự án của bạn và bắt đầu phát triển ứng dụng.# Dashboard_MobileRobot
