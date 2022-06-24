//Maximize toys

class Solution{
    static int toyCount(int N, int K, int arr[])
    {
        // code here
        Arrays.sort(arr);
        int tot=0;
        for(int i=0; i<N; i++){
            tot+=arr[i];
            if(tot>K){
                return i;
            }
            else if(tot==K){
                return i+1;
            }
        }
        return N;
    }
}