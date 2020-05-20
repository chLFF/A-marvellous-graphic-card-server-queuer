while true
do
    nvidia-smi > p.txt  # output redirection
    # python ps.py        # text process

    #-----------------------------------------------#
    # select cards
    #-----------------------------------------------#
    # python ps.py --card 1

    #-----------------------------------------------#
    # set a used memory threshold
    # threshold = total_momery - your_model_momery
    #-----------------------------------------------#
    # python ps.py --threshold 2000
    python ps.py --card 1 --threshold 1000

    var=$(cat p.txt)
    # echo $var

    if [ $var = "0" ]
    then
        echo "run on card #0"
        CUDA_VISIBLE_DEVICES=0 python alphaWGAN_256_IN_5.py --dataPath './udata/u609_256/' --savePath 'aWGAN_IN_5' --epoches 100000
    elif [ $var = "1" ]
    then
        echo "run on card #1"
        CUDA_VISIBLE_DEVICES=1 python alphaWGAN_256_SN.py --dataPath './udata/u609_256/' --savePath 'aSNGAN' --epoches 100000
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