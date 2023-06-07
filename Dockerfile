FROM zrr1999/zrr-base:latest

COPY . /boning-mlir
RUN apt-get install -y cmake ninja-build gdb unzip \
&& apt-get install -y dotnet-sdk-6.0  # cmake plugin for vscode \
&& brew install python@3.8 python@3.9 python@3.10 python@3.11 \
&& brew install gitui typst 
RUN pip3 install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cpu 
RUN pip3 install pre-commit

# RUN pip install paddlepaddle  # support paddlepaddle
# RUN curl -fsSL https://xmake.io/shget.text | zsh  # install xmake

WORKDIR "/workspace"
EXPOSE 22
CMD ["zsh", "/run.sh"]