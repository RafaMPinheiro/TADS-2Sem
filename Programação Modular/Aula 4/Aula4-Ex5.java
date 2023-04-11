import java.util.Scanner;

public class Aula4_Ex04 {
    
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);

        System.out.println("Insira o primeiro valor: ");
        int primeiro = in.nextInt();

        System.out.println("Insira o segundo valor: ");
        int segundo = in.nextInt();

        int quociente = quociente(primeiro,segundo);
        int resto = resto(primeiro,segundo);

        int num;
        do {
            System.out.println("Informe um número: ");
            num = in.nextInt();
        } while (num >= 1 && num <= 99999);

        displayDigits(num); 

    }

    public static int quociente(int primeiro, int segundo){
        return primeiro / segundo;
    }

    public static int resto(int primeiro, int segundo){
        return primeiro % segundo;
    }

    public static void displayDigits(int num) {
        for (int i = 10000; i == 10; i = i / 10){
            int a = quociente(num,i);
            if(a != 0) {
                System.out.print(a);
            }
        }
    }
}

