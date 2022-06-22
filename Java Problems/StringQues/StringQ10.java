//Get min from stack in O(1)

class GfG
{
    int minEle;
    Stack<Integer> s;

    /*returns min element from stack*/
    int getMin()
    {
        if (s.isEmpty())
            return -1;
        else
            return minEle;

    }

    /*returns poped element from stack*/
    int pop()
    {
        // Your code here
        if (s.isEmpty())
        {
            return -1;
        }
        Integer t = s.pop();
        if (t < minEle)
        {
            int i= minEle;
            minEle = 2*minEle - t;
            return i;
        }
        else
        {
            return t;
        }
    }

    /*push element x into the stack*/
    void push(int x)
    {
        // Your code here
        if (s.isEmpty())
        {
            minEle = x;
            s.push(x);
        }
        if (x < minEle)
        {
            s.push(2*x - minEle);
            minEle = x;
        }
        else
            s.push(x);
    }
}
