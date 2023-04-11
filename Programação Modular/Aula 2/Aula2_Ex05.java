import java.util.Scanner;

public class Aula2_Ex05 {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);

        int tamanho = 10;
        int[] vetor = new int[tamanho];

        for (int i = 0; i < vetor.length; i++) {
            System.out.printf("Informe o valor da posição %d: ", i);
            vetor[i] = in.nextInt();

            for (int j = 0; j < i; j++) {
                if (vetor[i] == vetor[j]) {
                    i--;
                    break;
                }
            }

        }

        for (int i = 0; i < vetor.length; i++) {
            System.out.printf("U[%d]: %d, ", i, vetor[i]);
        }
    }
}
