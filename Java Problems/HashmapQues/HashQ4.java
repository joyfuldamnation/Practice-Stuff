//Zero Sum Subarrays

class Solution{
    //Function to count subarrays with sum equal to 0.
    public static long findSubarray(long[] arr ,int n)
    {
        //Your code here
        HashMap<Integer,ArrayList<Integer>> map = new HashMap<>();
        ArrayList<Pair> out = new ArrayList<>();
        int sum = 0;
        for (int i = 0; i < n; i++){
            sum += arr[i];
            if (sum == 0)
                out.add(new Pair(0, i));
            ArrayList<Integer> al = new ArrayList<>();
            if (map.containsKey(sum))
            {
                al = map.get(sum);
                for (int it = 0; it < al.size(); it++)
                {
                    out.add(new Pair(al.get(it) + 1, i));
                }
            }
            al.add(i);
            map.put(sum, al);
        }
    }
}