
/**
 * Write a description of class LLIS here.
 *
 * @author (your name)
 * @version (a version number or a date)
 */
public class LLIS {

	private static final int UNKNOWN = 0;

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

	public static int llis_mem(int[] s) {
		int[][] mem = new int[s.length + 1][s.length + 1];
		for (int i = 0; i <= s.length; i++) {
			for (int j = 0; j <= s.length; j++) {
				mem[i][j] = UNKNOWN;
			}
		}
		return llisRec_mem(s, 0, s.length, mem);
	}

	private static int llisRec_mem(int[] s, int i, int j, int[][] mem) {
		int t;
		if (j == s.length) {
			t = 0;
		} else {
			t = s[j];
		}
		if (mem[i][j] == UNKNOWN) {
			if (i == s.length) {
				mem[i][j] = 0;
			} else if (s[i] <= t) {
				mem[i][j] = llisRec_mem(s, i + 1, j, mem);
			} else {
				mem[i][j] = Math.max(1 + llisRec_mem(s, i + 1, i, mem), llisRec_mem(s, i + 1, j, mem));
			}
		}
		return mem[i][j];
	}
}
