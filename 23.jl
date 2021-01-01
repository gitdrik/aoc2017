using Primes

open("23.txt") do f
    cs = [split(l,' ') for l in eachline(f)]
    function run(cs, i, regs)
        output = 0
        oldh = 0
        while i in 1:length(cs)
            c = cs[i]
            jmp = 1
            if c[1] == "set"
                if c[3][1] ∈ keys(regs)
                    regs[c[2][1]] = regs[c[3][1]]
                else
                    regs[c[2][1]] = parse(Int, c[3])
                end
            elseif c[1] == "add"
                if c[3][1] ∈ keys(regs)
                    y = regs[c[3][1]]
                else
                     y = parse(Int, c[3])
                end
                regs[c[2][1]] += y
            elseif c[1] == "sub"
                if c[3][1] ∈ keys(regs)
                    y = regs[c[3][1]]
                else
                    y = parse(Int, c[3])
                end
                regs[c[2][1]] -= y

            elseif c[1] == "mul"
                if c[3][1] ∈ keys(regs)
                    y = regs[c[3][1]]
                else
                    y = parse(Int, c[3])
                end
                regs[c[2][1]] *= y
                output += 1
            elseif c[1] == "jnz"
                if c[2] == "1" || regs[c[2][1]] != 0
                    if c[3][1] ∈ keys(regs)
                        jmp = regs[c[3][1]]
                    else
                        jmp = parse(Int, c[3])
                    end
                end
            end
            i += jmp
        end
        return (cs, i, regs, output)
    end
    regs = Dict{Char,Int}(zip('a':'h', zeros(8)))
    i = 1
    cs, i, regs, output = run(cs, i, regs)
    println("Part 1: ", output)

    println("Part 2: ", sum((!isprime).(106500:17:123500)))
end
