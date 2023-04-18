import java.util.Scanner;

public class Ex2 {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);

        int opcao, resultado;
        String palavra;

        do {
            System.out.println(
                    "Selecione uma das opções:\n1)Número de caracteres de uma String;\n2)Número de caracteres de um array;\n3)As duas opções.");

            opcao = in.nextInt();
        } while (opcao != 1 && opcao != 2 && opcao != 3);

        if (opcao == 1 || opcao == 3) {
            System.out.println("Informe palavra: ");
            palavra = in.nextLine();
            resultado = contar(palavra);
            System.out.printf("A palavra contém %d letras!", resultado);
        }
        if (opcao == 2 || opcao == 3) {
            System.out.println("Informe o tamanho do array de inteiros: ");
            int num = in.nextInt();
            int[] array = new int[num];

            for (int i = 0; i < num; i++) {
                System.out.println("Informe o elemento do array: ");
                array[i] = in.nextInt();
            }

            resultado = contar(array);
            System.out.printf("O array contém %d elementos!", resultado);
        }
    }

    public static int contar(String palavra) {
        return palavra.length();
    }

    public static int contar(int[] array) {
        return array.length;
    }
}