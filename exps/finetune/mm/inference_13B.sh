#!/bin/bash
PRETRAINED=/path_to_save_lora/epoch0-iter59999
PRETRAINED_BASE=/path_to_save/alpacaLlava_llamaQformerv2Peft_13b
LLAMA_CONFIG="/path_to_your_accessory/configs/13B_params.json"
TOKENIZER=path_to_your_accessory/configs/tokenizer.model


data_parallel=fsdp
model_parallel=2

NCCL_TIMEOUT=8000 NCCL_BLOCKING_WAIT=1 NCCL_ASYNC_ERROR_HANDLING=1 NCCL_IB_DISABLE=1 \
CUDA_VISIBLE_DEVICES=0,7 torchrun --nproc-per-node=2 --master-port=11120 /path_to_your_accessory/demos/single_turn_mm_cloud.py \
--pretrained_path $PRETRAINED --pretrained_path_base $PRETRAINED_BASE --llama_type llama_qformerv2_cloud --llama_config $LLAMA_CONFIG --tokenizer_path $TOKENIZER
