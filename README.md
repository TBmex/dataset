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
- *El tiempo de corrida puede variar dependiendo del "n.pops", se puede obtener el mismo resultado en menos tiempo.*
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

- ¿Los genotipos cambian de acuerdo con el max.depth? *NO*
- Se realizo la siguiente prueba con max.depth = 1 a 10, los arboles con parametro 6,7,8 9, y 10 presentaron 45 genotipos (arboles identicos).

~~~
hb.results <- hierBAPS(snp.matrix, n.cores = 6, max.depth = *1,2,3,4,5,6,7,8,9,10* n.pops = 50, quiet = TRUE)
~~~
![Alt text](https://github.com/TBmex/dataset/blob/main/Rplot_lvl6_to_lvl10.png)

- ¿Los genotipos se ven afectados por el numero de n.pops?
- *SI* cuando n.pops < genotipos esperados
- **Ejemplo**
~~~
hb.results <- hierBAPS(snp.matrix, n.cores = 6, max.depth = 10, n.pops = 2, quiet = TRUE)
~~~
![Alt text](https://github.com/TBmex/dataset/blob/main/Rplot_lvl4_10_2.png)
- *NO* cuando n.pops > genotipos esperados
- **Ejemplo**
~~~
hb.results <- hierBAPS(snp.matrix, n.cores = 6, max.depth = 10, n.pops = 50, quiet = TRUE)
~~~
![Alt text](https://github.com/TBmex/dataset/blob/main/Rplot_lvl4_10_50.png)
