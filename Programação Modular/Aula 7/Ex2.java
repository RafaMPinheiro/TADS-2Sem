import java.util.Scanner;

public class Ex2 {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);

        System.out.println("Digite quantos números inteiros irá digitar:");
        int n = in.nextInt();
        int[] numeros = new int[n];

        for (int i = 0; i < n; i++) {
            System.out.print("Digite o " + (i + 1) + "º número:");
            numeros[i] = in.nextInt();
        }

        System.out.println("Antes de modificar: ");
        printVetor(numeros);

        modificaVetor(numeros);

        System.out.println("Depois de modificar: ");
        printVetor(numeros);
    }

    public static void modificaVetor(int[] numeros) {
        for (int i = 0; i < numeros.length; i++) {
            if (i % 3 == 0) {
                numeros[i] *= 3;
            } else {
                numeros[i] *= 2;
            }
        }
    }

    public static void printVetor(int[] numeros) {
        for (int i = 0; i < numeros.length; i++) {
            System.out.print(numeros[i] + " ");
        }
        System.out.println();
    }
}