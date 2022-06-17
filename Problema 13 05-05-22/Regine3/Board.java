
/**
 * Write a description of class Board here.
 *
 * @author (your name)
 * @version (a version number or a date)
 */
public class Board {
	private static final String COLS = " abcdefghijklmno";
	private static final String ROWS = " 123456789ABCDEF";
	private final int size;
	private final int queens;
	private final SList<SList<Integer>> queensCo;
	private final String config;

	public Board(int n) {
		size = n;
		queens = 0;
		config = "";
		queensCo = new SList<SList<Integer>>();
	}

	private Board(Board b, int i, int j) {
		size = b.size();
		queens = b.queensOn() + 1;
		config = b.arrangement() + locCode(i, j);
		SList<Integer> NULL_INT = new SList<Integer>(j, null);
		queensCo = b.queensCo().cons(NULL_INT.cons(i));
	}

	public SList<SList<Integer>> queensCo() {
		return queensCo;
	}

	public int size() {
		return size;
	}

	public int queensOn() {
		return queens;
	}

	public boolean underAttack(int i, int j) {
		int k = 0;
		int r;
		int c;
		while (k < queensCo().length()) {
			r = queensCo().listRef(k).car();
			c = queensCo().listRef(k).listRef(1);
			if (i == r || j == c || i - j == r - c || i + j == r + c) {
				return true;
			}
			k++;
		}
		return false;
	}

	public Board addQueen(int i, int j) {
		return new Board(this, i, j);
	}

	public String arrangement() {
		return config;
	}

	private static String locCode(int i, int j) {
		return " " + COLS.charAt(j) + ROWS.charAt(i) + " ";
	}
}
