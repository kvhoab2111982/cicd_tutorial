FROM ubuntu:latest
MAINTAINER Kieu Hoa "hoab2111982@student.ctu.edu.vn"

# Cập nhật và cài đặt các gói cần thiết
RUN apt update -y && \
    apt install -y python3-pip python3-dev build-essential python3-venv

# Thêm mã ứng dụng vào thư mục /flask_app
ADD . /flask_app
WORKDIR /flask_app

# Tạo môi trường ảo
RUN python3 -m venv /venv

# Cài đặt các gói từ requirements.txt trong môi trường ảo
RUN /venv/bin/pip install --no-cache-dir -r requirements.txt

# Sử dụng Python từ môi trường ảo để chạy ứng dụng
ENTRYPOINT ["/venv/bin/python"]
CMD ["flask_docker.py"]


