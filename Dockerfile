FROM zrr1999/zrr-base:latest

RUN apt install -y cmake ninja-build gdb unzip python3-pip
RUN apt install -y dotnet-sdk-6.0  # cmake plugin for vscode
RUN curl https://raw.githubusercontent.com/mitsuhiko/rye/main/scripts/install.sh | bash
RUN pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cpu
# RUN pip install paddlepaddle  # support paddlepaddle
# RUN curl -fsSL https://xmake.io/shget.text | zsh  # install xmake
RUN brew install gitui typst

WORKDIR "/workspace"
EXPOSE 22
CMD ["zsh", "/run.sh"]
