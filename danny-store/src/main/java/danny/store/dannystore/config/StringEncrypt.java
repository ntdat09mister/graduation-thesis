package danny.store.dannystore.config;

import java.util.Scanner;

public class StringEncrypt {
    public static void main(String[] args) {
        StringEncryptorConfig stringEncryptorConfig = new StringEncryptorConfig();
        Scanner scanner = new Scanner(System.in);
        while (true) {
            System.out.print("Enter original string to encrypt: ");
            String originalStr = scanner.nextLine();
            System.out.println("Encrypted string: " + stringEncryptorConfig.stringEncryptor().encrypt(originalStr));
            System.out.print("Exit? [y/n]");
            String exit = scanner.nextLine();
            if (exit.equals("y")) break;
        }
    }
}