function makelist(stop, steps)
    list = [0]
    for i in 1:stop
        list = circshift(list, -(steps+1))
        pushfirst!(list, i)
    end
    return list
end
println("Part 1: ", makelist(2017, 349)[2])

function afterzero(stop, steps)
    length = 1
    pos = 0
    afterzero = 0
    for i in 1:stop
        pos = (pos+steps) % length
        length += 1
        pos += 1
        if pos == 1
            afterzero = i
        end
    end
    return afterzero
end
println("Part 2: ", afterzero(50000000, 349))
