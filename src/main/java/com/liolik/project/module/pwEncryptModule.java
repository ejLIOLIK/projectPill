package com.liolik.project.module;

import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.spec.RSAPublicKeySpec;
import java.util.HashMap;
import java.util.Map;

import javax.crypto.Cipher;

public class pwEncryptModule {
	
	// 세션이름
	public final String PRIVATE_KEY = "privateKey" ;
    public final String PUBLIC_KEY = "publicKey" ;
    public final String PUBLIC_KEY_MODULUS = "publicKeyModulus" ;
    public final String PUBLIC_KEY_EXPONENT = "publicKeyExponent" ;

	public KeyPair setKeyPair() throws Exception { // 2048비트 키 쌍 생성
		KeyPair keyPair = null;
		KeyPairGenerator generator = KeyPairGenerator.getInstance("RSA");
		generator.initialize(2048); // RSA 크키. 권장 2048 이상.
		keyPair = generator.generateKeyPair();
		return keyPair;
	}
	
	public Cipher setCipher() throws Exception { // 암호화 복호화 클래스
		Cipher cipher = Cipher.getInstance("RSA");
		return cipher;
	}
	
	public String pwDecrypt(String ePw, PrivateKey priKey) throws Exception { // 복호화

		String decryptPw = "";
		
		Cipher cipher = setCipher();
		cipher.init(Cipher.DECRYPT_MODE, priKey); 
		byte[] ePwBytes = hexToByte(ePw);//16진수를 Byte로
		byte[] PwBytes = cipher.doFinal(ePwBytes); //복호화, byte 배열로 리턴
		decryptPw = new String(PwBytes, "utf-8"); //문자열로 변환
		
		return decryptPw;
	}
	
	public Map<String, String> getModExp16(PublicKey publicKey){ //모듈러스, 지수 16진수로 리턴
		Map<String, String> modExp = new HashMap<String, String>();
	      
	      try {
	        KeyFactory keyFactory = KeyFactory.getInstance("RSA");
	        RSAPublicKeySpec publicSpec = (RSAPublicKeySpec) keyFactory.getKeySpec(publicKey, RSAPublicKeySpec.class);
	        modExp.put(PUBLIC_KEY_MODULUS, publicSpec.getModulus().toString(16));
	        modExp.put(PUBLIC_KEY_EXPONENT, publicSpec.getPublicExponent().toString(16)); // 16진수 형태로
	        
	    } catch (Exception e) {
	    	System.out.println("ERROR : modExp get error...");
	    }
	        return modExp;	
	}
	
	public byte[] hexToByte(String str) { // 16진수 > Byte
	    int len = str.length();
	    byte[] data = new byte[len / 2];
	    for (int i = 0; i < len; i += 2) {
	        data[i / 2] = (byte) ( (Character.digit(str.charAt(i), 16) << 4)
	               + Character.digit(str.charAt(i+1), 16) );
	    }
	      return data;
	 }
}
