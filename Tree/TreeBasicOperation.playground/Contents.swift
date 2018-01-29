//: Playground - noun: a place where people can play

import UIKit

//Generic Node only Comparable objcets are allowed
final class Node<T:Comparable>
{
    var data:T
    var left :Node?
    var right:Node?
    
    init(data:T)
    {
        self.data = data
    }
}

//Generic Tree
final class Tree<T:Comparable>
{
    let root:Node<T>
    
    init(root:Node<T>)
    {
        self.root = root
    }
    
    fileprivate func insertNewNode(currentRoot:Node<T>,newNode:Node<T>) // inserting a node to existing Tree
    {
        if newNode.data < currentRoot.data
        {
            if currentRoot.left == nil
            {
                currentRoot.left = newNode
            }
            else
            {
                insertNewNode(currentRoot: currentRoot.left!, newNode: newNode)
                
            }
        }
        
        else if newNode.data > currentRoot.data
        {
            if currentRoot.right == nil
            {
                currentRoot.right = newNode
            }
            else
            {
              insertNewNode(currentRoot: currentRoot.right!, newNode: newNode)
            }
        }
    }
    
    fileprivate func searchNode(currentRoot:Node<T>,searchableNode newNode :Node<T>) -> Bool // search a node
    {
        if currentRoot.data == newNode.data
        {
            return true
        }
        else if currentRoot.left != nil && newNode.data < currentRoot.data
        {
            return searchNode(currentRoot: currentRoot.left!, searchableNode: newNode)
        }
        
        else if currentRoot.right != nil && newNode.data > currentRoot.data
        {
            return searchNode(currentRoot: currentRoot.right!, searchableNode: newNode)
        }
        return false
    }
    private  func findMinumOnRight(root:Node<T>?)-> Node<T>?
    {
        var last = root
        while last?.left != nil {
            last = root?.left
        }
        return last
    }
    
    fileprivate func deleteNode(root currentRoot:Node<T>?,key:T)-> Node<T>?
    {
        var root = currentRoot
        if currentRoot == nil
        {
            return currentRoot
        }
        if key < currentRoot!.data
        {
            if currentRoot?.left != nil
            {
                currentRoot?.left = deleteNode(root: currentRoot?.left, key:key )
            }
           
        }
        else if key > currentRoot!.data
        {
            if currentRoot?.right != nil
            {
                currentRoot?.right = deleteNode(root: currentRoot?.right, key: key)
            }
        }
        else
        {
            
            if currentRoot?.left == nil && currentRoot?.right == nil
            {
                root = nil
            }
            
            else if currentRoot?.left == nil
            {
                root = currentRoot?.right
            }
            else if currentRoot?.right == nil
            {
                root = currentRoot?.left
            }
            else // root has more then one child
            {
             let nodeToDelete =  findMinumOnRight(root: currentRoot?.right)
             root?.data = nodeToDelete!.data
             root?.right = deleteNode(root: root?.right, key: nodeToDelete!.data)
            }
        }
        
        return root
    }
    
    
    fileprivate func inOrderTraverse(currentRoot:Node<T>)
    {
        if currentRoot.left != nil
        {
            inOrderTraverse(currentRoot: currentRoot.left!)
        }
        print(currentRoot.data)
        if currentRoot.right != nil
        {
            inOrderTraverse(currentRoot: currentRoot.right!)
        }
    }
}

let rootNode = Node<Int>(data: 66)
let node1 = Node<Int>(data: 55)
let node2 = Node<Int>(data: 60)
let node3 = Node<Int>(data: 77)
let node4 = Node<Int>(data: 70)
let node5 = Node<Int>(data: 80)
let node6 = Node<Int>(data: 44)
//
let node7 = Node<Int>(data: 99)



let newTree = Tree(root: rootNode)
newTree.insertNewNode(currentRoot: rootNode, newNode:node1 )
newTree.insertNewNode(currentRoot: rootNode, newNode:node2 )
newTree.insertNewNode(currentRoot: rootNode, newNode:node3 )
newTree.insertNewNode(currentRoot: rootNode, newNode:node4 )
newTree.insertNewNode(currentRoot: rootNode, newNode:node5 )
newTree.insertNewNode(currentRoot: rootNode, newNode:node6 )

newTree.inOrderTraverse(currentRoot: rootNode)


newTree.deleteNode(root: rootNode, key: 77)

newTree.inOrderTraverse(currentRoot: rootNode)


newTree.searchNode(currentRoot: rootNode, searchableNode:node7)// call to check tree


















