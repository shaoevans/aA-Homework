require "byebug"
def sluggish_octopus(arr)
    longest = nil
    arr.each do |fish1|
        arr.each do |fish2|
            longest = fish1 if fish1.length > fish2.length
        end
    end
    longest
end

def dominant_octopus(arr)
    return arr.sort_by {|ele| ele.length}[-1]
end

def clever_octopus(arr)
    longest = ""
    arr.each {|fish| longest = fish if fish.length > longest.length }
    longest
end

def slow_dance(dir, arr)

    arr.length.times {|i| return i if dir == arr[i]}
end

def constant_dance(dir, hash)
    return hash[dir]
end

p sluggish_octopus(['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh'])
p dominant_octopus(['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh'])
p clever_octopus(['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh'])
tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
tiles_hash = {"up"=>0, "right-up"=>1, "right"=>2, "right-down"=>3, "down"=>4, "left-down"=>5, "left"=>6,  "left-up"=>7 }
p slow_dance("up", tiles_array)
debugger
p constant_dance("up", tiles_hash)