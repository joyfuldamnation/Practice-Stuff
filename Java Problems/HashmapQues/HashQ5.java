//uncommon elements of string

class Solution
{
    String UncommonChars(String A, String B)
    {
        // code here
        int[] mp1 = new int[26], mp2 = new int[26];
        int n = A.size(), m = B.size();

        for(int x=0; x<n ; x++){
            mp1[x-'a'] = 1;
        }

        for(int x=0; x<m ; x++){
            mp2[x-'a'] = 1;
        }

        String chars = "";

        for(int i = 0; i < 26; ++i){
            if(mp1[i]^mp2[i])
                chars+=char[i+'a'];
        }
        if(chars == "")
            return "-1";
        else
            return chars;
    }
}