import java.util.Scanner;

public class Ex1 {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);

        int fibo = fibo(7);

        System.out.println(fibo);
    }

    static int fibo(int n) {
        if (n == 1) {
            return 1;
        } else if (n == 0) {
            return 0;
        }

        return fibo(n - 1) + fibo(n - 2);
    }
}