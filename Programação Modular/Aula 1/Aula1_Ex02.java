import java.util.Scanner;

public class Aula1_Ex02 {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);

        System.out.print("Informe o raio do circulo: ");
        double raio = in.nextDouble();

        double area = (Math.PI) * (Math.pow(raio, 2));

        System.out.printf("A area do circulo é de %.2f", area);
    }
}
