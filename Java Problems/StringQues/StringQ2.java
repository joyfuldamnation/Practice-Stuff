//Reverse words in a given string 

class Solution 
{
    //Function to reverse words in a given string.
    String reverseWords(String S)
    {
        // code here 
        String Strarr[] = S.split(".");
        int n = Strarr.length;
        String arrStr[] = new String[n];
        String result = "";
        for(int i=0; i<n; i++){
            arrStr[n - i - 1] = Strarr[i];
        }
        
        result = String.join(".", arrStr);
        return result;
    }
}