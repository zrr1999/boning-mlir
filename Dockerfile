FROM zrr1999/zrr-base:latest

RUN apt install -y cmake ninja-build gdb unzip python3-pip
RUN apt install -y dotnet-sdk-6.0
RUN curl -fsSL https://xmake.io/shget.text | zsh
RUN curl https://raw.githubusercontent.com/mitsuhiko/rye/main/scripts/install.sh | bash
RUN brew install gitui typst
RUN pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cpu
# RUN pip install paddlepaddle

WORKDIR "/workspace"
EXPOSE 22
CMD ["zsh", "/run.sh"]
