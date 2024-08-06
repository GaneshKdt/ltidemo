package com.nmims.helpers;
import java.net.URLEncoder;
import java.security.*;
import java.security.spec.InvalidKeySpecException;
import java.util.Arrays;

import javax.crypto.*;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import javax.xml.bind.DatatypeConverter;

import sun.misc.*;

public class AESencrp {

	private static final String ALGO = "AES";
	private static final byte[] keyValue = 
			new byte[] { 'T', '5', 'e', '8', 'e', 'Z', 't',
		'S', 'W', '%', 'r','T', ')', 'K', '0', '#' };

	public static String encrypt(String Data) throws Exception {
		Key key = generateKey();
		Cipher c = Cipher.getInstance(ALGO);
		c.init(Cipher.ENCRYPT_MODE, key);
		byte[] encVal = c.doFinal(Data.getBytes());
		String encryptedValue = new BASE64Encoder().encode(encVal);
		return encryptedValue;
	}

	public static String decrypt(String encryptedData) throws Exception {
		Key key = generateKey();
		Cipher c = Cipher.getInstance(ALGO);
		c.init(Cipher.DECRYPT_MODE, key);
		byte[] decordedValue = new BASE64Decoder().decodeBuffer(encryptedData);
		byte[] decValue = c.doFinal(decordedValue);
		String decryptedValue = new String(decValue);
		return decryptedValue;
	}
	private static Key generateKey() throws Exception {
		Key key = new SecretKeySpec(keyValue, ALGO);
		return key;
	}

	public static void main(String[] args) throws Exception {
		String password = "77117000757";
		String passwordEnc = AESencrp.encrypt(password);
		// String passwordDec = AESencrp.decrypt(passwordEnc);
		
		
		//Below same Private key is configured on Salesforce as well
		String base64EncodedKey = new BASE64Encoder().encode("T5e8eZtSW%rT)K0#".getBytes());
//		System.out.println("Encoded key for salesforce = "+base64EncodedKey); //VDVlOGVadFNXJXJUKUswIw==
//		System.out.println(decryptSalesforce("tgm6pVLZbrOeXxuEZ+sTjfO29nMSaQX5FAQPkSK2jWRspvUpFOZmmtuQKIGswSUs" , "VDVlOGVadFNXJXJUKUswIw=="));

	}



	static String decryptSalesforce(String base64EncodedEncryptedString, String base64EncodedPrivateKey) throws InvalidKeyException,
	InvalidAlgorithmParameterException, IllegalBlockSizeException,
	BadPaddingException, NoSuchAlgorithmException, NoSuchPaddingException {
		
		final int AES_KEYLENGTH = 128; 
		byte[] iv = new byte[AES_KEYLENGTH / 8];
		
		Cipher c = Cipher.getInstance("AES/CBC/PKCS5PADDING");
		c.init(Cipher.DECRYPT_MODE, new SecretKeySpec(DatatypeConverter.parseBase64Binary(base64EncodedPrivateKey), "AES"), new IvParameterSpec(iv));

		byte[] plainByte = c.doFinal(DatatypeConverter.parseBase64Binary(base64EncodedEncryptedString));
		byte[] filteredByteArray = Arrays.copyOfRange(plainByte, 16, plainByte.length);//Remove first 16 bytes before getting plaintext
		String plainText = new String(filteredByteArray);

		return plainText;

	}
	


}