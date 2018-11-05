# load the data
> player<-read.csv("player.csv",TRUE,",")

# let the players' names be the rownames
> playerr<-player[,-1]
> rownames(playerr)<-player[,1]
> head(playerr)
              XPM     GPM Kills Deaths Assists last.hit winrate Tower_Damage Hero_Damage
9pasha    481.824 448.667 5.233  4.190  10.621     1011  63.50%          987       11818
Abed      594.600 575.695 7.945  3.436   9.081      676  57.69%         2927       25568
Ameame    591.680 593.048 7.327  3.504   9.257      413  64.41%         4081       21881
ana       565.484 590.464 8.252  4.832   9.596      250  62.00%         3728       25805
Archangel 603.200 624.800 7.981  4.019   8.583      566  53.71%         5087       22307
ARMEL     593.360 589.733 8.955  4.121   9.025      513  57.31%         3259       23580

# add new column, KDA
> playerr$KDA<-(playerr$Kills+playerr$Assists)/playerr$Deaths
> head(playerr)
           XPM     GPM Kills Deaths Assists last.hit winrate Tower_Damage Hero_Damage rownames
y      303.736 281.568 2.940  5.256  11.988      655  56.18%          304        6950        1
xNova  338.148 292.659 3.057  5.301  12.919      528  59.66%          403        8353        2
Solo   347.989 319.288 3.589  5.850  11.776     1224  61.11%          525        8595        3
XCJ    301.385 257.066 2.704  5.659  12.425      226  55.31%          285        8725        4
KuroKy 343.999 309.807 3.736  5.182  10.802     1619  64.55%          470        8742        5
Faith  316.391 278.551 2.924  5.055  11.280     1611  59.09%          577        8817        6
            KDA
y      2.840183
xNova  3.013771
Solo   2.626496
XCJ    2.673441
KuroKy 2.805481
Faith  2.809891


#get pair plot
> pairs(playerr)

# get the subset of KDA
> player_kda<-playerr[c(3:5,10)]
> head(player_kda)
          Kills Deaths Assists      KDA
Archangel 7.981  4.019   8.583 4.121423
Abed      7.945  3.436   9.081 4.955180
ARMEL     8.955  4.121   9.025 4.363019
Ameame    7.327  3.504   9.257 4.732877
Miracle-  9.179  4.227   7.993 4.062456
Ori       8.123  3.711  10.155 4.925357

# 3D plot of KDA
> library(scatterplot3d)
> scatterplot3d(player_kda$Kills, player_kda$Deaths,player_kda$Assists,color=c("red"),main= "3D scatter plot on KDA",xlab="Kills",ylab="Deaths",zlab="Assists")

# apply k-means clusters, by KDA
> kmkda<-kmeans(player_kda,center=3,nstart=25)
> kmkda
K-means clustering with 3 clusters of sizes 29, 24, 12

Cluster means:
     Kills   Deaths   Assists      KDA
1 7.615414 4.187103  9.361621 4.125632
2 4.185750 4.875833 11.171250 3.167861
3 3.194833 5.663667 12.944167 2.883079

Clustering vector:
     Archangel           Abed          ARMEL         Ameame       Miracle-            Ori 
             1              1              1              1              1              1 
          Sccc         Topson       Paparazi            Zyd      RAMZeS666            ana 
             1              1              1              1              1              1 
         Moonn         xiaoke          Noone         SumaiL         MidOne            rtz 
             1              1              1              1              1              1 
         Gabbi            w33     MATUMBAMAN          Nisha          Mushi          Moogy 
             1              1              1              1              1              1 
     zhizhizhi           XinQ             MP           Kuku            Pyw        jianlai 
             1              1              1              1              1              2 
       Chalice         9pasha             s4      iceiceice    MinDContRoL           kpii 
             2              2              2              2              2              2 
          Yang           tavo     Faith_bian             DJ       MrKingao           JAbz 
             2              2              2              2              2              2 
           zai BigDaddyN0tail           Tims         YapzOr          Febby             Gh 
             2              2              3              3              2              3 
           Ceb         RodjER             fy           Fade           Solo         misery 
             2              3              2              3              3              2 
        KuroKy          JerAx         Puppey          xNova           Cr1t       tianming 
             2              3              2              3              2              3 
      mianmian            Fly          Faith              y            XCJ 
             3              2              2              3              3 

