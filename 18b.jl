cs = open("18.txt") do f
    return [split(l,' ') for l in eachline(f)]
end

function run(cs, i, regs, input)
    output = []
    while i in 1:length(cs)
        c = cs[i]
        jmp = 1
        if c[1] == "snd"
            push!(output, regs[c[2]])
        elseif c[1] == "set"
            if Int(c[3][1]) > 60
                regs[c[2]] = regs[c[3]]
            else
                regs[c[2]] = parse(Int, c[3])
            end
        elseif c[1] == "add"
            if Int(c[3][1]) > 60
                y = regs[c[3]]
            else
                y = parse(Int, c[3])
            end
            regs[c[2]] += y
        elseif c[1] == "mul"
            if Int(c[3][1]) > 60
                y = regs[c[3]]
            else
                y = parse(Int, c[3])
            end
            regs[c[2]] *= y
        elseif c[1] == "mod"
            if Int(c[3][1]) > 60
                y = regs[c[3]]
            else
                y = parse(Int, c[3])
            end
            regs[c[2]] = mod(regs[c[2]], y)
        elseif c[1] == "rcv"
            if length(input) == 0
                return (i, regs, input, output, true)
            end
            regs[c[2]] = popfirst!(input)
        elseif c[1] == "jgz"
            if c[2] == "1" || regs[c[2]] > 0
                if Int(c[3][1]) > 60
                    jmp = regs[c[3]]
                else
                    jmp = parse(Int, c[3])
                end
            end
        end
        i += jmp
    end
end

function run2(cs)
    r0 = Dict("p" => 0, "a" => 0, "b" => 0, "i" => 0, "f" => 0)
    r1 = Dict("p" => 1, "a" => 0, "b" => 0, "i" => 0, "f" => 0)
    i0 = i1 = 1
    in0 = in1 = []
    sends = 0
    while true
        i0, r0, in0, out0 = run(cs, i0, r0, in0)
        push!(in1, out0...)
        i1, r1, in1, out1 = run(cs, i1, r1, in1)
        sends += length(out1)
        push!(in0, out1...)
        if length(out1) == 0
            break
        end
    end
    return sends
end

println(run2(cs))
