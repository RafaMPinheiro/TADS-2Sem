import java.util.Scanner;

public class Ex4 {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);

        int opcao, lado, areaQuadrado;
        float base, altura, areaTriangulo;
        double raio, areaCirculo;

        do {
            System.out.println(
                    "Selecione uma das opções:\n1)Calcula a área de um quadrado;\n2)Calcula a área de um triangulo.;\n3)Calcula a área de um círculo.");

            opcao = in.nextInt();
        } while (opcao != 1 && opcao != 2 && opcao != 3);

        if (opcao == 1) {
            lado = 5;
            areaQuadrado = area(lado);
            System.out.printf("A area do quadrado é %d!\n", areaQuadrado);
        } else if (opcao == 2) {
            base = 3.2f;
            altura = 4.7f;
            areaTriangulo = area(base, altura);
            System.out.printf("A area do triangulo é %f!\n", areaTriangulo);
        } else {
            raio = 2.5;
            areaCirculo = area(raio);
            System.out.printf("A area do círculo é %f!\n", areaCirculo);
        }
    }

    public static int area(int lado) {
        return lado * lado;
    }

    public static float area(float base, float altura) {
        return (base * altura) / 2;
    }

    public static double area(double raio) {
        return raio * raio * Math.PI;
    }

}