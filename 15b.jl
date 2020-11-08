function matches(a, b, iters)
    matches = 0
    for i in 1:iters
        a = a * 16807 % 2147483647
        b = b * 48271 % 2147483647
        while a % 4 != 0
            a = a * 16807 % 2147483647
        end
        while b % 8 != 0
            b = b * 48271 % 2147483647
        end
        matches += digits(a, base=2, pad=16)[1:16] == digits(b, base=2, pad=16)[1:16]
    end
    return matches
end

println(matches(699, 124, 5000000))
