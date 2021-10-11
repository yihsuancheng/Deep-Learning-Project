#export PYTHONPATH=$PYTHONPATH:`pwd`:`pwd`/slim
#
# From tensorflow/models/research/
#export PYTHONPATH=$PYTHONPATH:`pwd`:`pwd`/slim

# [Optional] for panoptic evaluation, you might need panopticapi:
# https://github.com/cocodataset/panopticapi
# Please clone it to a local directory ${PANOPTICAPI_DIR}
#touch ${PANOPTICAPI_DIR}/panopticapi/__init__.py
#export PYTHONPATH=$PYTHONPATH:${PANOPTICAPI_DIR}/panopticapi
#MODEL="MyModel" #or MYCARLAB_STUDIO
#
#TRAIN_BATCH_SIZE=1
#TRAIN_CROP_SIZE=1000
#TRAIN_VAL_RATIO=0.9
#NUM_OF_CLASSES=2

#NUM_ITERATIONS=20000
#
#STORAGE_DIR="DATA/${MODEL}"
#INPUT_DIR="${STORAGE_DIR}/Raw"
#OUTPUT_DIR="${STORAGE_DIR}/Dataset"
#
#MODEL_VARIANT="xception_71"
#
#INITCHECKPOINT_PATH="${STORAGE_DIR}/Model/init_model/model.ckpt"
#TRAINLOG_DIR="${STORAGE_DIR}/Model/train_log"
#CKPT_PATH="${TRAINLOG_DIR}/model.ckpt-${NUM_ITERATIONS}"
#FROZEN_GRAPH_PATH="${STORAGE_DIR}/Model/frozen_graph/frozen_inference_graph.pb"
#
#
#DATASET_DIR="${OUTPUT_DIR}/tfrecord"
#
#python build_dataset.py \
#    --input_path=${INPUT_DIR} \
#    --output_path=${OUTPUT_DIR} \
#    --train_crop_size=${TRAIN_CROP_SIZE} \
#    --train_val_ratio=${TRAIN_VAL_RATIO}
#
#python deeplab/train.py \
#    --logtostderr \
#    --model_variant=${MODEL_VARIANT} \
#    --dense_prediction_cell_json="deeplab/core/dense_prediction_cell_branch5_top1_cityscapes.json" \
#    --atrous_rates=6 \
#    --atrous_rates=12 \
#    --atrous_rates=18 \
#    --output_stride=16 \
#    --decoder_output_stride=4 \
#    --train_batch_size=${TRAIN_BATCH_SIZE} \
#    --training_number_of_steps="${NUM_ITERATIONS}" \
#    --fine_tune_batch_norm=false \
#    --initialize_last_layer=false \
#    --last_layers_contain_logits_only=true \
#    --tf_initial_checkpoint="${INITCHECKPOINT_PATH}" \
#    --train_logdir="${TRAINLOG_DIR}" \
#    --dataset_dir="${DATASET_DIR}" \
#    --num_of_classes=${NUM_OF_CLASSES} \
#    --train_crop_size="${TRAIN_CROP_SIZE},${TRAIN_CROP_SIZE}" \
#    --base_learning_rate=0.0001 \
#
#python deeplab/eval.py \
#    --logtostderr \
#    --model_variant=${MODEL_VARIANT} \
#    --dense_prediction_cell_json="deeplab/core/dense_prediction_cell_branch5_top1_cityscapes.json" \
#    --atrous_rates=6 \
#    --atrous_rates=12 \
#    --atrous_rates=18 \
#    --output_stride=16 \
#    --decoder_output_stride=4 \
#    --eval_logdir="${EVALLOG_DIR}" \
#    --dataset_dir="${DATASET_DIR}" \
#    --checkpoint_dir="${TRAINLOG_DIR}" \
#    --eval_crop_size="${TRAIN_CROP_SIZE},${TRAIN_CROP_SIZE}" \
#    --max_number_of_evaluations=1
#
#python deeplab/export_model.py \
#    --checkpoint_path=${CKPT_PATH} \
#    --export_path=${FROZEN_GRAPH_PATH} \
#    --model_variant=${MODEL_VARIANT} \
#    --atrous_rates=6 \
#    --atrous_rates=12 \
#    --atrous_rates=18 \
#    --output_stride=16 \
#    --decoder_output_stride=4 \
#    --num_classes=${NUM_OF_CLASSES} \
#    --crop_size=${TRAIN_CROP_SIZE} \
#    --crop_size=${TRAIN_CROP_SIZE} \
#    --inference_scales=1.0 \
#    --dense_prediction_cell_json="deeplab/core/dense_prediction_cell_branch5_top1_cityscapes.json" \

#python deeplab/train.py \
#   --logtostderr \
#   --training_number_of_steps=90000 \
#   --train_split="train" \
#   --model_variant="xception_65" \
#   --atrous_rates=6 \
#   --atrous_rates=12 \
#   --atrous_rates=18 \
#   --output_stride=16 \
#   --decoder_output_stride=4 \
#   --train_crop_size=769 \
#   --train_crop_size=769 \
#   --train_batch_size=1 \
#   --dataset="cityscapes" \
#   --tf_initial_checkpoint=${PATH_TO_INITIAL_CHECKPOINT} \
#   --train_logdir="${TRAIN_LOGDIR}"

# Set up the working environment.


CURRENT_DIR=$(pwd)
WORK_DIR="${CURRENT_DIR}/deeplab"
DATASET_DIR="datasets"

# Set up the working directories.
CUSTOM_DATASET_FOLDER="Custom_Dataset"
EXP_FOLDER="exp/train_on_trainval_set"
INIT_FOLDER="${WORK_DIR}/${DATASET_DIR}/${CUSTOM_DATASET_FOLDER}/${EXP_FOLDER}/init_models"
TRAIN_LOGDIR="${WORK_DIR}/${DATASET_DIR}/${CUSTOM_DATASET_FOLDER}/${EXP_FOLDER}/train"
DATASET="${WORK_DIR}/${DATASET_DIR}/${CUSTOM_DATASET_FOLDER}/tfrecord"

mkdir -p "${WORK_DIR}/${DATASET_DIR}/${CUSTOM_DATASET_FOLDER}/exp"
mkdir -p "${TRAIN_LOGDIR}"

NUM_ITERATIONS=1000
python "${WORK_DIR}"/train_copy.py \
--logtostderr \
--train_split="train" \
--model_variant="xception_65" \
--atrous_rates=6 \
--atrous_rates=12 \
--atrous_rates=18 \
--output_stride=16 \
--decoder_output_stride=4 \
--train_crop_size=513,513 \
--train_batch_size=1 \
--training_number_of_steps="${NUM_ITERATIONS}" \
--fine_tune_batch_norm=true \
--tf_initial_checkpoint="${INIT_FOLDER}/deeplabv3_pascal_train_aug/model.ckpt" \
--train_logdir="${TRAIN_LOGDIR}" \
--dataset_dir="${DATASET}"