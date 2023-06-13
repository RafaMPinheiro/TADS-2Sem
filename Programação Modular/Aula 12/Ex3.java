import java.util.Scanner;

public class Ex3 {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);

        System.out.println("Informe palavra 1: ");
        String p1 = in.next();

        System.out.println("Informe palavra 2: ");
        String p2 = in.next();

        if (isPalindromo(p1, p2)) {
            System.out.println("São polindromas!");
        } else {
            System.out.println("Não são polindromas!");
        }
    }

    static boolean isPalindromo(String p1, String p2, int inicio, int fim) {

        if (inicio == p1.length()) {
            return true;
        } else if (p1.charAt(inicio) != p2.charAt(fim)) {
            return false;
        }

        return isPalindromo(p1, p2, inicio + 1, fim - 1);
    }

    static boolean isPalindromo(String p1, String p2) {

        if (p1.length() != p2.length()) {
            return false;
        }

        return isPalindromo(p1, p2, 0, p1.length() - 1);
    }
}