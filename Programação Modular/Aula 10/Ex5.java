import java.util.Scanner;

public class Ex5 {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);

        String palavra = in.next();
        char[] array = palavra.toCharArray();
        int i = array.length - 1;

        printReverse(array, i);
    }

    static void printReverse(char[] array, int i) {
        if (i == 0) {
            System.out.print(array[i]);
        } else if (i > 0) {
            System.out.print(array[i]);
            printReverse(array, i - 1);
        }
    }
}