Within cluster sum of squares by cluster:
[1] 46.00321 30.52888 15.87861
 (between_SS / total_SS =  80.9 %)

Available components:

[1] "cluster"      "centers"      "totss"        "withinss"     "tot.withinss" "betweenss"   
[7] "size"         "iter"         "ifault"      

> set.seed(111)
> library(factoextra)
Loading required package: ggplot2
Welcome! Related Books: `Practical Guide To Cluster Analysis in R` at https://goo.gl/13EFCZ

# determine which k we should use
> fviz_nbclust(player_kda,kmeans,method="wss")

# plot the pair plot
> plot(player_kda[c("Kills","Deaths","Assists","KDA")],col=kmkda$cluster)

# plot the cluster plot
> fviz_cluster(kmkda,data=player_kda,geom="text",reple=TRUE,pointsize=0.5,labelsize=8)


#rank by KDA
> order_kda<-order(playerr$KDA)
> playerr<-playerr[order_kda,]
> head(playerr)
             XPM     GPM Kills Deaths Assists last.hit winrate Tower_Damage Hero_Damage
mianmian 322.019 263.817 2.827  6.779  12.500      104  36.54%          192        8956
RodjER   361.158 312.657 3.469  6.124  12.554      708  56.78%          397       10463
Solo     347.989 319.288 3.589  5.850  11.776     1224  61.11%          525        8595
Cr1t     325.115 283.024 3.129  5.385  11.110     1150  55.30%          434       10025
Ceb      369.524 334.083 3.662  5.156   9.979      865  51.79%         1783       17215
XCJ      301.385 257.066 2.704  5.659  12.425      226  55.31%          285        8725
              KDA
mianmian 2.260953
RodjER   2.616427
Solo     2.626496
Cr1t     2.644197
Ceb      2.645656
XCJ      2.673441

> top_vs_bottom<-playerr[c(1,64),]
> top_vs_bottom
             XPM     GPM Kills Deaths Assists last.hit winrate Tower_Damage Hero_Damage
mianmian 322.019 263.817 2.827  6.779  12.500      104  36.54%          192        8956
Abed     594.600 575.695 7.945  3.436   9.081      676  57.69%         2927       25568
              KDA
mianmian 2.260953
Abed     4.955180

> top_vs_bottom_kda<-top_vs_bottom[c(3:5,9)]
> top_vs_bottom_kda
         Kills Deaths Assists      KDA
mianmian 2.827  6.779  12.500 2.260953
Abed     7.945  3.436   9.081 4.955180

# get the radar plot of the two players
> library(fmsb)
> colors_border=c( rgb(0.2,0.5,0.5,0.9), rgb(0.8,0.2,0.5,0.9) )
> colors_in=c( rgb(0.2,0.5,0.5,0.4), rgb(0.8,0.2,0.5,0.4))
> data=rbind(rep(20,10),rep(1,10),top_vs_bottom_kda)
> radarchart(data,pcol=colors_border,pfcol=colors_in)
> legend(x=0.7,y=1,row.names(data),pch=19,col=colors_in,cex=1.2,pt.cex=1,bty="n")

# bar plot to compare KDA of the two players
> top_vs_botton<-as.matrix(top_vs_botton)
> barplot(top_vs_botton,col=colors()[c(11,40)],border="white", font.axis=2, beside=T, legend=rownames(top_vs_botton),xlab="group", font.lab=2)

# compare performance among teams
> team<-read.csv("team.csv",TRUE,",")
> head(team)
       X...Name      XPM      GPM    Kills   Deaths   Assists winrate_wilson   sum
