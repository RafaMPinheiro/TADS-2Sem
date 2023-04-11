import java.util.Scanner;

public class Aula2_Ex02 {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);

        int tamanho = 10;
        int[] arrayU = new int[tamanho];

        for (int i = 0; i < arrayU.length; i++) {
            System.out.printf("Informe o valor da posição %d: ", i);
            arrayU[i] = in.nextInt();
        }

        for (int i = 0; i < (arrayU.length / 2); i++) {
            int segundaPosicao = (arrayU.length - 1) - i;
            int aux = arrayU[i];

            arrayU[i] = arrayU[segundaPosicao];
            arrayU[segundaPosicao] = aux;
        }

        for (int i = 0; i < arrayU.length; i++) {
            System.out.printf("U[%d]: %d\n", i, arrayU[i]);
        }
    }
}