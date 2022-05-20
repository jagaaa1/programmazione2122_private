
/**
 * Write a description of class LLIS here.
 *
 * @author (your name)
 * @version (a version number or a date)
 */
public class LLIS {
	public static int llis(int[] s) {
		return llisRec(s, 0, 0);
	}

	private static int llisRec(int[] s, int i, int t) {
		if (i == s.length) {
			return 0;
		} else if (s[i] <= t) {
			return llisRec(s, i + 1, t);
		} else {
			return Math.max(1 + llisRec(s, i + 1, s[i]), llisRec(s, i + 1, t));
		}
	}
}
