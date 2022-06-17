
public class BottomUpLIS {

	// Length of Longest Increasing Subsequence (LLIS):
	// Programmazione dinamica bottom-up

	public static int llisDP(int[] s) {

		int n = s.length;

		int[][] mem = new int[n + 1][n + 1];

		// Matrice: valori delle ricorsioni di llisRec
		// relativi a diversi valori degli argomenti

		for (int j = 0; j <= n; j = j + 1) {
			mem[n][j] = 0; // caso base
		}

		for (int i = n - 1; i >= 0; i = i - 1) { // casi ricorsivi
			for (int j = 0; j <= n; j = j + 1) {

				int t;
				if (j == s.length) {
					t = 0;
				} else {
					t = s[j];
				}

				if (s[i] <= t) {
					mem[i][j] = mem[i + 1][j];
				} else {
					mem[i][j] = Math.max(1 + mem[i + 1][i], mem[i + 1][j]);
				}

			}
		}

		// ----------------------------------------------------
		// Inserisci di seguito l'elemento della matrice
		// il cui valore corrisponde a llis(s) :

		return mem[0][n];

		// ----------------------------------------------------
	}

	// Longest Increasing Subsequence (LIS):
	// Programmazione dinamica bottom-up

	public static int[] lisDP(int[] s) {

		int n = s.length;

		int[][] mem = new int[n + 1][n + 1];

		// 1. Matrice: valori delle ricorsioni di llisRec
		// calcolati esattamente come per llisDP

		// ------------------------------------------------
		// Replica qui il codice del corpo di llisDP
		// che registra nella matrice i valori
		// corrispondenti alle ricorsioni di llisRec
		// ------------------------------------------------
		for (int j = 0; j <= n; j = j + 1) {
			mem[n][j] = 0; // caso base
		}

		for (int i = n - 1; i >= 0; i = i - 1) { // casi ricorsivi
			for (int j = 0; j <= n; j = j + 1) {

				int t;
				if (j == s.length) {
					t = 0;
				} else {
					t = s[j];
				}

				if (s[i] <= t) {
					mem[i][j] = mem[i + 1][j];
				} else {
					mem[i][j] = Math.max(1 + mem[i + 1][i], mem[i + 1][j]);
				}

			}
		}
		// 2. Cammino attraverso la matrice per ricostruire
		// un esempio di Longest Increasing Subsequence

		// ----------------------------------------------------
		// Inserisci di seguito l'elemento della matrice
		// il cui valore corrisponde a llis(s) :

		int m = mem[0][n];

		// ----------------------------------------------------

		int[] r = new int[m]; // per rappresentare una possibile LIS

		int j = n;
		int i = 0;
		int c = 0;

		if (m == 1) {
			r[c] = s[0];
		} else {
			while (mem[i][j] > 0) {
				int t = (j == n) ? 0 : s[j];
				if (s[i] <= t) {
					i++;
				} else if (1 + mem[i + 1][i] > mem[i + 1][j]) {
					j = i;
					i++;
				} else {
					i++;
				}

				t = (j == n) ? 0 : s[j];

				if (j != n && c > 0 && c < m && r[c - 1] != t) {
					r[c] = t;
					c++;
				} else if (c == 0 && j != n) {
					r[c] = t;
					c++;
				}
			}
		}
		return r; // = LIS relativa alla sequenza s
	}

} // class BottomUpLIS
