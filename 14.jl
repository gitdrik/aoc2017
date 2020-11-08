function knothash(ss)
    ls = [[Int(c) for c in ss]; [17, 31, 73, 47, 23]]
    ns = [0:255...]
    skip = 0
    shifts = 0
    for i in 1:64
        for l in ls
            ns = [ns[l:-1:1]; ns[l+1:end]]
            ns = circshift(ns, -l-skip)
            shifts += l+skip
            skip += 1
        end
    end
    ns = circshift(ns,shifts)
    ds = [xor(ns[i:i+15]...) for i in 1:16:256]
    return string([string(x, base=16, pad=2) for x in ds]...)
end

function disk()
    disk = zeros(Int, 128, 128)
    for i in 0:127
        kh = knothash(string("nbysizxe-", i))
        disk[i+1,:] = digits(parse(BigInt, kh, base=16),base=2, pad=128)
    end
    return disk
end

function flood(disk, flooded, row, col)
    pos = disk[row,col]
    flooded[row,col] = 1
    for (r, c) in [(row-1,col), (row+1,col), (row, col-1), (row, col+1)]
        if r in 1:128 && c in 1:128 && disk[r,c] == pos && flooded[r, c] == 0
            flooded = flood(disk, flooded, r, c)
        end
    end
    return flooded
end

function regions(disk)
    regions = 0
    flooded = zeros(Int, size(disk))
    for row in 1:size(disk,1)
        for col in 1:size(disk,2)
            if disk[row,col] == 1 && flooded[row,col] == 0
                regions += 1
                flooded = flood(disk, flooded, row, col)
            end
        end
    end
    return regions
end

println("Part 1: ", sum(disk()))
println("Part 2: ", regions(disk()))
