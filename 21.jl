open("21.txt") do f
    perms = [a->a, a->rotr90(a), a->rot180(a), a->rotl90(a),
             a->a', a->rotr90(a'), a->rot180(a'), a->rotl90(a')]
    es = Dict{BitArray,BitArray}()
    for l ∈ eachline(f)
        a, b = split(l, " => ")
        for p ∈ perms
            es[p(hcat([[c == '#' for c in s] for s in split(a,'/')]...))] =
                hcat([[c == '#' for c in s] for s in split(b,'/')]...)
        end
    end
    function enhance(img, times)
        for i ∈ 1:times
            n = size(img, 1)
            step = n%2==0 ? 2 : 3
            nn = (step+1)*n÷step
            eimg = BitArray(undef,nn,nn)
            for i ∈ 1:n÷step
                ir = 1+(i-1)*step:i*step
                eir = 1+(i-1)*(step+1):i*(step+1)
                for j ∈ 1:n÷step
                    jr = 1+(j-1)*step:j*step
                    ejr = 1+(j-1)*(step+1):j*(step+1)
                    eimg[eir,ejr] = es[img[ir,jr]]
                end
            end
            img = eimg
        end
        return img
    end
    image = BitArray([0 1 0;0 0 1;1 1 1])
    println("Part 1: ", sum(enhance(image, 5)))
    println("Part 2: ", sum(enhance(image, 18)))
end
