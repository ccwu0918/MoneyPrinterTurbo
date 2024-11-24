## 常見問題 🤔

### ❓如何使用免費的OpenAI GPT-3.5模型?

[OpenAI宣佈ChatGPT裡面3.5已經免費了](https://openai.com/blog/start-using-chatgpt-instantly)，有開發者將其封裝成了API，可以直接調用

**確保你安裝和啟動了docker服務**，執行以下命令啟動docker服務

```shell
docker run -p 3040:3040 missuo/freegpt35
```

啟動成功後，修改 `config.toml` 中的配置

- `llm_provider` 設置為 `openai`
- `openai_api_key` 隨便填寫一個即可，比如 '123456'
- `openai_base_url` 改為 `http://localhost:3040/v1/`
- `openai_model_name` 改為 `gpt-3.5-turbo`

### ❓AttributeError: 'str' object has no attribute 'choices'`

這個問題是由於 OpenAI 或者其他 LLM，沒有返回正確的回復導致的。

大概率是網路原因， 使用 **VPN**，或者設置 `openai_base_url` 為你的代理 ，應該就可以解決了。

### ❓RuntimeError: No ffmpeg exe could be found

通常情況下，ffmpeg 會被自動下載，並且會被自動檢測到。
但是如果你的環境有問題，無法自動下載，可能會遇到如下錯誤：

```
RuntimeError: No ffmpeg exe could be found.
Install ffmpeg on your system, or set the IMAGEIO_FFMPEG_EXE environment variable.
```

此時你可以從 https://www.gyan.dev/ffmpeg/builds/ 下載ffmpeg，解壓後，設置 `ffmpeg_path` 為你的實際安裝路徑即可。

```toml
[app]
# 請根據你的實際路徑設置，注意 Windows 路徑分隔符號為 \\
ffmpeg_path = "C:\\Users\\harry\\Downloads\\ffmpeg.exe"
```

### ❓生成音訊時報錯或下載視頻報錯

[issue 56](https://github.com/harry0703/MoneyPrinterTurbo/issues/56)

```
failed to generate audio, maybe the network is not available. 
if you are in China, please use a VPN.
```

[issue 44](https://github.com/harry0703/MoneyPrinterTurbo/issues/44)

```
failed to download videos, maybe the network is not available. 
if you are in China, please use a VPN.
```

這個大概率是網路原因，無法訪問境外的服務，請使用VPN解決。

### ❓ImageMagick is not installed on your computer

[issue 33](https://github.com/harry0703/MoneyPrinterTurbo/issues/33)

1. 按照 `示例配置` 裡面提供的 `下載地址`
   ，安裝 https://imagemagick.org/archive/binaries/ImageMagick-7.1.1-29-Q16-x64-static.exe, 用靜態程式庫
2. 不要安裝在中文路徑裡面，避免出現一些無法預料的問題

[issue 54](https://github.com/harry0703/MoneyPrinterTurbo/issues/54#issuecomment-2017842022)

如果是linux系統，可以手動安裝，參考 https://cn.linux-console.net/?p=16978

感謝 [@wangwenqiao666](https://github.com/wangwenqiao666)的研究探索

### ❓ImageMagick的安全性原則阻止了與暫存檔案@/tmp/tmpur5hyyto.txt相關的操作

[issue 92](https://github.com/harry0703/MoneyPrinterTurbo/issues/92)

可以在ImageMagick的設定檔policy.xml中找到這些策略。
這個檔通常位於 /etc/ImageMagick-`X`/ 或 ImageMagick 安裝目錄的類似位置。
修改包含`pattern="@"`的條目，將`rights="none"`更改為`rights="read|write"`以允許對檔的讀寫操作。

感謝 [@chenhengzh](https://github.com/chenhengzh)的研究探索

### ❓OSError: [Errno 24] Too many open files

[issue 100](https://github.com/harry0703/MoneyPrinterTurbo/issues/100)

這個問題是由於系統打開檔數限制導致的，可以通過修改系統的檔打開數限制來解決。

查看當前限制

```shell
ulimit -n
```

如果過低，可以調高一些，比如

```shell
ulimit -n 10240
```

### ❓AttributeError: module 'PIL.Image' has no attribute 'ANTIALIAS'

[issue 101](https://github.com/harry0703/MoneyPrinterTurbo/issues/101),
[issue 83](https://github.com/harry0703/MoneyPrinterTurbo/issues/83),
[issue 70](https://github.com/harry0703/MoneyPrinterTurbo/issues/70)

先看下當前的 Pillow 版本是多少

```shell
pip list |grep Pillow
```

如果是 10.x 的版本，可以嘗試下降級看看，有用戶回饋降級後正常

```shell
pip uninstall Pillow
pip install Pillow==9.5.0
# 或者降級到 8.4.0
pip install Pillow==8.4.0
```
