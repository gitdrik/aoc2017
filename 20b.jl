ps = open("20.txt") do f
    ps = reshape([],9,0)
    for (i, l) in enumerate(eachline(f))
        ps = [ps parse.(Int, split(filter(c -> !(c in "pva=<>"),l),','))]
    end
    return ps
end

function run(ps)
    n = Inf
    while true
        nps = reshape([],9,0)
        for i in 1:size(ps,2)
            if !(ps[1:3,i] in collect(eachcol([ps[1:3,1:i-1] ps[1:3,i+1:end]])))
                nps = [nps ps[:,i]]
            end
        end
        ps = nps
        if size(ps, 2) < n
            n = size(ps, 2)
            println(n)
        end
        ps[4:6,:] .+= ps[7:9,:]
        ps[1:3,:] .+= ps[4:6,:]
    end
end

run(ps)
