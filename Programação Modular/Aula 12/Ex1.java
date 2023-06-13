import java.util.Scanner;

public class Ex1 {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);

        int tam = in.nextInt();

        int[] array = new int[tam];

        for (int i = 0; i < tam; i++) {
            array[i] = in.nextInt();
        }

        System.out.println("A soma é " + soma(array, tam));
    }

    static int soma(int v[], int tam) {
        if (tam == 1) {
            return v[0]; // v[tam - 1]
        }

        return v[tam - 1] + soma(v, tam - 1);
    }
}