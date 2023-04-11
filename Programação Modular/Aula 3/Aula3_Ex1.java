import java.util.Scanner;

public class Aula3_Ex01 {
    
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);

        int[] arrayY, arrayX;
        int tamanho = 10;

        arrayX = new int[tamanho];
        arrayY = new int[tamanho];

        for (int i = 0; i < arrayX.length; i++) {
            System.out.printf("Informe o valor da posição %d: ", i);
            arrayX[i] = in.nextInt();
            if (i % 2 == 0) {
                arrayY[i] = arrayX[i] * 2;
            } else {
                arrayY[i] = arrayX[i] * 3;
            }
        }

        for (int i = 0; i < arrayY.length; i++) {
            System.out.printf("Y[%d]: [%d]", i, arrayY[i]);
        }
        System.out.println();
    }
}