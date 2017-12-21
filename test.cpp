#include <stdio.h>
#include <string.h>

int main()
{
    int curr[100][100];
    int max_matrix[100][100];
    int avl[100];
    int running[100];
    int need_matrix[100][100];

    int i, j, exec, r, p;
    int count = 0;
    bool safe = false;

    printf("\nEnter the number of resources: ");
    scanf("%d", &r);

    printf("\nEnter the number of processes: ");
    scanf("%d", &p);
    for (i = 0; i < p; i++)
    {
        running[i] = 1;
        count++;
    }

    printf("\nEnter Allocated matrix: ");
    for (i = 0; i < p; i++)
    {
        for (j = 0; j < r; j++)
            scanf("%d", &curr[i][j]);
    }

    printf("\nEnter Maximum matrix: ");
    for (i = 0; i < p; i++)
    {
        for (j = 0; j < r; j++)
            scanf("%d", &max_matrix[i][j]);
    }

    printf("\nEnter available resource: ");
    for (i = 0; i < r; i++)
        scanf("%d", &avl[i]);

    printf("\nThe Allocated matrix:\n");
    for (i = 0; i < p; i++)
    {
        for (j = 0; j < r; j++)
            printf("\t%d", curr[i][j]);
        printf("\n");
    }

    printf("\nThe Maximum matrix:\n");
    for (i = 0; i < p; i++)
    {
        for (j = 0; j < r; j++)
            printf("\t%d", max_matrix[i][j]);
        printf("\n");
    }

    for (i = 0; i < p; i++)
    {
        for (j = 0; j < r; j++)
            need_matrix[i][j] = max_matrix[i][j] - curr[i][j];
    }

    printf("\nThe need matrix:\n");
    for (i = 0; i < p; i++)
    {
        for (j = 0; j < r; j++)
            printf("\t%d", need_matrix[i][j]);
        printf("\n");
    }



    printf("\nThe available resource is: ");
    for (i = 0; i < r; i++)
        printf("%d ", avl[i]);

    while (count != 0)
    {
        safe = false;
        for (i = 0; i < p; i++)
        {
            if (running[i])
            {
                exec = 1;
                for (j = 0; j < r; j++)
                {
                    if (max_matrix[i][j] - curr[i][j] > avl[j])
                    {
                        exec = 0;
                        break;
                    }
                }

                if (exec)
                {
                    printf("\nProcess%d is executing.\n", i + 1);
                    running[i] = 0;
                    count--;
                    safe = true;
                    for (j = 0; j < r; j++)
                        avl[j] += curr[i][j];
                    break;
                }
            }
        }

        if (!safe)
        {
            printf("\nThe processes are in unsafe state.");
            break;
        }

        if (safe)
            printf("\nThe process is in safe state.");

        printf("\nAvailable resource: ");
        for (i = 0; i < r; i++)
            printf("%d ", avl[i]);
    }

    return 0;
}
