class Node
{
    var left:Node?
    var right:Node?
    var data:Int
    
    init(value:Int)
    {
        self.data = value
    }
    
    func  insert(value:Int)
    {
        if value < data
        {
            if left == nil
            {
                left = Node(value: value)
            }
            else
            {
                left?.insert(value: value)
            }
        }
        else
        {
            if right == nil
            {
                right = Node(value: value)
            }
            else
            {
                right?.insert(value: value)
            }
        }
    }
    
    func  contains(value:Int)-> Bool
    {
        if value == data
        {
            return true
        }
        else if value < data
        {
            if left == nil
            {
                return false
            }
            else
            {
               return left!.contains(value: value)
            }
        }
        
        else
        {
            if value > data
            {
                if right == nil
                {
                    return false
                }
                else
                {
                    return right!.contains(value:value)
                }
            }
        }
        return false
    }
    
    func  inOrderPrint()
    {
        if left != nil
        {
            left?.inOrderPrint()
        }
        print(data)
        if right != nil
        {
            right?.inOrderPrint()
        }
    }
}

let root = Node(value: 10)
root.insert(value: 8)
root.insert(value: 11)
root.insert(value: 9)

root.contains(value: 0)
root.inOrderPrint()








