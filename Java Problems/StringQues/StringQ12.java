//Find Profession

class Solution{
    static char profession(int level, int pos){
        // code here
        if (level == 1)
            return 'e';

        // Recursively find parent's
        // profession. If parent
        // is a Doctor, this node
        // will be a Doctor if it
        // is at odd position and an
        // engineer if at even position
        if (profession(level - 1,
                (pos + 1) / 2) == 'd')
            return (pos % 2 > 0) ?
                    'd' : 'e';

        // If parent is an engineer,
        // then current node will be
        // an engineer if at add
        // position and doctor if even
        // position.
        return (pos % 2 > 0) ?
                'e' : 'd';
    }
}