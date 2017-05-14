from math import *

q = []
flag = 0

for v in range(351, 551):
    for h in range(89, 289):
        if ((351.0-551)/(159-199) * (h-159) - (v-351) < 0 and (351.0-551)/(139-179) * (h-139) - (v-351) > 0) \
		or ((351.0-551)/(219-179) * (h-219) - (v-351) < 0 and (351.0-551)/(239-199) * (h-239) - (v-351) > 0):
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