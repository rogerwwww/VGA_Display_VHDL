from math import *

q = []
# flag shows if the current point is already in range.
# if flag changes from 0 to 1, it shows that we have just entered the range;
# if flag changes from 1 to 0, it shows that we have just left the range.
flag = 0

for v in range(0, 350):
    for h in range(439, 839):
        # this expression calculates the range of heart. 639 and 171 are the offset values.
        if pow(((h - 639) / 80.0), 2) + pow((-(v - 171) / 80.0 - pow(pow(((h - 639) / 80.0), 2), 1.0 / 3)), 2) < 1:
            if flag == 0:
                temp = [v, h]
                flag = 1
        elif flag == 1:
            q.append([temp[0], temp[1], h])
            flag = 0

# write the result to "out.txt"
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