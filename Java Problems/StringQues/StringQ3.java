//Anagram
//Given two stringsaandbconsisting of lowercase characters. 
//The task is to check whether two given strings are an anagram 
//of each other or not. An anagram of a string is another string that 
//contains the same characters, only the order of characters can be different. 
//For example, act and tac are an anagram of each other.

class Solution
{    
    //Function is to check whether two strings are anagram of each other or not.
    public static boolean isAnagram(String a,String b)
    {
        
        // Your code here
        //int n1 = a.length();
        //int n2 = b.length();
        //if (n1 != n2)
            //return false;
        //sort(a);
        //sort(b);
        //for (int i = 0; i < n1; i++)
            //if (a.charAt(i) != b.charAt(i))
                //return false;
        //return true;
       
       
        /*int n = a.length();
        int[] count = new int[n];
        if (a.length() != b.length())
            return false;
        for(int i = 1; i < a.length(); i++)
        {
            count[a.charAt(i)]++;
            count[b.charAt(i)]--;
        }
        for(int i = 0; i < n; i++)
            if (count[i] != 0)
            {
                return false;
            }
        return true;*/
        
        String strA = a.replaceAll("\\s", "");
        String strB = b.replaceAll("\\s", "");
        boolean result = true;
        if (a.length() != b.length()){
            result = false;
        }
        else{
            char[] ArrayA = strA.toCharArray();
            char[] ArrayB = strB.toCharArray();
            Arrays.sort(ArrayA);
            Arrays.sort(ArrayB);
            result = Arrays.equals(ArrayA, ArrayB);
        }
        return result;
    }
}