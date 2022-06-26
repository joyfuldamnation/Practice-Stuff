//Equivalent Sub-arrays



class Solution
{
    // Method to calculate distinct sub-array
    static int countDistinctSubarray(int arr[], int n)
    {
        HashMap<Integer, Integer>  vis = new HashMap<Integer,Integer>(){
            @Override
            public Integer get(Object key) {
                if(!containsKey(key))
                    return 0;
                return super.get(key);
            }
        };

        for (int i = 0; i < n; ++i)
            vis.put(arr[i], 1);
        int k = vis.size();

        vis.clear();
        int ans = 0, right = 0, window = 0;

        for (int left = 0; left < n; ++left)
        {
            while (right < n && window < k)
            {
                vis.put(arr[right], vis.get(arr[right]) + 1);

                if (vis.get(arr[right])== 1)
                    ++window;

                ++right;
            }
            if (window == k)
                ans += (n - right + 1);
            vis.put(arr[left], vis.get(arr[left]) - 1);
            if (vis.get(arr[left]) == 0)
                --window;
        }
        return ans;
    }
}

