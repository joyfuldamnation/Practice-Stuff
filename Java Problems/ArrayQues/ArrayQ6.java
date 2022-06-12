//Given an array of N integers, and an integer K, find the number of pairs 
//of elements in the array whose sum is equal to K

class Solution{   
    public int getPairsCount(int arr[], int n, int k) {
            // code here
            int c=0;
            for (int i=0; i<n; i++)
            {
                for (int j=i + 1; j<n; j++)
                {
                    if ((arr[j] + arr[i]) == k){
                        c++;
                    }
                }
            }return c;
        }
    };
    