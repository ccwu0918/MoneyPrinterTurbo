## 快速開始 🚀

<br>
只要提供一個影片 <b>主題</b> 或 <b>關鍵字</b> ，就可以全自動產生影片文案、影片素材、影片字幕、影片背景音樂，然後合成一個高清的短影片。
<br>

<h4>Web介面</h4>

![](/webui.jpg)

<h4>API介面</h4>

![](/api.jpg)

下載一鍵啟動包，解壓縮直接使用

### Windows

- 百度網盤: https://pan.baidu.com/s/1bpGjgQVE5sADZRn3A6F87w?pwd=xt16 擷取碼: xt16

下載後，建議先**雙擊執行** `update.bat` 更新到**最新程式碼**，然後雙擊 `start.bat` 啟動 Web 介面

### 其他系統

還沒有製作一鍵啟動包，看下面的 **安裝部署** 部分，建議使用 **docker** 部署，更加方便。

## 安裝部署 📥

### 前提條件

- 盡量不要使用 **中文路徑**，避免一些無法預料的問題
- 確保你的 **網路** 是正常的，VPN 需要開啟`全域流量`模式

#### ① 克隆程式碼

```shell
git clone https://github.com/harry0703/MoneyPrinterTurbo.git
```

#### ② 修改設定檔

- 將 `config.example.toml` 檔案複製一份，命名為 `config.toml`
- 依照 `config.toml` 檔案中的說明，配置 `pexels_api_keys` 和 `llm_provider`，並根據 llm_provider 對應的服務商，配置相關的
 API Key

#### ③ 配置大模型(LLM)

- 如果要使用 `GPT-4.0` 或 `GPT-3.5`，需要有 `OpenAI` 的 `API Key`，如果沒有，可以將 `llm_provider` 設為 `g4f` (
 一個免費使用 GPT 的開源庫 https://github.com/xtekky/gpt4free ，但是該免費的服務，穩定性較差，有時候可以用，有時候用不了)
- 或可使用到 [月之暗面](https://platform.moonshot.cn/console/api-keys) 申請。註冊就送
 15 元體驗金，可以對話 1500 次左右。然後設定 `llm_provider="moonshot"` 和 `moonshot_api_key`
- 也可以使用 通義千問，請看設定檔裡面的註解說明

### Docker 部署 🐳

#### ① 啟動 Docker

如果未安裝 Docker，請先安裝 https://www.docker.com/products/docker-desktop/

如果是 Windows 系統，請參考微軟的文件：

1. https://learn.microsoft.com/zh-cn/windows/wsl/install
2. https://learn.microsoft.com/zh-cn/windows/wsl/tutorials/wsl-containers

```shell
cd MoneyPrinterTurbo
docker-compose up
```

#### ② 存取 Web 介面

開啟瀏覽器，造訪 http://0.0.0.0:8501

#### ③ 存取 API 文檔

開啟瀏覽器，造訪 http://0.0.0.0:8080/docs 或 http://0.0.0.0:8080/redoc

### 手動部署 📦

> 影片教學

- 完整的使用示範：https://v.douyin.com/iFhnwsKY/
- 如何在 Windows 上部署：https://v.douyin.com/iFyjoW3M

#### ① 建立虛擬環境

建議使用 [conda](https://conda.io/projects/conda/en/latest/user-guide/install/index.html) 建立 python 虛擬環境

```shell
git clone https://github.com/harry0703/MoneyPrinterTurbo.git
cd MoneyPrinterTurbo
conda create -n MoneyPrinterTurbo python=3.10
conda activate MoneyPrinterTurbo
pip install -r requirements.txt
```

#### ② 安裝好 ImageMagick

###### Windows:

- 下載 https://imagemagick.org/archive/binaries/ImageMagick-7.1.1-30-Q16-x64-static.exe
- 安裝下載好的 ImageMagick，注意不要修改安裝路徑
- 修改 `設定檔 config.toml` 中的 `imagemagick_path` 為你的實際安裝路徑（如果安裝的時候沒有修改路徑，直接取消註解即可）

###### MacOS:

```shell
brew install imagemagick
```

###### Ubuntu

```shell
sudo apt-get install imagemagick
```

###### CentOS

```shell
sudo yum install ImageMagick
```

#### ③ 啟動 Web 介面 🌐

注意需要到 MoneyPrinterTurbo 項目 `根目錄` 下執行以下命令

###### Windows

```bat
conda activate MoneyPrinterTurbo
webui.bat
```

###### MacOS or Linux

```shell
conda activate MoneyPrinterTurbo
sh webui.sh
```

啟動後，會自動開啟瀏覽器

#### ④ 啟動 API 服務 🚀

```shell
python main.py
```

啟動後，可以查看 `API文檔` http://127.0.0.1:8080/docs 或 http://127.0.0.1:8080/redoc 直接在線調試接口，快速體驗。

## 許可證 📝

點選查看 [`LICENSE`](L​​ICENSE) 文件

## Star History

[![Star History Chart](https://api.star-history.com/svg?repos=harry0703/MoneyPrinterTurbo&type=Date)](https://star-history.com/#harry0703/MoneyPrinterTurbo&Date)
