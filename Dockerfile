FROM zrr-base:latest

RUN apt install -y cmake ninja-build gdb
RUN curl -fsSL https://xmake.io/shget.text | zsh
RUN /home/linuxbrew/.linuxbrew/bin/brew install gitui
RUN apt install -y unzip
RUN apt install -y dotnet-sdk-6.0
RUN apt install -y python3-pip
RUN pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cpu

WORKDIR "/workspace"
EXPOSE 22
CMD ["zsh", "/run.sh"]
