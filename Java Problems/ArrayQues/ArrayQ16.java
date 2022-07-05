public class Main {
    int max = arr[0];
    int smax = Integer.MIN_VALUE;
    for(int i=0; i<arr.length; i++){
        if(arr[i]>max){
            smax=max;
            max= arr[i];
        }
        else if(arr[i]> smax && arr[i] != max){
            smax=arr[i];
        }
    }
    System.out.println(smax);
}
