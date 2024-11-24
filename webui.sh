# If you could not download the model from the official site, you can use the mirror site.
# Just remove the comment of the following line .
# 如果你無法從官方網站下載模型，你可以使用鏡像網站。
# 只需要移除下面一行的註解即可。

# export HF_ENDPOINT=https://hf-mirror.com

streamlit run ./webui/Main.py --browser.serverAddress="0.0.0.0" --server.enableCORS=True --browser.gatherUsageStats=False
