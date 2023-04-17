import java.util.Scanner;

public class Ex5 {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);

        boolean[] poltronas = new boolean[10];

        while (true) {
            System.out.println("Qual classe desejas: ");
            int classe = in.nextInt();

            atribuiPoltrona(poltronas, classe);
        }

    }

    public static void atribuiPoltrona(boolean[] poltronas, int classe) {
        Scanner in = new Scanner(System.in);

        int poltrona;
        boolean firstClassFull = primeiraClasseCheia(poltronas);
        boolean secondClassFull = classeEconomicaCheia(poltronas);

        if (firstClassFull && !secondClassFull) {
            System.out.println("A primeira classe está cheia desejas comprar da classe econômica? (Sim/Não)");
            String resposta = in.nextLine().toLowerCase();
            if (resposta.compareTo("sim") == 0) {
                classe = 2;
            }
        } else if (secondClassFull && !firstClassFull) {
            System.out.println("A classe econômica está cheia desejas comprar da primeira classe? (Sim/Não)");
            String resposta = in.nextLine().toLowerCase();
            if (resposta.compareTo("sim") == 0) {
                classe = 1;
            }
        } else if (secondClassFull && firstClassFull) {
            System.out.println("Next flight leaves in 3 hours!!");
        }

        if (classe == 1 && !firstClassFull) {
            for (int i = 0; i < 5; i++) {
                if (!poltronas[i]) {
                    System.out.print((i + 1) + " ");
                }
            }
            System.out.println();

            do {
                System.out.println("Qual poltrona da primeira classe desejas? ");
                poltrona = in.nextInt();

            } while (poltronas[(poltrona - 1)] || poltrona - 1 > 4);

            poltronas[(poltrona - 1)] = true;
        } else if (classe == 2 && !secondClassFull) {
            for (int i = 5; i < 10; i++) {
                if (!poltronas[i]) {
                    System.out.print((i + 1) + " ");
                }
            }
            System.out.println();

            do {
                System.out.println("Qual poltrona da classe econômica desejas? ");
                poltrona = (in.nextInt() - 1);

            } while (poltronas[(poltrona - 1)] || poltrona - 1 > 9 || poltrona - 1 < 5);

            poltronas[poltrona] = true;
        }
    }

    public static boolean primeiraClasseCheia(boolean[] poltronas) {
        int poltronasValidas = 5;
        for (int i = 0; i < 5; i++) {
            if (poltronas[i]) {
                poltronasValidas--;
            }
        }
        if (poltronasValidas == 0) {
            return true;
        }
        return false;
    }

    public static boolean classeEconomicaCheia(boolean[] poltronas) {
        int poltronasValidas = 5;
        for (int i = 5; i < 10; i++) {
            if (poltronas[i]) {
                poltronasValidas--;
            }
        }
        if (poltronasValidas == 0) {
            return true;
        }
        return false;
    }
}