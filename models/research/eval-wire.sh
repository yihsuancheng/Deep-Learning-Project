#export PYTHONPATH=$PYTHONPATH:`pwd`:`pwd`/slim

CURRENT_DIR=$(pwd)
WORK_DIR="${CURRENT_DIR}/deeplab"
DATASET_DIR="datasets"

# Set up the working directories.
CUSTOM_DATASET_FOLDER="Custom_Dataset"
EXP_FOLDER="exp/train_on_trainval_set"
INIT_FOLDER="${WORK_DIR}/${DATASET_DIR}/${CUSTOM_DATASET_FOLDER}/${EXP_FOLDER}/init_models"
TRAIN_LOGDIR="${WORK_DIR}/${DATASET_DIR}/${CUSTOM_DATASET_FOLDER}/${EXP_FOLDER}/train"
EVAL_LOGDIR="${WORK_DIR}/${DATASET_DIR}/${CUSTOM_DATASET_FOLDER}/${EXP_FOLDER}/eval"
DATASET="${WORK_DIR}/${DATASET_DIR}/${CUSTOM_DATASET_FOLDER}/tfrecord"

#mkdir -p "${WORK_DIR}/${DATASET_DIR}/${CUSTOM_DATASET_FOLDER}/exp"
#mkdir -p "${TRAIN_LOGDIR}"
mkdir -p "${EVAL_LOGDIR}"

python "${WORK_DIR}"/eval.py \
--logtostderr \
--eval_split="val" \
--model_variant="xception_65" \
--atrous_rates=6 \
--atrous_rates=12 \
--atrous_rates=18 \
--output_stride=16 \
--decoder_output_stride=4 \
--eval_crop_size=513,513 \
--checkpoint_dir="${TRAIN_LOGDIR}" \
--eval_logdir="${EVAL_LOGDIR}" \
--dataset_dir="${DATASET}" \
--max_number_of_evaluations=1