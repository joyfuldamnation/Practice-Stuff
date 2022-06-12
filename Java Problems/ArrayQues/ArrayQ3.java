//Given an unsorted array A of size N that contains only non-negative integers,
//find a continuous sub-array which adds to a given number S.
//In case of multiple subarrays, return the subarray which comes first on 
//moving from left to right.


class Solution
{
    //Function to find a continuous sub-array which adds up to a given number.
    static ArrayList<Integer> subarraySum(int[] arr, int n, int s) 
    {
        // Your code here
        ArrayList<Integer> result = new ArrayList<>();
        int sum=0,i=0,j=0;
        while(sum!=s){
            if(sum<s){
                j++;
                if(j>n){
                    result.add(-1);
                    return result;
                }
                sum+=arr[j-1];
            }
            else if(sum>s){
                sum-=arr[i];
                i++;
            }
            
        }
        result.add(i+1);
        result.add(j);    

        return result;
    }
}