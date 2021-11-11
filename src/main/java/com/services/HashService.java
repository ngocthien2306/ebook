package com.services;

import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.Random;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;

public class HashService {
	
	String hashAlgorithm = "HmacSHA512";
	int saltLength = 18;

	public byte[] doHash(byte[] input, byte[] key) {
		
		byte[] output = null;
		
		try {
			SecretKeySpec secretKeySpec = new SecretKeySpec(key, hashAlgorithm);
			Mac mac = Mac.getInstance(hashAlgorithm);
			mac.init(secretKeySpec);
			output = mac.doFinal(input);
		} catch (InvalidKeyException | NoSuchAlgorithmException e) {
			e.printStackTrace();
			return null;
		}
		
		return output;
	}

	// Stack stackoverflow: https://stackoverflow.com/questions/20536566/creating-a-random-string-with-a-z-and-0-9-in-java
	public byte[] generateSalt() {
		String SALTCHARS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
		StringBuilder salt = new StringBuilder();
		Random rnd = new Random();
		while (salt.length() < saltLength) { // length of the random string.
			int index = (int) (rnd.nextFloat() * SALTCHARS.length());
			salt.append(SALTCHARS.charAt(index));
		}
		return salt.toString().getBytes();
	}
}
