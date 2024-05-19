package com.kalvin.kvf.common.utils;

import org.apache.commons.codec.binary.Hex;

import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;
import javax.crypto.spec.SecretKeySpec;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.spec.KeySpec;

public class AES {

//    public static void main(String[] args) {
//        String s = encryption("123456", "111222");
//        System.out.println(s);
//        System.out.println(decryption("123456", s));
//        String s1 = encryption("654321", "111222");
//        System.out.println(s1);
//        System.out.println(decryption("654321", s1));
//    }

    public static String MD5(Long number) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            md.update(String.valueOf(number).getBytes());
            byte[] digest = md.digest();
            StringBuilder sb = new StringBuilder();
            for (byte b : digest) {
                sb.append(String.format("%02x", b & 0xff));
            }
            return sb.toString();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            return null;
        }
    }

    public static String encryption(String AESKey, String password) {
        try {
            // 1. 从用户提供的密钥生成固定长度的密钥
            SecretKeyFactory factory = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA256");
            KeySpec spec = new PBEKeySpec(AESKey.toCharArray(),
                    "salt".getBytes(), 65536, 256);
            SecretKey tmp = factory.generateSecret(spec);
            SecretKey secretKey = new SecretKeySpec(tmp.getEncoded(), "AES");

            // 2. 加密
            Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5Padding");
            cipher.init(Cipher.ENCRYPT_MODE, secretKey);
            return Hex.encodeHexString(cipher.doFinal(password.getBytes()));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }


    public static String decryption(String AESKey, String cipherText) {
        try {
            // 1. 从用户提供的密钥生成固定长度的密钥
            SecretKeyFactory factory = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA256");
            KeySpec spec = new PBEKeySpec(AESKey.toCharArray(),
                    "salt".getBytes(), 65536, 256);
            SecretKey tmp = factory.generateSecret(spec);
            SecretKey secretKey = new SecretKeySpec(tmp.getEncoded(), "AES");

            // 2. 解密
            Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5Padding");
            cipher.init(Cipher.DECRYPT_MODE, secretKey);
            return new String(cipher.doFinal(Hex.decodeHex(cipherText.toCharArray())));
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }


}