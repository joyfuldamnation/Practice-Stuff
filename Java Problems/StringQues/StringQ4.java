// String formation from substring

class Solution {
    int isRepeat(String s) {
        // code here
        /*int length = s.length();
        int period = -1;
        int i = 0;
        for (int j = 1; j < length; j++) {
            int currChar = s.charAt(j);
            int comparator = s.charAt(i);
            if (currChar == comparator) {
                period = (j - i);
                i++;
            }
            else {
                if (currChar == s.charAt(0)) {
                    i = 1;
                    period = j;
                }
                else {
                    i = 0;
                    period = -1;
                }
            }
        }
        period = (length % period != 0) ? -1 : period;
        if (period == -1){
            return 0;
        }
        else{
            return 1;
        }*/
        if((s + s).indexOf(s, 1) != s.length()){
            return 1;
        }
        else{
            return 0;
        }