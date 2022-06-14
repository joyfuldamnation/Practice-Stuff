class Solution
{
    //Function to find if there exists a triplet in the
    //array A[] which sums up to X.
    public static boolean find3Numbers(int A[], int n, int X) {

        // Your code Here
        boolean result = false;

        for (int i = 0; i < n - 1; i++){
            HashSet<Integer> set = new HashSet<>();
            for (int j = i + 1; j < n; j++){
                int y = X -(A[i] + A[j]);
                if (set.contains(y))
                {
                    result = true;
                }
                else
                {
                    set.add(A[j]);
                }
            }
        }
        return result;
    }
}
