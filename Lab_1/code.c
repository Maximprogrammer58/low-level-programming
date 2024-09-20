#define _CRT_SECURE_NO_WARNINGS
#define SIZE 100

#include <stdio.h>

int main() {
	int n;
	int arr[SIZE];

	scanf("%d", &n);

	for (int i = 0; i < n; ++i) {
		scanf("%d", &arr[i]);
	}

	for (int i = 0; i < n; ++i) {
		int key = arr[i];
		int j = i - 1;
		while (j >= 0 && arr[j] > key) {
			arr[j + 1] = arr[j];
			--j;
		}
		arr[j + 1] = key;
	}

	for (int i = 0; i < n; ++i) {
		printf("%d ", arr[i]);
	}

   return 0;
}