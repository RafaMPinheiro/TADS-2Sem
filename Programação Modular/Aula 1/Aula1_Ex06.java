import java.util.Scanner;

public class Aula1_Ex06 {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);

        int num = in.nextInt();

        double result = 0;
        for (int i = 1; i <= num; i++) {
            result += 1f / i;
        }

        System.out.printf("O valor é : %.3f", result);
    }
}
