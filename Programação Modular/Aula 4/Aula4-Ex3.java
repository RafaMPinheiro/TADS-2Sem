import java.util.Scanner;

public class Aula4_Ex03 {
    
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);

        System.out.println("Insira o primeiro valor: ");
        float primeiro = in.nextFloat();

        System.out.println("Insira o segundo valor: ");
        float segundo = in.nextFloat();

        System.out.println("Insira um símbolo referente a operação que desejas: ");
        char simbolo = in.next().charAt(0);

        float result = calculaOperacao(primeiro,segundo,simbolo);
        
        if (result == -1 ){
            System.out.println("Símbolo invalido!");
        } else {
            System.out.println("O resultado é: " + result);
        }
    }

    public static float calculaOperacao(float primeiro, float segundo, char simbolo) {
        switch (simbolo) {
            case '+':
                return primeiro + segundo;

            case '-':
                return primeiro - segundo;

            case '*':
                return primeiro * segundo;

            case '/':
                return primeiro / segundo;

            default:
                return -1;
        }
    }
}

