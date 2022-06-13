//Leaders in an array 
//Given an array A of positive integers. Your task is to find the leaders in the array. 
//An element of array is leader if it is greater than or equal 
//to all the elements to its right side. The rightmost element is always a leader. 

class Solution{
    //Function to find the leaders in the array.
    static ArrayList<Integer> leaders(int arr[], int n){
        // Your code here
        int g=0;
        ArrayList<Integer> result = new ArrayList<>();
        for(int i=0;i<n;i++){
            if(arr[n-i-1]>=g){
                g=arr[n-i-1];
                result.add(arr[n-i-1]);
            }
        }
        Collections.reverse(result);
        return result;
    }
}
