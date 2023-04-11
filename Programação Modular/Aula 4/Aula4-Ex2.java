import java.util.Scanner;

public class Aula4_Ex02 {
    
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);

        System.ou.println("Informe quantos pares de números vc irá inserir: ");
        int pares = in.nextInt();

        for(int i = 0; i < pares ;i++){

            System.ou.println("Informe o primeiro número: ");
            int primeiro = in.nextInt();

            System.ou.println("Informe o segundo número: ");
            int segundo = in.nextInt();

            boolean result = isMultiple(primeiro, segundo);

            if (result) {
                System.out.printf("O %d é multiplo de %d!!", primeiro, segundo)
            } else {
                System.out.printf("O %d não é multiplo de %d!!", primeiro, segundo)
            }
        }
    }

    public static boolean isMultiple(int primeiro, int segundo) {
        if (segundo % primeiro == 0) {
            return true;
        }
        return false;
    }
}

