import java.util.Scanner;

public class Ex4 {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);

        System.out.println("Informe a data: (dd/mm/aaaa)");
        String data = in.next();

        try {
            validarData(data);
        } catch (DataVaziaException e) {
            System.out.println("Erro: A data não pode estar vazia!");
        } catch (DataInvalidaException e) {
            System.out.println("Erro: A data fornecida não está no formato correto!");
        }
    }

    static void validarData(String data) throws DataVaziaException, DataInvalidaException {

        if (data.length() == 0) {
            throw new DataVaziaException();
        }

        if (!data.matches("\\d{2}/\\d{2}/\\d{4}")) {
            throw new DataInvalidaException();
        }

        String[] dataArray = data.split("/");

        if (Integer.parseInt(dataArray[0]) > 31) {
            throw new DataInvalidaException();
        } else if (Integer.parseInt(dataArray[1]) > 12) {
            throw new DataInvalidaException();
        } else if (Integer.parseInt(dataArray[2]) > 2023) {
            throw new DataInvalidaException();
        }

        System.out.println("Data válida: " + data);
    }

}

class DataVaziaException extends Exception {
}

class DataInvalidaException extends Exception {
}