1   Vici Gaming 518.2052 499.3729 6.098891 4.127079 10.352588      0.5497402 22403
2  TNC Predator 498.0236 473.9021 6.401653 4.958678 10.907025      0.5500000 26395
3 Team Serenity 483.4031 461.6112 6.019849 4.728268  9.703628      0.4829317 14177
4       Mineski 477.7591 458.3402 5.543210 4.379301 10.288153      0.5621228 39167
5        Fnatic 467.4651 441.2623 5.592341 4.500721 10.815936      0.5786601 52533
6    Virtus.pro 461.5010 437.7817 5.584682 4.674554 10.921752      0.6009500 52621
> teamm<-team[,-1]
> rownames(teamm)<-team[,1]
> head(teamm)
                   XPM      GPM    Kills   Deaths   Assists winrate_wilson   sum
Vici Gaming   518.2052 499.3729 6.098891 4.127079 10.352588      0.5497402 22403
TNC Predator  498.0236 473.9021 6.401653 4.958678 10.907025      0.5500000 26395
Team Serenity 483.4031 461.6112 6.019849 4.728268  9.703628      0.4829317 14177
Mineski       477.7591 458.3402 5.543210 4.379301 10.288153      0.5621228 39167
Fnatic        467.4651 441.2623 5.592341 4.500721 10.815936      0.5786601 52533
Virtus.pro    461.5010 437.7817 5.584682 4.674554 10.921752      0.6009500 52621
> team_compare<-teamm[1:2]
> team_compare<-as.matrix(team_compare)
> head(team_compare)
                   XPM      GPM
Vici Gaming   518.2052 499.3729
TNC Predator  498.0236 473.9021
Team Serenity 483.4031 461.6112
Mineski       477.7591 458.3402
Fnatic        467.4651 441.2623
Virtus.pro    461.5010 437.7817

> par(mar=c(6,8,6,6))
> barplot(team_compare,col=colors()[c(639,11)],border="white",legend=rownames(team_compare),font.lab=3,las=1,horiz=TRUE)


> teamm$KDA<-(teamm$Kills+teamm$Assists)/teamm$Deaths
> head(teamm)
                 XPM    GPM Kills Deaths Assists winrate_wilson   sum      KDA
Vici Gaming   518.21 499.37  6.10   4.13   10.35           0.55 22403 3.983051
TNC Predator  498.02 473.90  6.40   4.96   10.91           0.55 26395 3.489919
Team Serenity 483.40 461.61  6.02   4.73    9.70           0.48 14177 3.323467
Mineski       477.76 458.34  5.54   4.38   10.29           0.56 39167 3.614155
Fnatic        467.47 441.26  5.59   4.50   10.82           0.58 52533 3.646667
Virtus.pro    461.50 437.78  5.58   4.67   10.92           0.60 52621 3.533191
> KDA_team<-teamm[c(3:5,8)]
> KDA_team
              Kills Deaths Assists      KDA
Vici Gaming    6.10   4.13   10.35 3.983051
TNC Predator   6.40   4.96   10.91 3.489919
Team Serenity  6.02   4.73    9.70 3.323467
Mineski        5.54   4.38   10.29 3.614155
Fnatic         5.59   4.50   10.82 3.646667
Virtus.pro     5.58   4.67   10.92 3.533191
paiN Gaming    5.25   4.94   10.31 3.149798
Newbee         5.56   4.37   10.04 3.569794
PSG.LGD        5.46   4.42   10.76 3.669683
Team Liquid    5.58   4.88   10.71 3.338115
Evil Geniuses  4.99   4.50   10.18 3.371111
Team Secret    4.57   4.59   11.40 3.479303
OG             4.40   5.08   10.86 3.003937
EHOME          3.52   5.26   12.12 2.973384
VGJ Thunder    2.99   5.43   13.51 3.038674
iG.Vitality    2.83   6.78   12.50 2.261062
> rank_team<-order(KDA_team$KDA)
> KDA_team<-KDA_team[rank_team,]
> KDA_team
              Kills Deaths Assists      KDA
