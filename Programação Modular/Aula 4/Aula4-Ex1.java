import java.util.Scanner;

public class Aula4_Ex01 {
    
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);

        System.ou.println("Informe a base: ");
        int base = in.nextInt();

        System.ou.println("Informe o expoente: ");
        int expoente = in.nextInt();

        int result = calculaPotencia(base,expoente);

        System.out.println("A resposta é " + result);
    }

    public static int calculaPotencia(int base, int expoente) {
        int multi = base;
        for(int i = 0; i < (expoente - 1); i++) {
            multi = multi * base;
        }
        return multi;
    }

}
