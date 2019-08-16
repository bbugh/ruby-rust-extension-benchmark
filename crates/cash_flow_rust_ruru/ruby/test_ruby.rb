arr = Array(0...200)
buff = []
pairs = {}

arr.each_with_index do |a, id|
    arr.slice(id..arr.length).each do |aa|
        tmp_pair = [a, aa]
        if !buff.include?(tmp_pair)
            buff.push(tmp_pair)
            pairs.store(buff.length, tmp_pair)
        end
    end
end

puts pairs
