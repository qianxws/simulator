package com.cinema.sys.utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;

import javax.crypto.Cipher;
import javax.crypto.CipherInputStream;
import javax.crypto.CipherOutputStream;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

/**
 * zip模板文件加密、解密类
 * @author tianxiuheng
 *
 */
public class CryptFile {
	
	public static String directory = "";
	public static final String VIPARA = "0102030405060708";
    /**
     * 初始化 AES Cipher
     *
     * @param sKey
     * @param cipherMode
     * @return
     */
    public static Cipher initAESCipher(String sKey, int cipherMode) {

        Cipher cipher = null;
        try {
            IvParameterSpec zeroIv = new IvParameterSpec(VIPARA.getBytes());
            SecretKeySpec key = new SecretKeySpec(sKey.getBytes(), "AES");
            cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
            cipher.init(cipherMode, key, zeroIv);
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        } catch (NoSuchPaddingException e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        } catch (InvalidKeyException e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        } catch (InvalidAlgorithmParameterException e) {
            e.printStackTrace();
        }
        return cipher;
	}

	/**
	 * 对文件进行AES加密
	 * 
	 * @param sourceFile
	 * @param fileType
	 * @param sKey
	 * @return
	 */
	public static File encryptFile(String sourceFile, String fileType, String authKey) {
		return encryptFile(new File(sourceFile), fileType, authKey);
	}

	public static File encryptFile(File sourceFile, String fileType, String sKey) {
		// 新建临时加密文件
		File encrypfile = null;
		InputStream inputStream = null;
		OutputStream outputStream = null;
		try {
			File file = new File(directory);
			if (!file.exists()){
				file.mkdirs();
			}
			inputStream = new FileInputStream(sourceFile);
			encrypfile = File.createTempFile(sourceFile.getName(), fileType, file);
			outputStream = new FileOutputStream(encrypfile);
			Cipher cipher = initAESCipher(sKey, Cipher.ENCRYPT_MODE);
			// 以加密流写入文件
			CipherInputStream cipherInputStream = new CipherInputStream(inputStream, cipher);
			byte[] cache = new byte[1024];
			int nRead = 0;
			while ((nRead = cipherInputStream.read(cache)) != -1) {
				outputStream.write(cache, 0, nRead);
				outputStream.flush();
			}
			cipherInputStream.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace(); // To change body of catch statement use File |
									// Settings | File Templates.
		} catch (IOException e) {
			e.printStackTrace(); // To change body of catch statement use File |
									// Settings | File Templates.
		} finally {
			try {
				inputStream.close();
			} catch (IOException e) {
				e.printStackTrace(); // To change body of catch statement use
										// File | Settings | File Templates.
			}
			try {
				outputStream.close();
			} catch (IOException e) {
				e.printStackTrace(); // To change body of catch statement use
										// File | Settings | File Templates.
			}
		}
		return encrypfile;
	}

	/**
	 * AES方式解密文件
	 * 
	 * @param sourceFile
	 * @return
	 */
	public static File decryptFile(File sourceFile, String fileType, String sKey) {
		File decryptFile = null;
		InputStream inputStream = null;
		OutputStream outputStream = null;
		try {
			File file = new File(directory);
			if (!file.exists()){
				file.mkdirs();
			}
			decryptFile = File.createTempFile(sourceFile.getName(), fileType, file);
			Cipher cipher = initAESCipher(sKey, Cipher.DECRYPT_MODE);
			inputStream = new FileInputStream(sourceFile);
			outputStream = new FileOutputStream(decryptFile);
			CipherOutputStream cipherOutputStream = new CipherOutputStream(outputStream, cipher);
			byte[] buffer = new byte[1024];
			int r;
			while ((r = inputStream.read(buffer)) >= 0) {
				cipherOutputStream.write(buffer, 0, r);
			}
			cipherOutputStream.close();
		} catch (IOException e) {
			e.printStackTrace(); // To change body of catch statement use File |
									// Settings | File Templates.
		} finally {
			try {
				inputStream.close();
			} catch (IOException e) {
				e.printStackTrace(); // To change body of catch statement use
										// File | Settings | File Templates.
			}
			try {
				outputStream.close();
			} catch (IOException e) { 
				e.printStackTrace(); // To change body of catch statement use
										// File | Settings | File Templates.
			}
		}
		return decryptFile;
	}

	public static void main(String[] args) {
		String sKey = "1234567890123456";
		String fileType = ".zip";
		String sourceFile = "d:/home/soft/temp/taskPage_1511911314358.zip1641299711.zip";
		CryptFile.directory = "d:/home/soft/temp";

//		File file = CryptFile.encryptFile(sourceFile, fileType, sKey);
		File file = CryptFile.decryptFile(new File(sourceFile), fileType, sKey);
		System.out.println(file.getAbsolutePath());
	}
}
