//First Repeating Element

class Solution {
    // Function to return the position of the first repeating element.
    public static int firstRepeated(int[] arr, int n) {
        // Your code here
        int min = -2;
        HashSet<Integer> set = new HashSet<>();
        for (int i=n-1; i>=0; i--){
            if (set.contains(arr[i]))
                min = i;
            else
                set.add(arr[i]);
        }
        return min+1;
    }
}