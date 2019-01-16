import java.awt.image.BufferedImage;
import java.io.File;
import java.util.HashMap;
import java.util.Map;

import javax.imageio.ImageIO;

import com.google.zxing.Binarizer;
import com.google.zxing.BinaryBitmap;
import com.google.zxing.EncodeHintType;
import com.google.zxing.LuminanceSource;
import com.google.zxing.MultiFormatReader;
import com.google.zxing.Result;
import com.google.zxing.common.HybridBinarizer;


public class TestDecode {
	public static void main(String[] args) {
		try {
            MultiFormatReader formatReader = new MultiFormatReader();
			String filePath = "d://new.png";
			File file = new File(filePath);
			BufferedImage image = ImageIO.read(file);;
			LuminanceSource source = new BufferedImageLuminanceSource(image);
			Binarizer  binarizer = new HybridBinarizer(source);
			BinaryBitmap binaryBitmap = new BinaryBitmap(binarizer);
			Map hints = new HashMap();
			hints.put(EncodeHintType.CHARACTER_SET, "UTF-8");
			Result result = formatReader.decode(binaryBitmap,hints);
			
		    System.out.println("result = "+ result.toString());
			System.out.println("resultFormat = "+ result.getBarcodeFormat());
			System.out.println("resultText = "+ result.getText());
			            
			} catch (Exception e) {
			e.printStackTrace();
			}
	}
}
