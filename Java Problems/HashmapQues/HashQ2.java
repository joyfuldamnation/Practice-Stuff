//Count number of pairs withgiven sum in array

class Solution {
    int getPairsCount(int[] arr, int n, int k) {
        // code here
        int c=0, y=0;
        HashSet<Integer> set = new HashSet<>();
        for(int i=0;i<n;i++){
            y=k-arr[i];
            if (set.contains(y)){
                c++;
                set.add(arr[i]);
            }
            else{
                set.add(arr[i]);
            }
        }
        return c;
    }
}

