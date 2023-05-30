import java.util.Scanner;

public class Ex1 {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);

        int n = in.nextInt();

        int fibo = fibo(n);

        System.out.println("Termo da sequencia = " + fibo);
    }

    static int fibo(int n) {
        if (n == 1 || n == 0) {
            return n;
        }

        return fibo(n - 1) + fibo(n - 2);
    }
}