// Delete without head pointer


/*
class Node
{
	int data ;
	Node next;
	Node(int d)
	{
		data = d;
		next = null;
	}
}
*/

//Function to delete a node without any reference to head pointer.
class Solution
{
    void deleteNode(Node del)
    {
        // Your code here
        if(del == null)
            return null;
        else{
            if(del.next == null){
                return null;
            }
            // store or swap but ( the data of current node will be deleted)
            del.data = del.next.data;
            del.next = del.next.next;
            return head;
        }
    }
}
