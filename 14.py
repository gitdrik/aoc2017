from functools import reduce

def knothash(cs):
    ls = [ord(c) for c in cs]+[17, 31, 73, 47, 23]
    ns = [x for x in range(256)]
    skip = 0
    shifts = 0
    for i in range(64):
        for l in ls:
            ns = ns[(l-1)::-1] + ns[l:]
            ns = ns[(l+skip)%len(ns):] + ns[:(l+skip)%len(ns)]
            shifts += l+skip
            skip += 1
    ns = ns[-shifts%len(ns):] + ns[:-shifts%len(ns)]
    ds = [reduce(lambda x, y: x^y, list(ns)[i:i+16]) for i in range(0,256,16)]
    return ''.join([ '0'*(2-len(hex(i)[2:])) + hex(i)[2:] for i in ds])

def disk():
    disk = []
    for i in range(128):
        kh = knothash('nbysizxe-'+str(i))
        disk.append([int(c) for c in bin(int(kh,16))[2:].zfill(128)])
    return disk

def flood(disk, flooded, row, col):
    pos = disk[row][col]
    flooded[row][col] = True
    for nrc in [(row-1,col), (row+1,col), (row, col-1), (row, col+1)]:
        if nrc[0] in range(128) and nrc[1] in range(128) and disk[nrc[0]][nrc[1]] == pos and not flooded[nrc[0]][nrc[1]]:
            flooded = flood(disk, flooded, nrc[0], nrc[1])
    return flooded

def regions(disk):
    regions = 0
    flooded = [[False]*len(disk[0]) for x in disk]
    for row in range(len(disk)):
        for col in range(len(disk[0])):
            if disk[row][col] == 1 and not flooded[row][col]:
                regions += 1
                flooded = flood(disk, flooded, row, col)
    return regions

print('Part 1:', sum([sum(x) for x in disk()]))
print('Part 2:', regions(disk()))
