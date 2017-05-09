#!/bin/bash

BASE_DIR=/root/src/darkflow
TRAIN_DIR=/root/src/darkflow/train/tiny-yolo-3c
BACKUP_DIR=/root/models/train/tiny-yolo-3c

CFG_FILE=$TRAIN_DIR/tiny-yolo-3c.cfg
WEIGHTS_FILE=/root/models/public/tiny-yolo.weights
DATASET_IMAGES=/root/databases/KITTIVOC/JPEGImages
DATASET_ANNOTATIONS=/root/databases/KITTIVOC/Annotations


cd $BASE_DIR
cp $TRAIN_DIR/tiny-yolo-3c.names labels.txt

./flow --model $CFG_FILE --load -1 --train --dataset $DATASET_IMAGES --annotation $DATASET_ANNOTATIONS --backup $BACKUP_DIR --gpu 0.9
