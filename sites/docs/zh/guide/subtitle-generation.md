## 字幕生成 📜

當前支援2種字幕生成方式：

- **edge**: 生成`速度快`，性能更好，對電腦配置沒有要求，但是品質可能不穩定
- **whisper**: 生成`速度慢`，性能較差，對電腦配置有一定要求，但是`品質更可靠`。

可以修改 `config.toml` 設定檔中的 `subtitle_provider` 進行切換

建議使用 `edge` 模式，如果生成的字幕品質不好，再切換到 `whisper` 模式

> 注意：

1. whisper 模式下需要到 HuggingFace 下載一個模型檔，大約 3GB 左右，請確保網路通暢
2. 如果留空，表示不生成字幕。

> 由於國內無法訪問 HuggingFace，可以使用以下方法下載 `whisper-large-v3` 的模型檔

下載地址：

- 百度網盤: https://pan.baidu.com/s/11h3Q6tsDtjQKTjUu3sc5cA?pwd=xjs9
- 誇克網盤：https://pan.quark.cn/s/3ee3d991d64b

模型下載後解壓，整個目錄放到 `.\MoneyPrinterTurbo\models` 裡面，
最後的檔案路徑應該是這樣: `.\MoneyPrinterTurbo\models\whisper-large-v3`

```
MoneyPrinterTurbo  
  ├─models
  │   └─whisper-large-v3
  │          config.json
  │          model.bin
  │          preprocessor_config.json
  │          tokenizer.json
  │          vocabulary.json
```
