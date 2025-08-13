cmake_minimum_required(VERSION 3.5)

# Đặt tên cho dự án
project(RobotMonitoringSystem)

# Tìm kiếm các thành phần Qt5 cần thiết
find_package(Qt5 REQUIRED COMPONENTS Core Quick Qml Widgets)

# Định nghĩa thư mục chứa các tệp include
include_directories(
    ${CMAKE_SOURCE_DIR}/Inc  # Đảm bảo đường dẫn chính xác tới thư mục Inc
)
# ...existing code...
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)
# ...existing code...
# Định nghĩa các tệp nguồn (C++ files)
set(SOURCES
    Src/Model.cpp
    Src/Controller.cpp
    main.cpp
)

# Định nghĩa các tệp header (C++ files)
set(HEADERS
    Inc/Model.h  # Đảm bảo đường dẫn chính xác tới tệp Model.h
    Inc/Controller.h
)

# Thêm tệp QML
set(QML_FILES
    Inc/View.qml
)
# filepath: /home/thanh/Project/QT/CMakeLists.txt
set(RESOURCES
    Inc/resources.qrc
)

add_executable(${PROJECT_NAME} ${SOURCES} ${HEADERS} ${RESOURCES})


# Liên kết với các thư viện Qt cần thiết
target_link_libraries(${PROJECT_NAME} Qt5::Core Qt5::Quick Qt5::Qml Qt5::Widgets)

# Cài đặt các thư viện Qt cần thiết cho dự án
target_include_directories(${PROJECT_NAME} PRIVATE ${Qt5Core_INCLUDE_DIRS} ${Qt5Qml_INCLUDE_DIRS})
