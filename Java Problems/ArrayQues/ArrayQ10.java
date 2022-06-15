//frequencies of limited range array elements

class Solution{
    //Function to cohttps://practice.geeksforgeeks.org/problems/frequency-of-array-elements-1587115620/1/?page=1&category[]=Hash&sortBy=submissions#discussionunt the frequency of all elements from 1 to N in the array.
    public static void frequencyCount(int arr[], int N, int P)
    {
        // code here
        int m;
        int count[] = new int[P];
        for(int i=0; i<N; i++){
            m = arr[i];
            count[m-1]++;
        }
        return count;
    }
}