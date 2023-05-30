import java.util.Scanner;

public class Ex4 {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);

        int tam = in.nextInt();
        int[] v = new int[tam];

        for (int i = 0; i < tam; i++) {
            v[i] = in.nextInt();
        }

        printArray(v, tam);
    }

    static void printArray(int[] v, int tam) {
        if (tam == 1) {
            System.out.print(v[tam - 1] + ", ");
        } else if (tam == v.length) {
            printArray(v, tam - 1);
            System.out.println(v[tam - 1]);
        } else {
            printArray(v, tam - 1);
            System.out.print(v[tam - 1] + ", ");
        }
    }
}