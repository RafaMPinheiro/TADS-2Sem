import java.util.Scanner;

public class Ex6 {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);

        System.out.println("Digite um número: ");
        int n = in.nextInt();

        double fatorial = calculaFatorial(n);
        System.out.println("O fatorial de " + n + " é " + fatorial);
    }

    public static double calculaFatorial(int n) {

        for (int i = n - 1; i > 0; i--) {
            n *= i;
        }

        return n;
    }
}