//: Playground - noun: a place where people can play
class Node
{
    var left :Node?
    var right:Node?
    var data:Int
    
    init(data:Int)
    {
        self.data = data
    }
}

class Tree
{
    var root:Node?
    
    init(root:Node)
    {
        self.root = root
    }
    
    func  insert(currentRoot:Node, data:Int)
    {
        if data <  currentRoot.data
        {
            if currentRoot.left == nil
            {
                currentRoot.left = Node(data: data)
            }
            else
            {
                insert(currentRoot: currentRoot.left!, data: data)
            }
        }
        else
        {
            if currentRoot.right == nil
            {
                currentRoot.right = Node(data: data)
            }
            else
            {
                insert(currentRoot: currentRoot.right!, data: data)
            }
        }
    }
    
    
    func  printTree(currentNode:Node)
    {
        if currentNode.left != nil
        {
            printTree(currentNode: currentNode.left!)
        }
        print(currentNode.data)
        
        if currentNode.right != nil
        {
            printTree(currentNode:currentNode.right!)
        }
    }
}


func checkEqualTrees(rootNodeA:Node? , rootNodeB:Node?)-> Bool
{
    if rootNodeA == nil && rootNodeB == nil
    {
        return true
    }
        
    else if rootNodeA?.data == rootNodeB?.data
    {
       
             return checkEqualTrees(rootNodeA:rootNodeA?.left , rootNodeB: rootNodeB?.left) && checkEqualTrees(rootNodeA:rootNodeA?.right , rootNodeB: rootNodeB?.right)
    }
    return false
}



let root1 = Node(data: 35)
let newTree1 = Tree(root: root1)
newTree1.insert(currentRoot: root1, data: 40)
newTree1.insert(currentRoot: root1, data: 21)
newTree1.insert(currentRoot: root1, data: 25)

newTree1.printTree(currentNode: newTree1.root!)


let root2 = Node(data: 35)
let newTree2 = Tree(root: root2)
newTree2.insert(currentRoot: root2, data: 40)
newTree2.insert(currentRoot: root2, data: 21)
newTree2.insert(currentRoot: root2, data: 25)

newTree2.printTree(currentNode: newTree2.root!)


checkEqualTrees(rootNodeA: root1, rootNodeB: root2)



