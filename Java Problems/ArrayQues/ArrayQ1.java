//Given an array of size N-1 such that it only contains distinct 
//integers in the range of 1 to N. Find the missing element.

class Solution {
    int MissingNumber(int array[], int n) {
        // Your Code Here
        int sum=0;
        for(int i=0;i<n-1;i++){
            sum=sum+array[i];
        }
        int total=(n*(n+1))/2;
        return total-sum;
    }
}