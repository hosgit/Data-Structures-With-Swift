//: Playground - noun: a place where people can play

import UIKit

class Node<T:Equatable>
{
   var  value: T
   var  next :Node<T>?
    
    init(value:T)
    {
        self.value = value
    }
}

class LinkedList<T:Equatable>
{
    var head:Node<T>?
    
    fileprivate func addNodeFirst(value:T)
    {
        let newNode = Node(value: value)
        if head == nil
        {
            head = newNode
        }
        else
        {
            newNode.next = head
            head = newNode
        }
    }
    
    fileprivate func addNodeLast(value:T)
    {
        let newNode = Node(value: value)
        if head == nil
        {
            head = newNode
        }
        else
        {
            var temp = head
            while temp?.next != nil
            {
                temp = temp?.next
            }
            temp?.next = newNode
        }
    }
    
   
    fileprivate func insertNode(value:T,at index:Int)
    {
        let newNode = Node(value: value)
        if head == nil
        {
            head = newNode
        }
        else if(index == 1)
        {
           newNode.next = head
           head = newNode
        }
        else
        {
            var temp = head
            for _ in 1..<index
            {
                temp = temp?.next
            }
            newNode.next = temp?.next
            temp?.next = newNode
        }
    }
    
    fileprivate func printList()
    {
        if head != nil
        {
            var temp = head
            var linkListStr = ""
            while temp != nil
            {
                linkListStr.append("\(temp!.value)->")
                temp = temp?.next
            }
            print(linkListStr)
        }
    }
    
    fileprivate func printReverse(currentHead:Node<T>?)
    {
       let temp = currentHead
        if temp == nil
        {
            return
        }
        printReverse(currentHead: temp?.next)
        print(temp?.value)
    }
//*******************************************************Operations**************************************************************************
    // Reverse the link list
    
    fileprivate func reverseLinkedListItrative()
    {
        guard  head != nil else {
            print("Empty list")
            return
        }
        var current = head
        var next:Node<T>?
        var prev:Node<T>?
        while current != nil
        {
           next = current?.next
           current?.next = prev
           prev = current
           current = next
        }
        head = prev
    }
    
    fileprivate func reverseLinkListRecursion()
    {
        
    }
    
    fileprivate func mergeTwoLinkedList(listOneCurrentHead:LinkedList<T>, listSecondCurrentHea:LinkedList<T>)
    {
        
    }
}





let myLinkList = LinkedList<Int>()
myLinkList.addNodeFirst(value: 10)
myLinkList.addNodeLast(value: 22)
myLinkList.addNodeLast(value: 33)
myLinkList.addNodeLast(value: 11)
myLinkList.addNodeFirst(value: 8)
myLinkList.insertNode(value: 100, at: 5)
myLinkList.printList()
//myLinkList.printReverse(currentHead: myLinkList.head)

let myLinkList2 = LinkedList<Int>()
myLinkList2.addNodeFirst(value: 24)
myLinkList2.addNodeLast(value: 31)
myLinkList2.addNodeLast(value: 40)
myLinkList2.addNodeLast(value: 47)
myLinkList2.addNodeLast(value: 48)

//myLinkList2.printList()

myLinkList.reverseLinkedListItrative()
myLinkList.printList()


















