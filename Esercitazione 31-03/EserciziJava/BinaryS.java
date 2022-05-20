
/**
 * Complemento a uno
 *
 * @author Jacopo Plozner
 * @version 31/03/2022
 */
public class BinaryS {
	// instance variables
	private String binS;

	// Constructor
	public BinaryS() {
		binS = "0";
	}

	public BinaryS(String s) {
		binS = s;
	}

	public String onesComplement() {
		String result = "";
		String starting = binS;
		for (int i = 0; i < starting.length(); i++) {
			String bit = starting.charAt(i) == '0' ? "1" : "0";
			result = result + bit;
		}
		return result;
	}

}
