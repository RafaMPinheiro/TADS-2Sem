import java.util.Scanner;

public class Aula1_Ex01 {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);

        float p1, p2, t1, t2, m;

        System.out.println("Informe a nota das duas provas e dos dois trabalhos: ");
        p1 = in.nextFloat();
        p2 = in.nextFloat();
        t1 = in.nextFloat();
        t2 = in.nextFloat();

        m = (p1 * 0.3f + p2 * 0.3f + t1 * 0.2f + t2 * 0.2f);

        System.out.printf(
                "Nota da prova 1: %.1f\nNota da prova 2: %.1f\nNota do trabalho 1: %.1f\nNota do trabalho 2: %.1f\nMédia: %.1f",
                p1, p2, t1, t2, m);

    }
}