iG.Vitality    2.83   6.78   12.50 2.261062
EHOME          3.52   5.26   12.12 2.973384
OG             4.40   5.08   10.86 3.003937
VGJ Thunder    2.99   5.43   13.51 3.038674
paiN Gaming    5.25   4.94   10.31 3.149798
Team Serenity  6.02   4.73    9.70 3.323467
Team Liquid    5.58   4.88   10.71 3.338115
Evil Geniuses  4.99   4.50   10.18 3.371111
Team Secret    4.57   4.59   11.40 3.479303
TNC Predator   6.40   4.96   10.91 3.489919
Virtus.pro     5.58   4.67   10.92 3.533191
Newbee         5.56   4.37   10.04 3.569794
Mineski        5.54   4.38   10.29 3.614155
Fnatic         5.59   4.50   10.82 3.646667
PSG.LGD        5.46   4.42   10.76 3.669683
Vici Gaming    6.10   4.13   10.35 3.983051
> top4_vs_bottom4<-KDA_team[c(1:4,13:16),]
> top4_vs_bottom4
            Kills Deaths Assists      KDA
iG.Vitality  2.83   6.78   12.50 2.261062
EHOME        3.52   5.26   12.12 2.973384
OG           4.40   5.08   10.86 3.003937
VGJ Thunder  2.99   5.43   13.51 3.038674
Mineski      5.54   4.38   10.29 3.614155
Fnatic       5.59   4.50   10.82 3.646667
PSG.LGD      5.46   4.42   10.76 3.669683
Vici Gaming  6.10   4.13   10.35 3.983051

# radar plot of top 4 and bottom 4 teams
> library(fmsb)
> class(top4_vs_bottom4)
[1] "data.frame"
> par(mar=c(6,5,6,6))
>color=brewer.pal(8,name='Spectral')
> radarchart(data,pcol=color)
> legend(-1.2,1.55,rownames(data),cex=1,pt.cex=1,col=color,bty="n",pch=19)

# k-means cluster by damage
set.seed(111)
> library(factoextra)
Welcome! Related Books: `Practical Guide To Cluster Analysis in R` at https://goo.gl/13EFCZ
> kmdamage<-kmeans(damage,center=3,nstart=25)
> kmdamage
K-means clustering with 3 clusters of sizes 17, 21, 27

Cluster means:
  Tower_Damage Hero_Damage
1    2039.4118    17660.94
2    3574.1905    23918.10
3     498.0741    10370.44

Clustering vector:
        9pasha           Abed         Ameame            ana      Archangel          ARMEL BigDaddyN0tail 
             3              2              2              2              2              2              1 
           Ceb        Chalice           Cr1t             DJ           Fade          Faith     Faith_bian 
             1              1              3              3              3              3              3 
         Febby            Fly             fy          Gabbi             Gh      iceiceice           JAbz 
             3              3              3              2              3              1              1 
         JerAx        jianlai           kpii           Kuku         KuroKy     MATUMBAMAN       mianmian 
             3              1              3              1              3              2              3 
        MidOne    MinDContRoL       Miracle-         misery          Moogy          Moonn             MP 
             2              1              2              3              2              2              1 
      MrKingao          Mushi          Nisha          Noone            Ori       Paparazi         Puppey 
             3              1              2              2              2              2              3 
           Pyw      RAMZeS666         RodjER            rtz             s4           Sccc           Solo 
             1              2              3              2              1              2              3 
        SumaiL           tavo       tianming           Tims         Topson            w33            XCJ 
             2              1              3              3              2              1              3 
        xiaoke           XinQ          xNova              y           Yang         YapzOr            zai 
             2              1              3              3              3              3              3 
     zhizhizhi            Zyd 
             1              1 


