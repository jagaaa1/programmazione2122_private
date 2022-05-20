
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
	private final IntSList rows;
	private final IntSList cols;
	private final IntSList diagm; // i-j
	private final IntSList diagp; // i+j
	private final String config;

	public Board(int n) {
		size = n;
		queens = 0;
		config = "";
		rows = IntSList.NULL_INTLIST;
		cols = IntSList.NULL_INTLIST;
		diagm = IntSList.NULL_INTLIST;
		diagp = IntSList.NULL_INTLIST;
	}

	private Board(Board b, int i, int j) {
		size = b.size();
		queens = b.queensOn() + 1;
		config = b.arrangement() + locCode(i, j);
		rows = b.rows().cons(i);
		cols = b.cols().cons(j);
		diagm = b.diagm().cons(i - j);
		diagp = b.diagp().cons(i + j);
	}

	public IntSList rows() {
		return rows;
	}

	public IntSList cols() {
		return cols;
	}

	public IntSList diagm() {
		return diagm;
	}

	public IntSList diagp() {
		return diagp;
	}

	public int size() {
		return size;
	}

	public int queensOn() {
		return queens;
	}

	public boolean underAttack(int i, int j) {
		return rows().isIn(i) || cols().isIn(j) || diagm().isIn(i - j) || diagp().isIn(i + j);
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
