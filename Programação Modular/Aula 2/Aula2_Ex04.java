import java.util.Scanner;

public class Aula2_Ex04 {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);

        int tamanho = 10;
        int[] vetor = new int[tamanho];
        // int[] vetor = {1,1,1,1,1,2,1,1,1,2};
        int[] vetorAux = new int[tamanho];

        for (int i = 0; i < vetor.length; i++) {
            System.out.printf("Informe o valor da posição %d: ", i);
            vetor[i] = in.nextInt();
        }

        for (int i = 0; i < vetor.length; i++) {
            for (int j = 0; j < i; j++) {
                if (vetor[i] == vetor[j] && i != j) {
                    vetorAux[j] = vetor[j];
                    break;
                }
            }
        }

        for (int i = 0; i < vetorAux.length; i++) {
            if (vetorAux[i] != 0) {
                System.out.print(vetorAux[i] + " ");
            }
        }

        System.out.println();
    }
}
