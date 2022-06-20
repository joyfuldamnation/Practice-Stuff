// Reverse string using stack

class Solution {

    public String reverse(String S){
        //code here
        Stack r = new Stack();
        int len = S.length();
        for(int i=0 ; i<len ; i++){
            r.push(S.charAt(i));
        }
        String y="";
        for(int i=0 ; i<len ; i++){
            y += r.pop();
        }
        return y;
    }

}