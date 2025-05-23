#!/bin/bash
PRETRAINED=/path_to_save_lora/epoch0
PRETRAINED_BASE=/path_to_save/alpacaLlava_llamaQformerv2
LLAMA_CONFIG="/path_to_your_accessory/configs/7B_params.json"
TOKENIZER=/path_to_your_accessory/LLaMA2-Accessory-main/accessory/configs/tokenizer.model


data_parallel=fsdp
model_parallel=1

CUDA_VISIBLE_DEVICES=4 torchrun --nproc-per-node=1 --master-port=11112 /path_to_your_accessory/demos/single_turn_mm_edge.py \
--pretrained_path $PRETRAINED --pretrained_path_base $PRETRAINED_BASE --llama_type llama_qformerv2_edge --llama_config $LLAMA_CONFIG --tokenizer_path $TOKENIZER
