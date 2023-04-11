import java.util.Scanner;

public class Ex4 {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);

        System.out.print("Informe a primeira palavra: ");
        String s1 = in.next();

        System.out.print("Informe a segunda palavra: ");
        String s2 = in.next();

        if (palindromasMutuas(s1, s2)) {
            System.out.println("São palíndromas mutuas");
        } else {
            System.out.println("Não são palíndromas mutuas");
        }
    }

    public static boolean palindromasMutuas(String s1, String s2) {
        String s1Invertida = "";

        for (int i = s1.length() - 1; i >= 0; i--) {
            s1Invertida += s1.charAt(i);
        }

        if (s2.compareTo(s1Invertida) == 0) {
            return true;
        }
        return false;
    }
}