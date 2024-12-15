FROM ubuntu:jammy-20240911.1

# 系統更新與安裝必要套件
RUN apt update && apt upgrade -y && apt install wget git python3 python3-venv libgl1 libglib2.0-0 sudo -y

# Clone Stable Diffusion WebUI 儲存庫
RUN git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui
# 下載模型
RUN wget --content-disposition -P /stable-diffusion-webui/models/Stable-diffusion/ "https://civitai.com/api/download/models/143906?type=Model&format=SafeTensor&size=pruned&fp=fp16"
# 下載標籤工具
RUN git clone https://github.com/picobyte/stable-diffusion-webui-wd14-tagger.git stable-diffusion-webui/extensions/tagger
# 下載繁體中文
RUN git clone https://github.com/dtlnor/stable-diffusion-webui-localization-zh_CN.git stable-diffusion-webui/extensions/zh_cn
# 清理垃圾
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# 建立無密法 sudo 使用者
RUN useradd -m user
RUN echo 'user ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
USER user

# 設定權限
RUN sudo chown -R user:user /stable-diffusion-webui
RUN sudo chmod -R u+w /stable-diffusion-webui
RUN sudo chmod +x /stable-diffusion-webui/webui.sh

# 進入工作目錄
WORKDIR /stable-diffusion-webui

# 啟動
RUN ./webui.sh --exit