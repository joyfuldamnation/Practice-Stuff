//Pairwise swap from a linked list


/* node class of the linked list

class Node
{
    int data;
    Node next;
    Node(int key)
    {
        data = key;
        next = null;
    }
}

*/


class Solution {
    // Function to pairwise swap elements of a linked list.
    // It should returns head of the modified list
    public Node pairwiseSwap(Node head)
    {
        // code here
        if (head != null && head.next != null) {

            /* Swap the node's data with data of next node */
            swap(head.data, head.next.data);

            /* Call pairWiseSwap() for rest of the list */
            pairWiseSwap(head.next.next);
        }
    }
}