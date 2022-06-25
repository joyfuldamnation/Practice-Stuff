// Reverse a linked list


//function Template for Java

/* linked list node class:

class Node {
    int value;
    Node next;
    Node(int value) {
        this.value = value;
    }
}

*/

class Solution
{
    //Function to reverse a linked list.
    Node reverseList(Node head)
    {
        // code here
        if (head == null)
            return head;
        if (curr.next == null) {
            head = curr;
            curr.next = prev;
            return head;
        }
        Node next1 = curr.next;
        curr.next = prev;
        reverseUtil(next1, curr);
        return head;
    }
}
