//  First repeated charachter

class Solution
{
    String firstRepChar(String s)
    {
        // code here
        HashSet<Character> h = new HashSet<>();
        for (int i=0; i<=s.length()-1; i++)
        {
            char c = s.charAt(i);
            if (h.contains(c))
                return c;
            else
                h.add(c);
        }
        return "-1";
    }
}