FROM zrr1999/zrr-base:latest

COPY . /boning-mlir
RUN apt-get update \
&& apt-get install -y cmake ninja-build gdb unzip \
&& apt-get install -y dotnet-sdk-6.0 \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/* \
&& brew install python@3.8 python@3.9 python@3.10 \
&& brew install typst \
&& pip3.8 install --no-cache-dir torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cpu \
&& pip3.8 install --no-cache-dir paddlepaddle==0.0.0 -f https://www.paddlepaddle.org.cn/whl/linux/cpu-mkl/develop.html \
&& pip3.8 install --no-cache-dir pre-commit

WORKDIR "/workspace"
EXPOSE 22
CMD /bin/bash -c "/run.sh && zsh"
