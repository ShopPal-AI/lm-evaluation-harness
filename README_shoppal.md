# How to Run with docker compose

we support all lm-eval tasks, each task is described in a `.env` file where you should define:

1. `EXTRA`: extra package when pip install, see [more](https://github.com/ShopPal-AI/lm-evaluation-harness?tab=readme-ov-file#install)
2. `MODEL`: hf/vllm/openai-completions/openai-chat-completions/local-chat-completions, see [more](https://github.com/ShopPal-AI/lm-evaluation-harness?tab=readme-ov-file#model-apis-and-inference-servers)
3. `MODEL_ARGS`: Varies according to different MODEL parameters. see [more](https://github.com/ShopPal-AI/lm-evaluation-harness/blob/main/README.md)
4. `TASKS`: glue/super_glue/mmlu/hellaswag/lambada_openai/etc. see [more](https://github.com/ShopPal-AI/lm-evaluation-harness/blob/main/lm_eval/tasks/README.md)
5. `BATCH_SIZE`: auto. You can set according to the actual situation.
6. `OUTPUT_PATH`: evalution result output path.
7. `ZENO_PROJECT_NAME`: zeno project name for visualization.
8. `ZENO_API_KEY`: zeno api key, apply at [zeno](https://hub.zenoml.com/account)

## Quick Start

```
cp .env.hellaswag .env
docker compose up -d --build lm-eval
```

The above command will start a container to run lm evalution task of `hellaswag`. You can see logs via the following command:

```
docker compose ps
docker logs -f lm-evaluation-harness-lm-eval-1
```

after eval task finished, result will be output at `result` dir.

```
$ ls -l result/

drwxr-xr-x 2 root root 4096 Jan  9 17:27 Llama-2-7b-hf_hellaswag

```

You can also output result to zeno for visualization using the following command:

```
docker compose up -d --build visualize
```

! make sure you have set `ZENO_API_KEY` in your `.env`

go to `https://hub.zenoml.com/` for visualization charts.