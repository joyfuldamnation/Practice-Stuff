// Validate IP address


class Solution {

    public boolean isValid(String s) {
        // Write your code here
        //Boolean valid=0;
        //String[] aos = s.split(".", 4);
        boolean b1 = false;
        StringTokenizer t = new StringTokenizer(s, ".");
        int a = Integer.parseInt(t.nextToken());
        int b = Integer.parseInt(t.nextToken());
        int c = Integer.parseInt(t.nextToken());
        int d = Integer.parseInt(t.nextToken());
        if ((a >= 0 && a <= 255) && (b >= 0 && b <= 255)
                && (c >= 0 && c <= 255) && (d >= 0 && d <= 255))
            b1 = true;
        return b1;
    }
}