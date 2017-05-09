#!/bin/bash

PREFIX=tiny-yolo-3c
BASE_DIR=/root/src/darkflow
TRAIN_DIR=/root/src/darkflow/train/${PREFIX}
BACKUP_DIR=/root/models/train/${PREFIX}

CFG_FILE=$TRAIN_DIR/${PREFIX}.cfg
WEIGHTS_FILE=/root/models/public/tiny-yolo.weights
DATASET_IMAGES=/root/databases/KITTIVOC/JPEGImages
DATASET_ANNOTATIONS=/root/databases/KITTIVOC/Annotations


cd $BASE_DIR
cp $TRAIN_DIR/${PREFIX}.names labels.txt

./flow --model $CFG_FILE --load $WEIGHTS_FILE --train --dataset $DATASET_IMAGES --annotation $DATASET_ANNOTATIONS --backup $BACKUP_DIR --gpu 0.9



