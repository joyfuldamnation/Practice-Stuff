public class Main
{
    public static void main(String[] args) {
        String s = "what a wonderful sunset";
        char[] carr = s.toCharArray();
        boolean isspace = true;
        for(int i = 0; i<carr.length; i++){
            if(Character.isLetter(carr[i])){
                if(isspace){
                    carr[i]= Character.toUpperCase(carr[i]);
                    isspace=false;
                }
            }
            else{
                isspace=true;
            }
        }
        System.out.println(carr);

		/*int max = arr[0];
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
		System.out.println(smax);*/
    }
