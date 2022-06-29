//Maximum Product of Increasing Subsequence of Size 3

class Solution{
    public:
    vector<int> maxProductSubsequence(int *arr , int n)
    {
        // Complete the function
        ArrayList<Integer> ans = new ArrayList<>();

        long mul = Long.MIN_VALUE;
        int max = Integer.MIN_VALUE;
        int rightMax[] = new int[n];
        for (int i = n - 1; i >= 0; i--) {
            if (arr[i] >= max) {
                max = arr[i];
                rightMax[i] = max;
            }
            else
                rightMax[i] = max;
        }
        int a = Integer.MIN_VALUE, b = Integer.MIN_VALUE,
                c = Integer.MIN_VALUE;
        TreeSet<Integer> ts = new TreeSet<>();
        int i = 0;
        while (i <= n - 1) {
            ts.add(arr[i]);
            int temp = ts.lower(arr[i]) != null
                    ? ts.lower(arr[i])
                    : -1;
            if (temp != -1 && arr[i] < rightMax[i]) {
                long tempMul = ((long)temp * (long)arr[i])
                        * (long)rightMax[i];
                if (tempMul > mul) {
                    mul = tempMul;
                    if (ans.size() > 0)
                        ans.removeAll(ans);
                    ans.add(temp);
                    ans.add(arr[i]);
                    ans.add(rightMax[i]);
                }
            }
            i++;
        }
        if (ans.size() == 0) {
            ans.add(-1);
        }
        long res = ans.get(0) * ans.get(1) * ans.get(2);
        return res;
    }

};
