//Longest common prefix in an array


class Solution{
    String longestCommonPrefix(String arr[], int n){
        // code here
        if (n == 0)
            return "";
        if (n == 1)
            return arr[0].charAt(0);
        Arrays.sort(arr);
        int end = Math.min(a[0].length(), arr[n-1].length());
        int i = 0;
        while (i < end && arr[0].charAt(i) == arr[n-1].charAt(i) )
            i++;

        String pre = arr[0].substring(0, i);
        return pre;
    }
}