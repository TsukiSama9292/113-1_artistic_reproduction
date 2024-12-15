# 使用 Docker 運行 Stable Diffusion WebUI

## 建立 Docker 容器，耐心等待
### 官方 docker compose
```bash
docker compose up -d
```
### Github docker compose
```bash
docker-compose up -d
```

## 啟動 Stable Diffusion WebUI，耐心等待
```bash
docker exec -it stabel_diffusion_webui /bin/bash
sudo chmod -R 777 /stable-diffusion-webui/outputs
```

## 打開瀏覽器，輸入 [http://localhost:61000](http://localhost:61000)

## 打開 Settings 設定
- 選擇 USER INTERFACE 選項
- 選擇 zh_cn 簡體中文
- 選擇 Reload UI