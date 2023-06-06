FROM zrr1999/zrr-base:latest

COPY . /boning-mlir
RUN apt-get install -y cmake ninja-build gdb unzip
RUN apt-get install -y dotnet-sdk-6.0  # cmake plugin for vscode
RUN brew install python@3.8 python@3.9 python@3.10 python@3.11
RUN brew install typst
RUN echo "alias python=python3.8" >> /etc/profile
RUN echo "alias pip=pip3.8" >> /etc/profile
RUN pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cpu
RUN pip install paddlepaddle==0.0.0 -f https://www.paddlepaddle.org.cn/whl/linux/cpu-mkl/develop.html
RUN pip install pre-commit
# RUN curl -fsSL https://xmake.io/shget.text | zsh  # install xmake

WORKDIR "/workspace"
EXPOSE 22
CMD ["zsh", "/run.sh"]
