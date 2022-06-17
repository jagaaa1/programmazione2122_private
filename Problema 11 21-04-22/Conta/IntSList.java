
/**
 * Liste di interi in stile Scheme.
 *
 * new IntSList() : IntSList [null],
 * s.isNull() : boolean [(null? s)],
 * s.car() : int [(car s)],
 * s.cdr() : IntSList [(cdr s)],
 * s.cons(n) : IntSList [(cons n s)].
 * 
 * @author Jacopo Plozner
 * @version 21/03/2022
 */
public class IntSList {

	public static final IntSList NULL_INTLIST = new IntSList();

	// instance variables
	private final boolean empty;
	private final int first;
	private final IntSList rest;

	/**
	 * Constructor
	 */
	public IntSList() {
		empty = true;
		first = 0;
		rest = null;
	}

	public IntSList(int n, IntSList s) {
		empty = false;
		first = n;
		rest = s;
	}

	public boolean isNull() {
		return empty;
	}

	public int car() {
		return first;
	}

	public IntSList cdr() {
		return rest;
	}

	public IntSList cons(int n) {
		return new IntSList(n, this);
	}

	public int length() {
		if (isNull()) {
			return 0;
		} else {
			return 1 + cdr().length();
		}
	}

	public int listRef(int i) {
		if (i == 0) {
			return car();
		} else {
			return cdr().listRef(i - 1);
		}
	}

	public boolean equals(IntSList s) {
		if (isNull() || s.isNull()) {
			return isNull() && s.isNull();
		} else if (car() == s.car()) {
			return cdr().equals(s.cdr());
		} else {
			return false;
		}
	}

	public IntSList append(IntSList s) {
		if (isNull()) {
			return s;
		} else {
			return (cdr().append(s)).cons(car());
		}
	}

	public IntSList reverse() {
		return reverseRec(NULL_INTLIST);
	}

	private IntSList reverseRec(IntSList r) {
		if (isNull()) {
			return r;
		} else {
			return cdr().reverseRec(r.cons(car()));
		}
	}

	public String toString() {
		String desc = "(";
		if (!isNull()) {
			desc += car();
			IntSList rst = cdr();
			while (!rst.isNull()) {
				desc = desc + ", " + rst.car();
				rst = rst.cdr();
			}
		}
		return desc + ")";
	}
}
