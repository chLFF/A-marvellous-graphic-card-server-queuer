while true
do
    nvidia-smi > text.txt  # output redirection
    python process.py        # text process

    #-----------------------------------------------#
    # select cards, default all cards
    #-----------------------------------------------#
    # python process.py --card 1

    #-----------------------------------------------#
    # set a used memory threshold
    # threshold = total_momery - your_model_momery
    #-----------------------------------------------#
    # python process.py --threshold 2000
    # python process.py --card 1 --threshold 1000

    var=$(cat text.txt)
    # echo $var

    if [ $var = "0" ]
    then
        echo "run on card #0"
        CUDA_VISIBLE_DEVICES=0 python train.py
    elif [ $var = "1" ]
    then
        echo "run on card #1"
        CUDA_VISIBLE_DEVICES=1 python train.py
    elif [ $var = "2" ]
    then
        echo "run on card #2"
        python hi.py
    elif [ $var = "3" ]
    then
        echo "run on card #3"
        python hi.py
    else
        echo -n "."
        sleep 10m   #sleep time 10s / 10h
        continue
    fi
    break
done