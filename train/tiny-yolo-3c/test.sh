#!/bin/bash

PREFIX=tiny-yolo-voc-pablo_2c
BASE_DIR=/root/src/darknet
TRAIN_DIR=/root/src/darknet/train/$PREFIX

DATA_FILE=$TRAIN_DIR/${PREFIX}.data
CFG_FILE=$TRAIN_DIR/${PREFIX}.cfg
WEIGHTS_FILE=/root/models/train/${PREFIX}/${PREFIX}_final.weights
TEST_DIR=$TRAIN_DIR/test

cd $BASE_DIR

for FILE in $TEST_DIR/*.jpg
do
  echo "Procesando $f..."
  ./darknet detector test $DATA_FILE $CFG_FILE $WEIGHTS_FILE $FILE
  mv predictions.png $TRAIN_DIR/${PREFIX}_${FILE##*/}.png
done



PREFIX=tiny-yolo-3c
BASE_DIR=/root/src/darkflow
TRAIN_DIR=/root/src/darkflow/train/${PREFIX}
BACKUP_DIR=/root/models/train/${PREFIX}

CFG_FILE=$TRAIN_DIR/${PREFIX}.cfg
WEIGHTS_FILE=$BACKUP_DIR/${PREFIX}.weights

cd $BASE_DIR
./flow --test $TRAIN_DIR/test/ --model $CFG_FILE --load $WEIGHTS_FILE --gpu 0.9

