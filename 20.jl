open("20.txt") do f
    minrow, minacc = 0, Inf
    for (i, l) in enumerate(eachline(f))
        nums = parse.(Int, split(filter(c -> !(c in "pva=<>"),l),','))
        acc = sum(abs.(nums[7:9]))
        if acc < minacc
            minrow, minacc = i-1, acc
        end
    end
    println(minrow)
end
