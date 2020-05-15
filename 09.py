with open('09.txt') as f:
    s = [c for c in f.read().strip()]

garbage = False
score = 0
level = 0
gscore = 0
while s:
    c = s.pop(0)
    if s and c == '!':
        c = s.pop(0)
    elif not garbage and c == '<':
        garbage = True
    elif garbage and c == '>':
        garbage = False
    elif not garbage and c != ',':
        if c == '{':
            level += 1
        else:
            score += level
            level -= 1
    elif garbage:
        gscore += 1

print('Part 1:',score)
print('Part 2:',gscore)
