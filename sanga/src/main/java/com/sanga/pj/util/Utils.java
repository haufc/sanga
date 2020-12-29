package com.sanga.pj.util;

public class Utils {
	// get file path
	public static String getFilePath(String path, String rootLocationDir) {
		String[] paths = path.split("/");
		return rootLocationDir + paths[paths.length-1];
	}
}
