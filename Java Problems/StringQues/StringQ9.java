//Valid Substring INCORRECT!!!!
//my Solution could be incorrect**

//User function Template for Java
class Solution {
    static int findMaxLen(String S) {
        // code here
        int open=0, close=0, result=0;
        for(int i=0; i<S.length(); i++){
            char c = S.charAt(i);
            if(c == ")"){
                close++;
            }
            else if(c == "("){
                open++;
            }
            if(close==open){
                result=Math.max(2*open,result);
            }
            if(close>open){
                open=0;
                close=0;
            }
        }
        return result;
    }
};