import java.util.Scanner;

public class Ex3 {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);

        System.out.print("Informe a primeira palavra: ");
        String s1 = in.next();

        System.out.print("Informe a segunda palavra: ");
        String s2 = in.next();

        System.out.print("As palavras em ordem alfabética: ");
        System.out.print(ordemAlfabética(s1, s2) + "\n");
    }

    public static String ordemAlfabética(String s1, String s2) {
        String ordem = "";

        if (s1.toUpperCase().compareTo(s2.toUpperCase()) > 0) {
            return ordem += s2 + " " + s1;
        }
        return ordem += s1 + " " + s2;

    }
}