Within cluster sum of squares by cluster:
[1] 48966631 91982935 76091103
 (between_SS / total_SS =  91.4 %)

Available components:

[1] "cluster"      "centers"      "totss"        "withinss"     "tot.withinss" "betweenss"    "size"        
[8] "iter"         "ifault"      
> fviz_cluster(kmdamage,data=damage,geom="text",reple=TRUE,pointsize=0.5,labelsize=8)


> playerr$rownames<-c(1:65)
> class(playerr$rownames)
[1] "integer"


> plot(playerr$rownames,y=playerr$Hero_Damage,col="tomato3",xlab="player_index", ylab="damage")
> par(new=TRUE)
> plot(x=playerr$rownames,y=playerr$Tower_Damage,col="turquoise4",ylab="",xlab="")
> legend("topleft", legend=c("Hero_Damage", "Tower_Damage"),col=c("tomato3","turquoise4"),bty="n",pch=c(1,1))

#rank by hero damage
> order_player<-order(playerr$Hero_Damage)
> playerr<-playerr[order_player,]
> head(playerr)
           XPM     GPM Kills Deaths Assists last.hit winrate Tower_Damage Hero_Damage
y      303.736 281.568 2.940  5.256  11.988      655  56.18%          304        6950
xNova  338.148 292.659 3.057  5.301  12.919      528  59.66%          403        8353
Solo   347.989 319.288 3.589  5.850  11.776     1224  61.11%          525        8595
XCJ    301.385 257.066 2.704  5.659  12.425      226  55.31%          285        8725
KuroKy 343.999 309.807 3.736  5.182  10.802     1619  64.55%          470        8742
Faith  316.391 278.551 2.924  5.055  11.280     1611  59.09%          577        8817
> tail(playerr)
             XPM     GPM Kills Deaths Assists last.hit winrate Tower_Damage Hero_Damage
Abed     594.600 575.695 7.945  3.436   9.081      676  57.69%         2927       25568
ana      565.484 590.464 8.252  4.832   9.596      250  62.00%         3728       25805
Miracle- 585.100 595.084 9.179  4.227   7.993      753  66.00%         3762       25919
Nisha    527.083 496.118 6.407  4.841  10.410      636  51.89%         3470       26207
Topson   568.175 507.845 8.555  5.350   9.800      200  54.50%         2802       26985
Noone    559.660 544.125 7.892  3.740   9.935     1065  62.35%         3800       26998



> damage<-playerr[8:9]
> head(damage)
          Tower_Damage Hero_Damage
9pasha             987       11818
Abed              2927       25568
Ameame            4081       21881
ana               3728       25805
Archangel         5087       22307
ARMEL             3259       23580

# plot of player's hero damage vs tower damage with labels
> ggplot(damage,aes(x=Tower_Damage,y=Hero_Damage))+
+ geom_point()+
+ geom_text(label=rownames(damage),size = 2, nudge_x=0.25,nudge_y=0.25,check_overlap=TRUE)
> ggplot(damage,aes(x=Tower_Damage,y=Hero_Damage))+
+ geom_point()+
+ geom_label(label=rownames(damage),label.size=0.5,nudge_x=0.2,nudge_y=0.2)


> ggplot(damage,aes(x=Tower_Damage,y=Hero_Damage))+
+ geom_point()
> ggplot(damage,aes(x=Tower_Damage,y=Hero_Damage,label=rownames(damage)))+
+ geom_text_repel(segment.color="grey50",nudge_x=0.25,nudge_y=0.25)+
+ geom_point()

> plot(playerr$rownames,y=playerr$XPM,col="tomato3",xlab="player_index", ylab="Performance",ylim=c(250,700))
> par(new=TRUE)
> plot(x=playerr$rownames,y=playerr$GPM,col="turquoise4",ylab="",xlab="",ylim=c(250,700))
> legend("topleft", legend=c("XPM", "GPM"),col=c("tomato3","turquoise4"),bty="n",pch=c(1,1))
