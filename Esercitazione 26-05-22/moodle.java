public static int middleOfThree(int x, int y, int z) {
	if (y <= x && x <= z || z <= x && x <= y) {
		return x;
	} else if (x <= y && y <= z || z <= y && y <= x) {
		return y;
	} else {
		return z;
	}
}

public static int lunchTime(int branch, int leaf, int rest) {
	int ate = 0;
	for (int i = 0; i <= branch; i = i + rest) {
		if (i % leaf == 0) {
			ate++;
		}
	}
	return ate;
}

public static double[] closestPair(double[] s) {
	double diff = Math.abs(s[0] - s[1]);
	double[] result = new double[2];
	for (int i = 1; i < s.length; i++) {
		for (int j = 0; j < s.length; j++) {
			if (Math.abs(s[i] - s[j]) < diff && i != j) {
				diff = Math.abs(s[i] - s[j]);
				if (s[i] < s[j]) {
					result[0] = s[i];
					result[1] = s[j];
				} else {
					result[1] = s[i];
					result[0] = s[j];
				}
			}
		}
	}
	return result;
}

public static boolean symmetricalMatrix(double[][] matrix) {
	for (int i = 0; i < matrix.length; i++) {
		for (int j = 0; j < matrix.length; j++) {
			if (matrix[i][j] != matrix[j][i]) {
				return false;
			}
		}
	}
	return true;
}