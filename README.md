# A marvellous graphic card server queuing machine

# Process:
-1 inquiry.sh inquires the information of graphic card server with nvidia-smi and then redirect the output to text.txt

-2 process.py processes the text in text.txt

-3 inquiry.sh starts training in a free card if any, else sleeps for a while and then redo from -1

# Run
sh inquiry.sh

# setting
You can set
- a specific card number
- threshold of GPU memory
- your training command
- sleep time

in inquiry.sh
