//: Playground - noun: a place where people can play

import Foundation

class Node // node
{
    var data: Int?
    var next: Node? = nil
}


class LinkedList {
    var head = Node()
    
   fileprivate func insert(data: Int) {
        if self.head.data == nil
        {
            self.head.data = data
        } else
        {
            var lastNode = self.head
            while lastNode.next != nil {
                lastNode = lastNode.next!
            }
            let newNode = Node()
            newNode.data = data
            lastNode.next = newNode
        }
    }
    
   fileprivate func printList() {
        var current: Node! = self.head
        while current != nil && current.data != nil {
            print("\(current.data!)")
            current = current.next
        }
    }
    
   fileprivate func addTwoSameSizeLinkedList(firsthead:Node?,sencondhead:Node?,carry:inout Int) ->Node?
    {
        if firsthead == nil
        {
            return nil
        }
         var sum = 0
        // print(sum)
       let resultHead = Node()
        // Rcurssion STACK to reach to end of the list and adding sum with each reacursion
       resultHead.next = addTwoSameSizeLinkedList(firsthead: firsthead?.next, sencondhead: sencondhead?.next,carry: &carry)
        if  firsthead?.data != nil && sencondhead?.data != nil // checking nill before unraping
        {
            sum = firsthead!.data! + sencondhead!.data! + carry
            carry = sum / 10
            sum = sum % 10
            resultHead.data = sum
        }
     return  resultHead
    }
}


// Method to print The addition
func printAddition(head:inout Node?)
{
    while (head != nil)
    {
        print(head!.data!);
        head = head?.next
    }

}

// Driver calls methods
// Creataiton of two number represented by  linkedlist
print("First List----------------------------------------")
let firstNumber = LinkedList()
firstNumber.insert(data:9)
firstNumber.insert(data:7)
firstNumber.insert(data:4)
firstNumber.insert(data:8)
firstNumber.insert(data:1)
firstNumber.printList()

print("second List----------------------------------------")

let secondNumber = LinkedList()
secondNumber.insert(data:1)
secondNumber.insert(data:2)
secondNumber.insert(data:1)
secondNumber.insert(data:5)
secondNumber.insert(data:2)

secondNumber.printList()


print("Addition----------------------------------------")
// calling addition with initial carry 0
var carry = 0
var addedNumber =  firstNumber.addTwoSameSizeLinkedList(firsthead: firstNumber.head, sencondhead: secondNumber.head, carry: &carry)
if carry > 0
{
    var firstDigitFromCarry:Node? =  Node()
    firstDigitFromCarry?.data = carry
    firstDigitFromCarry?.next =  addedNumber
    printAddition(head: &firstDigitFromCarry)
}
else
{
    printAddition(head: &addedNumber)
}



