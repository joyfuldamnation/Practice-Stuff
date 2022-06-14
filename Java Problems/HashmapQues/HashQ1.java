// Three elemets with zero sum

class Solution
{
    // arr[]: input array
    // n: size of the array
    //Function to find triplets with zero sum.
    public boolean findTriplets(int arr[] , int n)
    {
        //add code here.
        boolean result = false;

        for (int i = 0; i < n - 1; i++){
            HashSet<Integer> s = new HashSet<>();
            for (int j = i + 1; j < n; j++){
                int x = -(arr[i] + arr[j]);
                if (s.contains(x))
                {
                    result = true;
                }
                else
                {
                    s.add(arr[j]);
                }
            }
        }
        return result;
    }
}