//You are given a string s. You need to reverse the string.

class Reverse
{
    // Complete the function
    // str: input string
    public static String reverseWord(String str)
    {
        // Reverse the string str
        String rts = new String();
        for(int i=0; i<str.length(); i++){
            rts += str.charAt(str.length() - i -1);
        }
        return rts;
    }
}