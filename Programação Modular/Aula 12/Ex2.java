import java.util.Scanner;

public class Ex2 {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);

        System.out.println("Informe a base: ");
        int base = in.nextInt();

        System.out.println("Informe o expoente: ");
        int exp = in.nextInt();

        System.out.println("O resultado da " + power(base, exp));
    }

    static int power(int base, int exp) {
        if (exp == 0) {
            return 1;
        }
        return base * power(base, exp - 1);
    }
}