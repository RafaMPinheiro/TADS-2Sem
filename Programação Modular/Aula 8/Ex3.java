import java.util.Scanner;

public class Ex3 {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);

        int opcao, inicio, fim;
        String palavra, resultado;
        char[] resultadoArray = new char[10];

        do {
            System.out.println(
                    "Selecione uma das opções:\n1)Inverter uma String;\n2)Inverter uma String no intevalo que você definir;\n3)Inverte o array.");

            opcao = in.nextInt();
        } while (opcao != 1 && opcao != 2 && opcao != 3);

        if (opcao == 1) {
            palavra = "Rafael Pinheiro";
            resultado = inverter(palavra);
            System.out.printf("A palavra invertida é %s!\n", resultado);
        } else if (opcao == 2) {
            palavra = "Rafael Pinheiro";
            inicio = 3;
            fim = 5;
            resultado = inverter(palavra, inicio, fim);
            System.out.printf("A palavra %s invertida é %s!\n", palavra, resultado);
        } else {
            char[] array = { '1', '2', '3', '4', '5', '6', '7', '8', '9', '1' };
            resultadoArray = inverter(array);
            for (int i = 0; i < resultadoArray.length; i++) {
                System.out.print(resultadoArray[i] + " ");
            }
            System.out.println();
        }

    }

    public static String inverter(String palavra) {
        String palavraInvertida = "";

        for (int i = palavra.length() - 1; i >= 0; i--) {
            palavraInvertida += palavra.charAt(i);
        }

        return palavraInvertida;
    }

    public static String inverter(String palavra, int inicio, int fim) {
        String palavraInvertida = "";

        for (int i = 0; i <= inicio; i++) {
            palavraInvertida += palavra.charAt(i);
        }

        for (int i = fim; i >= inicio; i--) {
            palavraInvertida += palavra.charAt(i);
        }

        if (fim < palavra.length() - 1) {
            for (int i = fim + 1; i <= palavra.length() - 1; i++) {
                palavraInvertida += palavra.charAt(i);
            }
        }

        return palavraInvertida;
    }

    public static char[] inverter(char[] array) {
        char[] arrayInvertida = new char[array.length];

        for (char i = 0; i < array.length; i++) {
            arrayInvertida[i] = array[(array.length - 1 - i)];
        }

        return arrayInvertida;
    }
}