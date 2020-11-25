# Dataset
## Probar valores

~~~
max.depth = 2, n.pops = 20
max.depth = 3, n.pops = 20
max.depth = 4, n.pops = 20
max.depth = 4, n.pops = 50
~~~

- Iniciamos

~~~
hb.results <- hierBAPS(snp.matrix, n.cores = 6, max.depth = 2, n.pops = 20, quiet = TRUE)
~~~
 ![Alt text](https://github.com/TBmex/dataset/blob/main/Rplot_2_20_1.png)
 ![Alt text](https://github.com/TBmex/dataset/blob/main/Rplot_2_20_2.png)
 

~~~
hb.results <- hierBAPS(snp.matrix, n.cores = 6, max.depth = 3, n.pops = 20, quiet = TRUE)
~~~
![Alt text](https://github.com/TBmex/dataset/blob/main/Rplot_3_20_1.png)
![Alt text](https://github.com/TBmex/dataset/blob/main/Rplot_3_20_2.png)
![Alt text](https://github.com/TBmex/dataset/blob/main/Rplot_3_20_3.png)
~~~
hb.results <- hierBAPS(snp.matrix, n.cores = 6, max.depth = 4, n.pops = 20, quiet = TRUE)
~~~
![Alt text](https://github.com/TBmex/dataset/blob/main/Rplot_4_20_1.png)
![Alt text](https://github.com/TBmex/dataset/blob/main/Rplot_4_20_2.png)
![Alt text](https://github.com/TBmex/dataset/blob/main/Rplot_4_20_3.png)
![Alt text](https://github.com/TBmex/dataset/blob/main/Rplot_4_20_4.png)
~~~
hb.results <- hierBAPS(snp.matrix, n.cores = 6, max.depth = 4, n.pops = 50, quiet = TRUE)
~~~
![Alt text](https://github.com/TBmex/dataset/blob/main/Rplot_4_50_1.png)
![Alt text](https://github.com/TBmex/dataset/blob/main/Rplot_4_50_2.png)
![Alt text](https://github.com/TBmex/dataset/blob/main/Rplot_4_50_3.png)
![Alt text](https://github.com/TBmex/dataset/blob/main/Rplot_4_50_4.png)


- Probemos system time de:

~~~
max.depth = 4, n.pops = 20
max.depth = 4, n.pops = 50
max.depth = 4, n.pops = 100
~~~

~~~
> system.time(hierBAPS(snp.matrix, n.cores = 6, max.depth = 4, n.pops = 20, quiet = TRUE))
   user  system elapsed
 59.902  18.098  26.790

> system.time(hierBAPS(snp.matrix, n.cores = 6, max.depth = 4, n.pops = 50, quiet = TRUE))
    user  system elapsed
 499.334  47.396 110.925

> system.time(hierBAPS(snp.matrix, n.cores = 6, max.depth = 4, n.pops = 100, quiet = TRUE))
   user  system elapsed
468.577  33.076 102.328
~~~
