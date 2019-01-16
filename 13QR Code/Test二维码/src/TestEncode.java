import java.io.File;
import java.util.Hashtable;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.common.BitMatrix;

public class TestEncode {
	
	public static void main(String []args)throws Exception{
		String text = "ÄãºÃ";
		int width = 100;
		int height = 100;
		String format = "png";
		Hashtable hints= new Hashtable();
		hints.put(EncodeHintType.CHARACTER_SET, "UTF-8");
		BitMatrix bitMatrix = new MultiFormatWriter().encode(text, BarcodeFormat.QR_CODE, width, height,hints);
		File outputFile = new File("d://new.png");
		MatrixToImageWriter.writeToFile(bitMatrix, format, outputFile);
		 
	}
}