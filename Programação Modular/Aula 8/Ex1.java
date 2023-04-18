import java.util.Scanner;

public class Ex1 {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        int opcao, peso1, peso2;
        double prova1, prova2, trab1, resultado;

        do {
            System.out.println(
                    "Selecione uma das opções:\n1)Media das duas provas;\n2)Media ponderada das provas e trabalho;\n3)Media ponderada das provas usando seus pesos.");

            opcao = in.nextInt();
        } while (opcao != 1 && opcao != 2 && opcao != 3);

        if (opcao == 1) {
            System.out.println("Informe a nota das provas: ");
            prova1 = in.nextDouble();
            prova2 = in.nextDouble();
            resultado = calculaNotaFinal(prova1, prova2);
            System.out.printf("A media é %.2f!", resultado);
        } else if (opcao == 2) {
            System.out.println("Informe a nota das provas e do trabalho: ");
            prova1 = in.nextDouble();
            prova2 = in.nextDouble();
            trab1 = in.nextDouble();
            resultado = calculaNotaFinal(prova1, prova2, trab1);
            System.out.printf("A media é %.2f!", resultado);
        } else {
            System.out.println("Informe a nota das provas e seus pesos: (nota, peso, nota, peso)");
            prova1 = in.nextDouble();
            peso1 = in.nextInt();
            prova2 = in.nextDouble();
            peso2 = in.nextInt();
            resultado = calculaNotaFinal(prova1, peso1, prova2, peso2);
            System.out.printf("A media é %.2f!", resultado);
        }
    }

    public static double calculaNotaFinal(double prova1, double prova2) {
        return (prova1 + prova2) / 2;
    }

    public static double calculaNotaFinal(double prova1, double prova2, double trab1) {
        return (prova1 * 3 + prova2 * 3 + trab1 * 4) / 10;
    }

    public static double calculaNotaFinal(double prova1, int peso1, double prova2, int peso2) {
        return (prova1 * peso1 + prova2 * peso2) / (peso1 + peso2);
    }
}