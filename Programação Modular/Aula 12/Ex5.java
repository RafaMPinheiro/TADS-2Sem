import java.util.Scanner;

public class Ex5 {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);

        System.out.println("Informe a sequência de números inteiros: (x, y, z, ...)");
        String seq = in.nextLine();

        try {
            int soma = calculaSoma(seq);
            System.out.println("Soma = " + soma);
        } catch (StringVaziaException e) {
            System.out.println("Erro: A sequência não pode estar vazia!");
        } catch (NumberFormatException e) {
            System.out.println("Erro: Digite uma sequência válida de números inteiros");
        }

    }

    static int calculaSoma(String seq) throws StringVaziaException, NumberFormatException {
        if (seq.length() == 0) {
            throw new StringVaziaException();
        }

        String seqNums = seq.replaceAll("\\s+", "");

        String[] nums = seqNums.split(",");
        int soma = 0;
        for (int i = 0; i < nums.length; i++) {
            soma += Integer.parseInt(nums[i]);
        }

        return soma;
    }
}

class StringVaziaException extends Exception {
}

class NumberFormatException extends Exception {
}