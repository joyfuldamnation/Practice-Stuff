//TOWER OF HANOIIIIIIII

// avoid space at the starting of the string in "move disk....."
class Hanoi {

    public long toh(int N, int from, int to, int aux) {
        // Your code here
        if (n == 0)
        {
            return -1;
        }
        towerOfHanoi(n - 1, from_rod, aux_rod, to_rod);
        return System.out.println("Move disk "+ n + " from rod " + from_rod +" to rod " + to_rod );
        towerOfHanoi(n - 1, aux_rod, to_rod, from_rod);
    }
}
