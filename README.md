Dota2 TI 8 Players Performance

![image](https://user-images.githubusercontent.com/43325087/48036848-b0292880-e12f-11e8-87e5-383d574359d3.png)

Dota2 is a multiplayer battle game operated by Valve. The TI (The International) is an annual tournament of Dota2. 

How did players perform in the TI8?

![image](https://user-images.githubusercontent.com/43325087/48036907-e666a800-e12f-11e8-9222-924598e2eee8.png)

	The project analyzed 65 players, performed features of their KDA, damage, and classified players into 3 clusters by k-means 

	Conducted by Cenal

Steps:

	Collected data from dota opendata

	Cleaned and saved data into csv file

	Data exploration and visualization


First, we get pair plot. It’s easily to see the linear relationship between some variables.

i.e. XPM and GPM is strictly positive, Deaths and XPM is negative linearly related, etc.

![image](https://user-images.githubusercontent.com/43325087/48036938-faaaa500-e12f-11e8-8c68-1c4caa410371.png)

Then the scatter plot of players’ KDA

![image](https://user-images.githubusercontent.com/43325087/48037043-6a209480-e130-11e8-87b9-8af91cead4db.png)

Let’s apply k-means cluster, by players’ KDA

K-means clustering with 3 clusters of sizes 29, 24, 12

Cluster means:

     Kills   Deaths   Assists      KDA
     
1 7.615414 4.187103  9.361621 4.125632

2 4.185750 4.875833 11.171250 3.167861

3 3.194833 5.663667 12.944167 2.883079

Players in cluster 1 definitely are most valuable players, with highest KDA, could be carry or mid; and players in cluster 3 with lowest KDA but have most assists.

![image](https://user-images.githubusercontent.com/43325087/48037114-b2d84d80-e130-11e8-9848-f927dc4cac19.png)

How do we know we should classify players into 3 groups but not 4 or 5?

Check the graph, start k=3, there’s no huge change in the slope so depend on the case, we decide to use k = 3.

![image](https://user-images.githubusercontent.com/43325087/48037136-cbe0fe80-e130-11e8-946d-942e4249b546.png)

Also, we plot the pair plot among K. D. A. KDA and mark the color on 3 clusters, with black indicates cluster 1, red indicates 2, and green indicates 3.

Kills and KDA are strictly positive, deaths and KDA are strictly negative, while assists and KDA are negative related but not in perfect linear shape.

![image](https://user-images.githubusercontent.com/43325087/48037149-d7ccc080-e130-11e8-9ab2-0894977ad5e1.png)

I order the player by their KDA, pick players with highest and lowest KDA, comparing them in a radar plot and bar plot

Name	    Kills	 Deaths	  Assists	 KDA

mianmian	2.827 	6.779 	12.500 	 2.26095 

Abed	    7.945 	3.436 	9.081 	4.95518 

![image](https://user-images.githubusercontent.com/43325087/48037171-e3b88280-e130-11e8-8a25-b7522c891b94.png)

![image](https://user-images.githubusercontent.com/43325087/48037177-ea46fa00-e130-11e8-9e0d-812290a2b59c.png)

Let’s check the clustering plot classified by hero damage each player causes

![image](https://user-images.githubusercontent.com/43325087/48037205-f7fc7f80-e130-11e8-8ce0-94887bd9a211.png)

Compare with kda’s cluster

![image](https://user-images.githubusercontent.com/43325087/48037217-02b71480-e131-11e8-8bea-d81351a71d7b.png)

The players in cluster 1 of damage are mostly belong to cluster 1 of KDA as well, and most of them are playing carry or solo mid.

![image](https://user-images.githubusercontent.com/43325087/48037227-0d71a980-e131-11e8-86ab-dbfde43ccc0f.png)

The scatter plot of hero damage and tower damage with players’ names. Easily to see, two kind of damages are positively linear related with upper right players resulting in carry or mid line.

![image](https://user-images.githubusercontent.com/43325087/48037253-195d6b80-e131-11e8-9277-eb25bba0a98e.png)

The repel plot in order to see details with each players’names.

![image](https://user-images.githubusercontent.com/43325087/48037275-27ab8780-e131-11e8-9320-6d172633f273.png)

![image](https://user-images.githubusercontent.com/43325087/48037293-3003c280-e131-11e8-8e3f-0d1e0e640869.png)

At last, a straight forward comparison between hero damage & tower damage, XPM & GPM of each player.







