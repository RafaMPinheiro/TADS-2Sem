public class Aula1_Ex05 {
    public static void main(String[] args) {
        int contador = 0, soma = 0;

        while (contador <= 100) {
            soma += contador;
            contador += 2;
        }

        System.out.println("Soma: " + soma);
    }
}
