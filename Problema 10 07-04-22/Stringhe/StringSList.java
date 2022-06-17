
/**
 * Liste di stringhe in stile Scheme
 *
 * @author Jacopo Plozner
 * @version 07/04/2022
 */
public class StringSList {
	// instance variables
	private final String first;
	private final StringSList rest;
	private final boolean empty;

	// Constructor - null
	public StringSList() {
		empty = true;
		first = null;
		rest = null;
	}

	// cons
	public StringSList(String e, StringSList sl) {
		empty = false;
		first = e;
		rest = sl;
	}

	// null?
	public boolean isNull() {
		return empty;
	}

	// car
	public String car() {
		return first;
	}

	// cdr
	public StringSList cdr() {
		return rest;
	}

	// cons alt
	public StringSList cons(String e) {
		return new StringSList(e, this);
	}

	// length
	public int length() {
		if (empty == true) {
			return 0;
		} else {
			return cdr().length() + 1;
		}
	}

	// list-ref
	public String listRef(int k) {
		if (k == 0) {
			return car();
		} else {
			return cdr().listRef(k - 1);
		}
	}

	// equal?
	public boolean equals(StringSList sl) {
		if (isNull() || sl.isNull()) {
			return isNull() && sl.isNull();
		} else if (car() == sl.car()) {
			return cdr().equals(sl.cdr());
		} else {
			return false;
		}
	}

	// append
	public StringSList append(StringSList sl) {
		if (isNull()) {
			return sl;
		} else {
			return (cdr().append(sl)).cons(car());
		}
	}

	// reverse
	public StringSList reverse() {
		return reverseRec(new StringSList());
	}

	private StringSList reverseRec(StringSList r) {
		if (isNull()) {
			return r;
		} else {
			return cdr().reverseRec(r.cons(car()));
		}
	}

	// visualizzazione testuale
	public String toString() {
		String desc = "(";
		if (!isNull()) {
			desc += car();
			StringSList rst = cdr();
			while (!rst.isNull()) {
				desc = desc + ", " + rst.car();
				rst = rst.cdr();
			}
		}
		return desc + ")";
	}

	// BTRs
	public static StringSList btrList(String btr, int n) {
		StringSList result = new StringSList();
		BTR btrC = new BTR(btr);
		String next;
		while (n > 0) {
			next = btrC.value();
			result = result.cons(next);
			btrC = btrC.btrSucc();
			n--;
		}
		result = result.reverse();
		return result;
	}
}
