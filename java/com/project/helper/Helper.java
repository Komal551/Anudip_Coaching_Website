package com.project.helper;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

public class Helper {

	public static boolean deleteFile(String path) {
		boolean f = false;
		
		try {
			
			File file = new File(path);
			f = file.delete();
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} 
		return f;
	}
	
	public static boolean saveFile(InputStream is, String path) {
	    boolean f = false;

	    try {
	        byte b[] = new byte[is.available()];

	        // data read
	        is.read(b);

	        // data write using try-with-resources
	        try (FileOutputStream fos = new FileOutputStream(path)) {
	            fos.write(b);
	            f = true; // Set to true on successful file write
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return f;
	}
}
