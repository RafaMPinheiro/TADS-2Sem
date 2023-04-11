import java.util.Scanner;

public class Ex1 {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);

        System.out.println("Digite quantos números inteiros irá digitar:");
        int n = in.nextInt();
        int[] numeros = new int[n];

        for (int i = 0; i < n; i++) {
            System.out.println("Digite o " + (i + 1) + "º número:");
            numeros[i] = in.nextInt();
        }

        int soma = somaElementosVetor(numeros);
        System.out.printf("A soma dos elementos do array é %d!", soma);

        int multi = multiplicaElementosVetor(numeros);
        System.out.printf("A multiplicação dos elementos do array é %d!", multi);

        int repMaior = numeroRepeticaoMaior(numeros);
        System.out.printf("O maior número foi repetido %d vezes!\n", repMaior);
    }

    public static int somaElementosVetor(int[] array) {
        int soma = 0;
        for (int i = 0; i < array.length; i++) {
            soma += array[i];
        }
        return soma;
    }

    public static int multiplicaElementosVetor(int[] array) {
        int multi = 1;
        for (int i = 0; i < array.length; i++) {
            multi *= array[i];
        }
        return multi;
    }

    public static int calculaMaior(int[] array) {
        int maior = array[0];
        for (int i = 1; i < array.length; i++) {
            if (maior < array[i]) {
                maior = array[i];
            }
        }
        return maior;
    }

    public static int numeroRepeticaoMaior(int[] array) {
        int maior = calculaMaior(array);
        int repeticoes = 0;
        for (int i = 0; i < array.length; i++) {
            if (maior == array[i])
                repeticoes++;
        }
        return repeticoes;
    }

}