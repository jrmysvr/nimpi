FROM balenalib/raspberry-pi-debian:latest

RUN sudo apt update && \
    sudo apt install -y \
    curl \
    git \
    build-essential \
    gcc-arm-linux-gnueabihf

RUN git clone https://github.com/WiringPi/WiringPi && \
    cd WiringPi && \
    ./build

RUN curl -L https://github.com/dom96/choosenim/releases/download/v0.7.4/choosenim-0.7.4_linux_amd64 --output choosenim
RUN chmod +x choosenim
RUN ./choosenim stable -y
ENV PATH="/root/.nimble/bin:${PATH}"
ENV PATH="/root/.choosenim/toolchains/nim-1.4.2/bin:${PATH}"

RUN nimble install https://github.com/ThomasTJdev/nim_wiringPiNim -y

WORKDIR /nimpi

COPY . /nimpi
CMD nimble release
