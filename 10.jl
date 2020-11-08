f = open("10.txt")
cs = readline(f)
close(f)

function p1(ls)
    ns = collect(0:255)
    skip = 0
    shifts = 0
    for l in ls
        ns = circshift([reverse(ns[1:l]); ns[l+1:end]],-l-skip)
        shifts += l+skip
        skip += 1
    end
    ns = circshift(ns,shifts)
    return ns[1]*ns[2]
end
ls = [parse(Int, x) for x in split(cs,',')]
println("Part 1: ",p1(ls))

function p2(ls)
    ns = collect(0:255)
    skip = 0
    shifts = 0
    for i in 1:64
        for l in ls
            ns = circshift([reverse(ns[1:l]); ns[l+1:end]],-l-skip)
            shifts += l+skip
            skip += 1
        end
    end
    ns = circshift(ns,shifts)
    ds = [xor(ns[i:i+15]...) for i in 1:16:256]
    return string([string(x, base=16, pad=2) for x in ds]...)
end

suffix = [17, 31, 73, 47, 23]
ls = [[Int(c) for c in cs]; suffix]
println("Part 2: ", p2(ls))
