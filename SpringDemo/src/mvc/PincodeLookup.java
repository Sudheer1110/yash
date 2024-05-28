package mvc;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

public class PincodeLookup {

	public static String lookupPincode(double latitude, double longitude) {
		String csvFile = "pincode_data.csv";
		String line;
		String delimiter = ",";
		String pincode = null;

		try (BufferedReader br = new BufferedReader(new FileReader(csvFile))) {
			while ((line = br.readLine()) != null) {
				String[] data = line.split(delimiter);
				double lat = Double.parseDouble(data[0]);
				double lon = Double.parseDouble(data[1]);
				if (latitude == lat && longitude == lon) {
					pincode = data[2];
					break;
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}

		return pincode;
	}
}
