tmux new-session -d -s serving -c /app/dynamo/benchmarks/router
tmux send-keys -t serving "./run_engines.sh --mockers --num-workers 8 --model-path deepseek-ai/DeepSeek-R1-Distill-Llama-8B --block-size 64 --speedup-ratio 2.0" C-m

tmux new-session -d -s frontend -c /app/dynamo/benchmarks/router
tmux send-keys -t frontend "python -m dynamo.frontend --router-mode kv --router-reset-states --http-port 8000" C-m
