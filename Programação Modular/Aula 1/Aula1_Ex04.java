import java.util.Scanner;

public class Aula1_Ex04 {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);

        System.out.print("Informe o número: ");
        int num = in.nextInt();

        /*
         * if ((num % 3 == 0 || num % 5 == 0) && (num % 3 == 0 && num % 5 == 0)){
         * System.out.println("Sim!");
         * } else {
         * System.out.println("Não!");
         * }
         */
        if (num % 3 == 0) {
            if (num % 5 != 0) {
                System.out.println("Sim, pelo 3!");
            } else {
                System.out.println("Não, ele é divisivel por 3 ou por 5!");
            }
        } else if (num % 5 == 0) {
            System.out.println("Sim, pelo 5!");
        } else {
            System.out.println("Não!");
        }
    }
}
