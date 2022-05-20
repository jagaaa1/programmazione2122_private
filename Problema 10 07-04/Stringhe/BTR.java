
/**
 * BTR
 *
 * @author Jacopo Plozner
 * @version 31/03/2022
 */
public class BTR {
	// instance variables
	private String btrStr;

	// Constructor
	public BTR() {
		btrStr = ".";
	}

	public BTR(String s) {
		btrStr = s;
	}

	public String value() {
		return btrStr;
	}

	public BTR btrSucc() {
		int n = btrStr.length();
		char lsb = btrStr.charAt(n - 1);
		if (n == 1) {
			if (lsb == '+') {
				return new BTR("+-");
			} else {
				return new BTR("+");
			}
		} else {
			BTR pre = new BTR(btrStr.substring(0, n - 1));
			if (lsb == '+') {
				return new BTR(pre.btrSucc().value() + "-");
			} else {
				String add = lsb == '-' ? "." : "+";
				return new BTR(pre.value() + add);
			}
		}
	}
}
