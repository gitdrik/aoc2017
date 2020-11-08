cs = open("18.txt") do f
    return [split(l,' ') for l in eachline(f)]
end

function recover(cs)
    regs = Dict()
    snd = 0
    i = 1
    while i in 1:length(cs)
        c = cs[i]
        jmp = 1
        if c[1] == "snd"
            if !(c[2] in keys(regs))
                regs[c[2]] = 0
            end
            snd = regs[c[2]]
        elseif c[1] == "set"
            if Int(c[3][1]) > 60
                if !(c[3] in keys(regs))
                    regs[c[3]] = 0
                end
                regs[c[2]] = regs[c[3]]
            else
                regs[c[2]] = parse(Int, c[3])
            end
        elseif c[1] == "add"
            if Int(c[3][1]) > 60
                if !(c[3] in keys(regs))
                    regs[c[3]] = 0
                end
                y = regs[c[3]]
            else
                y = parse(Int, c[3])
            end
            if !(c[2] in keys(regs))
                regs[c[2]] = 0
            end
            regs[c[2]] += y
        elseif c[1] == "mul"
            if Int(c[3][1]) > 60
                if !(c[3] in keys(regs))
                    regs[c[3]] = 0
                end
                y = regs[c[3]]
            else
                y = parse(Int, c[3])
            end
            if !(c[2] in keys(regs))
                regs[c[2]] = 0
            end
            regs[c[2]] *= y
        elseif c[1] == "mod"
            if Int(c[3][1]) > 60
                if !(c[3] in keys(regs))
                    regs[c[3]] = 0
                end
                y = regs[c[3]]
            else
                y = parse(Int, c[3])
            end
            if !(c[2] in keys(regs))
                regs[c[2]] = 0
            end
            regs[c[2]] %= y
        elseif c[1] == "rcv"
            if c[2] in keys(regs) && regs[c[2]] != 0
                return snd
            end
        elseif c[1] == "jgz"
            if c[2] in keys(regs) && regs[c[2]] != 0
                if Int(c[3][1]) > 60
                    if !(c[3] in keys(regs))
                        regs[c[3]] = 0
                    end
                    jmp = regs[c[3]]
                else
                    jmp = parse(Int, c[3])
                end
            end
        end
        i += jmp
    end
end

println("Part 1: ", recover(cs))
