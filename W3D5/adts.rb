class Stack
    def initialize
        @items = []
    end

    def push(el)
        @items << el
    end

    def pop
        @items.pop
    end

    def peek
        @items[items.length-1]
    end
end

class Queue
    def initialize
        @items = []
    end

    def enqueue(el)
        @items << el
    end

    def dequeue
        @items.shift
    end

    def peek
        @items[0]
    end
end

class Map
    def initialize
        @items = []
    end

    def set(key, value)
        @items.each do |arr| 
            arr[1] = value if arr[0] == key
            return 
        end
        @items << [key,value]
    end

    def get(key)
        @items.each {|arr| return arr[1] if arr[0] == key}
        return nil
    end

    def show
        @items
    end
end