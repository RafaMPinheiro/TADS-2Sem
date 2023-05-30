import java.util.Scanner;

public class Ex6 {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);

        int tam = in.nextInt();
        int[] v = new int[tam];

        for (int i = 0; i < tam; i++) {
            v[i] = in.nextInt();
        }

        int maior = encontraMaior(v, tam - 1);
        System.out.println(maior);

    }

    static int encontraMaior(int v[], int tam) {
        if (tam == 0) {
            return v[tam];
        }

        int maior = encontraMaior(v, tam - 1);

        if (v[tam] > maior) {
            return v[tam];
        } else {
            return maior;
        }
    }
}