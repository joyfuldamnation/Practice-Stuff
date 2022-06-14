//Largest subarray with 0 sum

class GfG
{
    int maxLen(int arr[], int n)
    {
        // Your code here
        HashMap<Integer, Integer> map = new HashMap<>();
        int tot = 0;
        int max = 0;

        for (int i = 0; i < n; i++){
            tot += arr[i];
            if (tot == 0){
                max = i + 1;
            }
            if (arr[i] == 0 && max == 0){
                max = 1;
            }
            Integer p = map.get(tot);
            if (p != null){
                max = Math.max(max, i - p);
            }
            else{
                map.put(tot, i);
            }
        }
        return max;
    }
}