from math import *

q = []
flag = 0

for v in range(351, 551):
    for h in range(489, 689):
        if (h < 539 and h > 519) \
		or (pow(h - 539.0, 2) < 10000 - pow((v - 451.0), 2) and pow(h - 539.0,2) > 6400 - pow((v - 451.0), 2) and h >= 539):
            if flag == 0:
                temp = [v, h]
                flag = 1
        elif flag == 1:
            q.append([temp[0], temp[1], h])
            flag = 0

f = open('out.txt', 'w')
for i in q:
    f.write('(vCounter = ')
    f.write('%d' % i[0])
    f.write(' and hCounter >= ')
    f.write('%d' % i[1])
    f.write(' and hCounter < ')
    f.write('%d' % i[2])
    f.write(') or ')

f.close()