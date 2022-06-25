// Nth element from the end of linked list


/* Structure of node

class Node
{
    int data;
    Node next;
    Node(int d) {data = d; next = null; }
}
*/

class GfG
{
    //Function to find the data of nth node from the end of a linked list.
    int getNthFromLast(Node head, int n)
    {
        // Your code here
        Node main_ptr = head;
        Node ref_ptr = head;

        int count = 0;
        if (head != null){
            while (count < n){
                if (ref_ptr == null){
                    return -1;
                }
                ref_ptr = ref_ptr.next;
                count++;
            }

            if(ref_ptr == null){
                if(head != null)
                    return head.data;
            }
            else{

                while (ref_ptr != null)
                {
                    main_ptr = main_ptr.next;
                    ref_ptr = ref_ptr.next;
                }
            }
        }
        return main_ptr.data;
    }
}