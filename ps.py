import argparse

parser = argparse.ArgumentParser()
parser.add_argument('--card', nargs='+', type=int, default=[0, 1, 2, 3])
parser.add_argument('--threshold', type=int, default=100)

opt = parser.parse_args()

card = opt.card
threshold = opt.threshold

with open('p.txt', 'r+') as file:
    line = file.read()
    nl = []
    for i in [8, 11, 14, 17]:
        nl.append(int(line.split('\n')[i][36:40]))
    for i in card:
        if nl[i] < threshold:
            file.seek(0)
            file.truncate()
            file.write(str(i))
            # print(i)
            break
        if i == card[-1]:
            file.seek(0)
            file.truncate()
            file.write(str(4))
