import java.util.Scanner;

public class Ex3 {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);

        int A = in.nextInt();
        int B = in.nextInt();

        int mult = mult(A, B);

        System.out.println(mult);
    }

    static int mult(int A, int B) {
        if (B == 1) {
            return A;
        } else if (B == 0) {
            return 0;
        }

        return A + mult(A, B - 1);
    }
}