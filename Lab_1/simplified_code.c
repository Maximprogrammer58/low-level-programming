#define _CRT_SECURE_NO_WARNINGS
#define SIZE 100

#include <stdio.h>

int main() {
	int n;         // r8d
	int arr[SIZE]; // array
	int i = 0;     // ecx

	scanf("%d", &n);

input_start:
	if (i == n) goto input_end;
	scanf("%d", &arr[i]);
	i += 1;
	goto input_start;
input_end:
	i = 0;
	int key;   // r9d 
	int tmp;   // r10d
	int j;     // r11d
sort_out_loop_start:
	if (i == n) goto sort_out_loop_end;
	key = arr[i];
	tmp = i;
	--tmp;
	j = tmp;
sort_inner_loop_start:
	if (j < 0) goto sort_inner_loop_end;
	if (arr[j] <= key) goto sort_inner_loop_end;
	int mov_tmp = arr[j];
	arr[j + 1] = mov_tmp;
	j -= 1;
	goto sort_inner_loop_start;
sort_inner_loop_end:
	arr[j + 1] = key;
	i += 1;
	goto sort_out_loop_start;
sort_out_loop_end:
	i = 0;
output_start:
	if (i == n) goto output_end;
	printf("%d ", arr[i]);
	i += 1;
	goto output_start;
output_end:

	return 0;
}