//Given an array of size N containing only 0s, 1s, and 2s; sort the array 
//in ascending order.

class Solution
{
    public static void sort012(int a[], int n)
    {
        // code here 
        int num[]= new int[3];
        int x;
        for(int i=0; i<n; i++){
            x=a[i];
            num[x]++;
        }
        
        for(int i=0; i<num[0]; i++){
            a[i]=0;
        }
        for(int i=0; i<num[1]; i++){
            a[num[0]+i]=1;
        }
        for(int i=0; i<num[2]; i++){
            a[num[0]+num[1]+i]=2;
        }
        return a[];
    }
}
