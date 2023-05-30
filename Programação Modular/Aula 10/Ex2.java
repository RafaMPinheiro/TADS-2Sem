import java.util.Scanner;

public class Ex2 {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);

        int n = in.nextInt();

        int soma = somacubos(n);

        System.out.println(soma);
    }

    static int somacubos(int n) {
        if (n == 1) {
            return 1;
        }

        return (int) Math.pow(n, 3) + somacubos(n - 1);
    }
}