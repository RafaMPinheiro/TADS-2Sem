import java.util.Scanner;

public class Aula1_Ex03 {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);

        System.out.print("Informe a altura e o peso: ");
        float altura = in.nextFloat();
        float peso = in.nextFloat();
        char classif;

        if (peso <= 60) {
            if (altura < 1.2) {
                classif = 'A';
            } else if (altura <= 1.7) {
                classif = 'B';
            } else {
                classif = 'C';
            }
        } else if (peso <= 90) {
            if (altura < 1.2) {
                classif = 'D';
            } else if (altura <= 1.7) {
                classif = 'E';
            } else {
                classif = 'F';
            }
        } else {
            if (altura < 1.2) {
                classif = 'G';
            } else if (altura <= 1.7) {
                classif = 'H';
            } else {
                classif = 'I';
            }
        }

        System.out.println("A classificação é: " + classif);
    }
}
