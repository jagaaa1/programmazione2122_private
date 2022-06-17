
/**
 * Conta 1 cavaliere ogni 3
 *
 * @author Jacopo Plozner
 * @version 21/04/2022
 */
public class RoundTable {
	// Instance variables
	private final int num;
	private final IntSList jug;
	private final IntSList head;
	private final IntSList tail;

	private static IntSList range(int inf, int sup) {
		if (inf > sup) {
			return IntSList.NULL_INTLIST;
		} else {
			return range(inf + 1, sup).cons(inf);
		}
	}

	// Constructor
	public RoundTable(int n) {
		num = n;
		jug = range(1, 2);
		head = range(3, n);
		tail = IntSList.NULL_INTLIST;
	}

	// Private support Constructor
	private RoundTable(int n, IntSList j, IntSList h, IntSList t) {
		num = n;
		jug = j;
		head = h;
		tail = t;
	}

	public int numberOfKnights() {
		return num;
	}

	public IntSList servingKnights() {
		return jug;
	}

	public RoundTable serveNeighbour() {
		if (num < 3) {
			return this;
		} else if (head.isNull()) {
			IntSList rev = tail.reverse();
			return new RoundTable(num - 1, jug, rev.cdr(), IntSList.NULL_INTLIST);
		} else {
			return new RoundTable(num - 1, jug, head.cdr(), tail);
		}
	}

	public RoundTable passJug() {
		IntSList fintwo = tail.cons(jug.car()).cons(jug.listRef(1));
		if (num < 3) {
			return this;
		} else if (head.isNull()) {
			IntSList rev = fintwo.reverse();
			return new RoundTable(num, new IntSList(rev.car(), IntSList.NULL_INTLIST.cons(rev.listRef(1))),
					rev.cdr().cdr(), IntSList.NULL_INTLIST);
		} else if (head.length() < 2) {
			IntSList rev = fintwo.reverse();
			return new RoundTable(num, new IntSList(head.car(), IntSList.NULL_INTLIST.cons(rev.car())),
					rev.cdr(), IntSList.NULL_INTLIST);
		} else {
			return new RoundTable(num, new IntSList(head.car(), IntSList.NULL_INTLIST.cons(head.listRef(1))),
					head.cdr().cdr(), fintwo);
		}
	}

	public static String josephus(int n) {
		RoundTable count = new RoundTable(n);
		while (count.numberOfKnights() > 2) {
			count = count.serveNeighbour();
			count = count.passJug();
		}
		return count.servingKnights().toString();
	}
}
