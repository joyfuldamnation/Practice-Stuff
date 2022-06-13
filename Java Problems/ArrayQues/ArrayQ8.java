//Find Missing And Repeating 
//Given an unsorted array Arr of size N of positive integers. 
//One number 'A' from set {1, 2, …N} is missing and one number 'B' occurs twice 
//in array. Find these two numbers.

class Solve {
    int[] findTwoElement(int arr[], int n) {
        // code here
        int count[] = new int[n];
        int repmis[] = new int[2];
        int x;
        for(int i=0;i<n;i++){
            x=arr[i];
            count[x-1]++;
        }
        for(int i=0;i<n;i++){
            if(count[i]==2){
                repmis[0]=i+1;
            }
            else if(count[i]==0){
                repmis[1]=i+1;
            }    
        }
        return repmis;
    }
}