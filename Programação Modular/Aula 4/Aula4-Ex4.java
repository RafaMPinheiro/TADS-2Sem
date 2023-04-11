import java.util.Scanner;

public class Aula4_Ex04 {
    
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);

        System.out.println("Informe o side: ");
        int side = in.nextInt();

        String linha;
        for (int i = 0; i < side; i++){
            squareOfAsterisks(side)
        }   
    }

    public static void squareOfAsterisks(int side) {
        String asteriscosLinha = "";

        for (int i = 0; i < side; i++){
            asteriscosLinha += "*";
        }
        
        System.out.println(asteriscosLinha);
    }
}

