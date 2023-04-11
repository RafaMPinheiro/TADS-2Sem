import java.util.Scanner;

public class Aula2_Ex03 {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);

        int tamanho = 10;
        int[] vetor = new int[tamanho];

        for (int i = 0; i < vetor.length; i++) {
            System.out.printf("Informe o valor da posição %d: ", i);
            vetor[i] = in.nextInt();
        }

        for (int i = 0; i < vetor.length; i++) {
            for (int j = i + 1; j < vetor.length; j++) {
                if (vetor[i] == vetor[j]) {
                    System.out.print(vetor[i] + " ");
                    break;
                }
            }
        }

        System.out.println();
    }
}
