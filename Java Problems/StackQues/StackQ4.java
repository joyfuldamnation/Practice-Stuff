//Next Greater Integer

class Solution
{
    //Function to find the next greater element for each element of the array.
    public static long[] nextLargerElement(long[] arr, int n)
    {
        // Your code here
        Stack<Long> s = new Stack<Long>();
        long result[] = new long[n];
        for (int i = n - 1; i >= 0; i--)
        {
            /* if stack is not empty, then
            pop an element from stack.
            If the popped element is smaller
            than next, then
            a) print the pair
            b) keep popping while elements are
            smaller and stack is not empty */
            if (s.isEmpty() == false)
            {
                while (s.isEmpty() == false && s.peek() <= arr[i])
                {
                    s.pop();
                }
            }
            if(s.isEmpty()){
                result[i]= -1;
            }
            else{
                result[i]= s.peek();
            }
            s.push(arr[i]);
        }

        return result;

        /*long[] result = new long[n];
        Stack<Integer> s = new Stack<Integer>();
        result[n-1] = -1;
        s.push(arr[0]);

        for(int i=0; i<n-1; i++){
            if(s.peek()<arr[i+1]){

            }

        }*/
        /*long checker= s.pop();
        long checked;
        for(i=1; i<n; i++){
            if(checker>s.peek(){
                result[n-i-1]=checker;
                checked=s.pop();
            }
        }*/
    }
}