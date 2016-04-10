package com.gao.OrderSystem.Common;

import java.io.IOException;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

public class FileUtil {
	static BASE64Encoder encoder = new sun.misc.BASE64Encoder();
	static BASE64Decoder decoder = new sun.misc.BASE64Decoder();

	public static byte[] base64StringToImage(String base64String) {
		byte[] bytes = null;
		try {
			bytes = decoder.decodeBuffer(base64String);
			return bytes;
		} catch (IOException e) {
			e.printStackTrace();
		}
		return bytes;
	}

	public static String getImageBinary(byte[] bytes) {
		try {
			return encoder.encodeBuffer(bytes).trim();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
