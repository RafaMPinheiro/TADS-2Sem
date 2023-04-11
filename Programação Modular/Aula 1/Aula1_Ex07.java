import java.util.Scanner;

public class Aula1_Ex07 {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        int n, a, soma = 0;

        System.out.println("Informe o valor de A e de N(N > 0): ");
        a = in.nextInt();
        do {
            System.out.println("Informe um valor valido para N(N > 0): ");
            n = in.nextInt();
        } while (n <= 0);

        for (int i = 0; i < n; i++) {
            soma += (a + i);
        }

        System.out.println("Soma: " + soma);
    }
}
