# MoneyBall Project
> # This project I will help Oakland A's recruit under-valued players
> #Datasource: http://www.seanlahman.com/baseball-archive/statistics/
> #For more information https://en.wikipedia.org/wiki/Moneyball
> batting <- read.csv('Batting.csv')
> head(batting)
   playerID yearID stint teamID lgID  G G_batting AB R H X2B X3B HR RBI SB CS BB SO IBB HBP SH SF GIDP G_old
1 aardsda01   2004     1    SFN   NL 11        11  0 0 0   0   0  0   0  0  0  0  0   0   0  0  0    0    11
2 aardsda01   2006     1    CHN   NL 45        43  2 0 0   0   0  0   0  0  0  0  0   0   0  1  0    0    45
3 aardsda01   2007     1    CHA   AL 25         2  0 0 0   0   0  0   0  0  0  0  0   0   0  0  0    0     2
4 aardsda01   2008     1    BOS   AL 47         5  1 0 0   0   0  0   0  0  0  0  1   0   0  0  0    0     5
5 aardsda01   2009     1    SEA   AL 73         3  0 0 0   0   0  0   0  0  0  0  0   0   0  0  0    0    NA
6 aardsda01   2010     1    SEA   AL 53         4  0 0 0   0   0  0   0  0  0  0  0   0   0  0  0    0    NA
> str(batting)
'data.frame':	97889 obs. of  24 variables:
 $ playerID : Factor w/ 18107 levels "aardsda01","aaronha01",..: 1 1 1 1 1 1 1 2 2 2 ...
 $ yearID   : int  2004 2006 2007 2008 2009 2010 2012 1954 1955 1956 ...
 $ stint    : int  1 1 1 1 1 1 1 1 1 1 ...
 $ teamID   : Factor w/ 149 levels "ALT","ANA","ARI",..: 117 35 33 16 116 116 93 80 80 80 ...
 $ lgID     : Factor w/ 6 levels "AA","AL","FL",..: 4 4 2 2 2 2 2 4 4 4 ...
 $ G        : int  11 45 25 47 73 53 1 122 153 153 ...
 $ G_batting: int  11 43 2 5 3 4 NA 122 153 153 ...
 $ AB       : int  0 2 0 1 0 0 NA 468 602 609 ...
 $ R        : int  0 0 0 0 0 0 NA 58 105 106 ...
 $ H        : int  0 0 0 0 0 0 NA 131 189 200 ...
 $ X2B      : int  0 0 0 0 0 0 NA 27 37 34 ...
 $ X3B      : int  0 0 0 0 0 0 NA 6 9 14 ...
 $ HR       : int  0 0 0 0 0 0 NA 13 27 26 ...
 $ RBI      : int  0 0 0 0 0 0 NA 69 106 92 ...
 $ SB       : int  0 0 0 0 0 0 NA 2 3 2 ...
 $ CS       : int  0 0 0 0 0 0 NA 2 1 4 ...
 $ BB       : int  0 0 0 0 0 0 NA 28 49 37 ...
 $ SO       : int  0 0 0 1 0 0 NA 39 61 54 ...
 $ IBB      : int  0 0 0 0 0 0 NA NA 5 6 ...
 $ HBP      : int  0 0 0 0 0 0 NA 3 3 2 ...
 $ SH       : int  0 1 0 0 0 0 NA 6 7 5 ...
 $ SF       : int  0 0 0 0 0 0 NA 4 4 7 ...
 $ GIDP     : int  0 0 0 0 0 0 NA 13 20 21 ...
 $ G_old    : int  11 45 2 5 NA NA NA 122 153 153 ...
> head(batting$AB)
[1] 0 2 0 1 0 0
> head(batting$X2B)
[1] 0 0 0 0 0 0
> #Batting Avg=Hits/At Base
> batting$BA <- batting$H / batting$AB #Batting Avg=Hits/At Base
> tail(batting$BA,5)
[1] 0.1230769 0.2746479 0.1470588 0.2745098 0.2138728
> # On Base Percentage
> batting$OBP <- (batting$H + batting$BB + batting$HBP)/(batting$AB + batting$BB + batting$HBP + batting$SF)
> # Creating X1B (Singles)
> batting$X1B <- batting$H - batting$X2B - batting$X3B - batting$HR
> # Creating Slugging Average (SLG)
> batting$SLG <- ((1 * batting$X1B) + (2 * batting$X2B) + (3 * batting$X3B) + (4 * batting$HR) ) / batting$AB
> str(batting)
'data.frame':	97889 obs. of  28 variables:
 $ playerID : Factor w/ 18107 levels "aardsda01","aaronha01",..: 1 1 1 1 1 1 1 2 2 2 ...
 $ yearID   : int  2004 2006 2007 2008 2009 2010 2012 1954 1955 1956 ...
 $ stint    : int  1 1 1 1 1 1 1 1 1 1 ...
 $ teamID   : Factor w/ 149 levels "ALT","ANA","ARI",..: 117 35 33 16 116 116 93 80 80 80 ...
 $ lgID     : Factor w/ 6 levels "AA","AL","FL",..: 4 4 2 2 2 2 2 4 4 4 ...
 $ G        : int  11 45 25 47 73 53 1 122 153 153 ...
 $ G_batting: int  11 43 2 5 3 4 NA 122 153 153 ...
 $ AB       : int  0 2 0 1 0 0 NA 468 602 609 ...
 $ R        : int  0 0 0 0 0 0 NA 58 105 106 ...
 $ H        : int  0 0 0 0 0 0 NA 131 189 200 ...
 $ X2B      : int  0 0 0 0 0 0 NA 27 37 34 ...
 $ X3B      : int  0 0 0 0 0 0 NA 6 9 14 ...
 $ HR       : int  0 0 0 0 0 0 NA 13 27 26 ...
 $ RBI      : int  0 0 0 0 0 0 NA 69 106 92 ...
 $ SB       : int  0 0 0 0 0 0 NA 2 3 2 ...
 $ CS       : int  0 0 0 0 0 0 NA 2 1 4 ...
 $ BB       : int  0 0 0 0 0 0 NA 28 49 37 ...
 $ SO       : int  0 0 0 1 0 0 NA 39 61 54 ...
 $ IBB      : int  0 0 0 0 0 0 NA NA 5 6 ...
 $ HBP      : int  0 0 0 0 0 0 NA 3 3 2 ...
 $ SH       : int  0 1 0 0 0 0 NA 6 7 5 ...
 $ SF       : int  0 0 0 0 0 0 NA 4 4 7 ...
 $ GIDP     : int  0 0 0 0 0 0 NA 13 20 21 ...
 $ G_old    : int  11 45 2 5 NA NA NA 122 153 153 ...
 $ BA       : num  NaN 0 NaN 0 NaN ...
 $ OBP      : num  NaN 0 NaN 0 NaN ...
 $ X1B      : int  0 0 0 0 0 0 NA 85 116 126 ...
 $ SLG      : num  NaN 0 NaN 0 NaN ...
> sal <- read.csv('Salaries.csv')
> summary(batting)
      playerID         yearID         stint           teamID        lgID             G            G_batting            AB              R         
 mcguide01:   31   Min.   :1871   Min.   :1.000   CHN    : 4720   AA  : 1890   Min.   :  1.00   Min.   :  0.00   Min.   :  0.0   Min.   :  0.00  
 henderi01:   29   1st Qu.:1931   1st Qu.:1.000   PHI    : 4621   AL  :44369   1st Qu.: 13.00   1st Qu.:  7.00   1st Qu.:  9.0   1st Qu.:  0.00  
 newsobo01:   29   Median :1970   Median :1.000   PIT    : 4575   FL  :  470   Median : 35.00   Median : 32.00   Median : 61.0   Median :  5.00  
 johnto01 :   28   Mean   :1962   Mean   :1.077   SLN    : 4535   NL  :49944   Mean   : 51.65   Mean   : 49.13   Mean   :154.1   Mean   : 20.47  
 kaatji01 :   28   3rd Qu.:1995   3rd Qu.:1.000   CIN    : 4393   PL  :  147   3rd Qu.: 81.00   3rd Qu.: 81.00   3rd Qu.:260.0   3rd Qu.: 31.00  
 ansonca01:   27   Max.   :2013   Max.   :5.000   CLE    : 4318   UA  :  332   Max.   :165.00   Max.   :165.00   Max.   :716.0   Max.   :192.00  
 (Other)  :97717                                  (Other):70727   NA's:  737                    NA's   :1406     NA's   :6413    NA's   :6413    
       H               X2B            X3B               HR              RBI               SB                CS               BB               SO        
 Min.   :  0.00   Min.   : 0.0   Min.   : 0.000   Min.   : 0.000   Min.   :  0.00   Min.   :  0.000   Min.   : 0.000   Min.   :  0.00   Min.   :  0.00  
 1st Qu.:  1.00   1st Qu.: 0.0   1st Qu.: 0.000   1st Qu.: 0.000   1st Qu.:  0.00   1st Qu.:  0.000   1st Qu.: 0.000   1st Qu.:  0.00   1st Qu.:  2.00  
 Median : 12.00   Median : 2.0   Median : 0.000   Median : 0.000   Median :  5.00   Median :  0.000   Median : 0.000   Median :  4.00   Median : 11.00  
 Mean   : 40.37   Mean   : 6.8   Mean   : 1.424   Mean   : 3.002   Mean   : 18.47   Mean   :  3.265   Mean   : 1.385   Mean   : 14.21   Mean   : 21.95  
 3rd Qu.: 66.00   3rd Qu.:10.0   3rd Qu.: 2.000   3rd Qu.: 3.000   3rd Qu.: 28.00   3rd Qu.:  2.000   3rd Qu.: 1.000   3rd Qu.: 21.00   3rd Qu.: 31.00  
 Max.   :262.00   Max.   :67.0   Max.   :36.000   Max.   :73.000   Max.   :191.00   Max.   :138.000   Max.   :42.000   Max.   :232.00   Max.   :223.00  
 NA's   :6413     NA's   :6413   NA's   :6413     NA's   :6413     NA's   :6837     NA's   :7713      NA's   :29867    NA's   :6413     NA's   :14251   
      IBB              HBP               SH               SF             GIDP           G_old              BA             OBP             X1B        
 Min.   :  0.00   Min.   : 0.000   Min.   : 0.000   Min.   : 0.0    Min.   : 0.00   Min.   :  0.00   Min.   :0.000   Min.   :0.00    Min.   :  0.00  
 1st Qu.:  0.00   1st Qu.: 0.000   1st Qu.: 0.000   1st Qu.: 0.0    1st Qu.: 0.00   1st Qu.: 11.00   1st Qu.:0.148   1st Qu.:0.19    1st Qu.:  1.00  
 Median :  0.00   Median : 0.000   Median : 1.000   Median : 0.0    Median : 1.00   Median : 34.00   Median :0.231   Median :0.29    Median :  9.00  
 Mean   :  1.28   Mean   : 1.136   Mean   : 2.564   Mean   : 1.2    Mean   : 3.33   Mean   : 50.99   Mean   :0.209   Mean   :0.26    Mean   : 29.14  
 3rd Qu.:  1.00   3rd Qu.: 1.000   3rd Qu.: 3.000   3rd Qu.: 2.0    3rd Qu.: 5.00   3rd Qu.: 82.00   3rd Qu.:0.275   3rd Qu.:0.34    3rd Qu.: 48.00  
 Max.   :120.00   Max.   :51.000   Max.   :67.000   Max.   :19.0    Max.   :36.00   Max.   :165.00   Max.   :1.000   Max.   :1.00    Max.   :225.00  
 NA's   :42977    NA's   :9233     NA's   :12751    NA's   :42446   NA's   :32521   NA's   :5189     NA's   :13520   NA's   :49115   NA's   :6413    
      SLG       
 Min.   :0.000  
 1st Qu.:0.179  
 Median :0.309  
 Mean   :0.291  
 3rd Qu.:0.397  
 Max.   :4.000  
 NA's   :13520  
> batting <- subset(batting,yearID >= 1985)
> summary(batting)
      playerID         yearID         stint          teamID      lgID             G           G_batting            AB              R         
 moyerja01:   27   Min.   :1985   Min.   :1.00   SDN    : 1313   AA:    0   Min.   :  1.0   Min.   :  0.00   Min.   :  0.0   Min.   :  0.00  
 mulhote01:   26   1st Qu.:1993   1st Qu.:1.00   CLE    : 1306   AL:17226   1st Qu.: 14.0   1st Qu.:  4.00   1st Qu.:  3.0   1st Qu.:  0.00  
 weathda01:   26   Median :2000   Median :1.00   PIT    : 1299   FL:    0   Median : 34.0   Median : 27.00   Median : 47.0   Median :  4.00  
 maddugr01:   25   Mean   :2000   Mean   :1.08   NYN    : 1297   NL:18426   Mean   : 51.7   Mean   : 46.28   Mean   :144.7   Mean   : 19.44  
 sierrru01:   25   3rd Qu.:2007   3rd Qu.:1.00   BOS    : 1279   PL:    0   3rd Qu.: 77.0   3rd Qu.: 77.00   3rd Qu.:241.0   3rd Qu.: 30.00  
 thomeji01:   25   Max.   :2013   Max.   :4.00   CIN    : 1279   UA:    0   Max.   :163.0   Max.   :163.00   Max.   :716.0   Max.   :152.00  
 (Other)  :35498                                 (Other):27879                              NA's   :1406     NA's   :4377    NA's   :4377    
       H               X2B              X3B               HR              RBI               SB                CS               BB        
 Min.   :  0.00   Min.   : 0.000   Min.   : 0.000   Min.   : 0.000   Min.   :  0.00   Min.   :  0.000   Min.   : 0.000   Min.   :  0.00  
 1st Qu.:  0.00   1st Qu.: 0.000   1st Qu.: 0.000   1st Qu.: 0.000   1st Qu.:  0.00   1st Qu.:  0.000   1st Qu.: 0.000   1st Qu.:  0.00  
 Median :  8.00   Median : 1.000   Median : 0.000   Median : 0.000   Median :  3.00   Median :  0.000   Median : 0.000   Median :  3.00  
 Mean   : 37.95   Mean   : 7.293   Mean   : 0.824   Mean   : 4.169   Mean   : 18.41   Mean   :  2.811   Mean   : 1.219   Mean   : 14.06  
 3rd Qu.: 61.00   3rd Qu.:11.000   3rd Qu.: 1.000   3rd Qu.: 5.000   3rd Qu.: 27.00   3rd Qu.:  2.000   3rd Qu.: 1.000   3rd Qu.: 21.00  
 Max.   :262.00   Max.   :59.000   Max.   :23.000   Max.   :73.000   Max.   :165.00   Max.   :110.000   Max.   :29.000   Max.   :232.00  
 NA's   :4377     NA's   :4377     NA's   :4377     NA's   :4377     NA's   :4377     NA's   :4377      NA's   :4377     NA's   :4377    
       SO              IBB               HBP               SH               SF              GIDP           G_old             BA             OBP       
 Min.   :  0.00   Min.   :  0.000   Min.   : 0.000   Min.   : 0.000   Min.   : 0.000   Min.   : 0.00   Min.   :  0.0   Min.   :0.000   Min.   :0.000  
 1st Qu.:  1.00   1st Qu.:  0.000   1st Qu.: 0.000   1st Qu.: 0.000   1st Qu.: 0.000   1st Qu.: 0.00   1st Qu.: 11.0   1st Qu.:0.136   1st Qu.:0.188  
 Median : 12.00   Median :  0.000   Median : 0.000   Median : 0.000   Median : 0.000   Median : 1.00   Median : 32.0   Median :0.233   Median :0.296  
 Mean   : 27.03   Mean   :  1.171   Mean   : 1.273   Mean   : 1.465   Mean   : 1.212   Mean   : 3.25   Mean   : 49.7   Mean   :0.205   Mean   :0.262  
 3rd Qu.: 42.00   3rd Qu.:  1.000   3rd Qu.: 1.000   3rd Qu.: 2.000   3rd Qu.: 2.000   3rd Qu.: 5.00   3rd Qu.: 77.0   3rd Qu.:0.274   3rd Qu.:0.342  
 Max.   :223.00   Max.   :120.000   Max.   :35.000   Max.   :39.000   Max.   :17.000   Max.   :35.00   Max.   :163.0   Max.   :1.000   Max.   :1.000  
 NA's   :4377     NA's   :4378      NA's   :4387     NA's   :4377     NA's   :4378     NA's   :4377    NA's   :5189    NA's   :8905    NA's   :8821   
      X1B              SLG       
 Min.   :  0.00   Min.   :0.000  
 1st Qu.:  0.00   1st Qu.:0.167  
 Median :  6.00   Median :0.333  
 Mean   : 25.66   Mean   :0.304  
 3rd Qu.: 42.00   3rd Qu.:0.423  
 Max.   :225.00   Max.   :4.000  
 NA's   :4377     NA's   :8905   
> combo <- merge(batting,sal,by=c('playerID','yearID'))
> summary(combo)
      playerID         yearID         stint          teamID.x     lgID.x           G            G_batting            AB              R         
 moyerja01:   27   Min.   :1985   Min.   :1.000   LAN    :  940   AA:    0   Min.   :  1.00   Min.   :  0.00   Min.   :  0.0   Min.   :  0.00  
 thomeji01:   25   1st Qu.:1993   1st Qu.:1.000   PHI    :  937   AL:12292   1st Qu.: 26.00   1st Qu.:  8.00   1st Qu.:  5.0   1st Qu.:  0.00  
 weathda01:   25   Median :1999   Median :1.000   BOS    :  935   FL:    0   Median : 50.00   Median : 42.00   Median : 85.0   Median :  9.00  
 vizquom01:   24   Mean   :1999   Mean   :1.098   NYA    :  928   NL:13105   Mean   : 64.06   Mean   : 57.58   Mean   :182.4   Mean   : 24.71  
 gaettga01:   23   3rd Qu.:2006   3rd Qu.:1.000   CLE    :  920   PL:    0   3rd Qu.:101.00   3rd Qu.:101.00   3rd Qu.:336.0   3rd Qu.: 43.00  
 griffke02:   23   Max.   :2013   Max.   :4.000   SDN    :  914   UA:    0   Max.   :163.00   Max.   :163.00   Max.   :716.0   Max.   :152.00  
 (Other)  :25250                                  (Other):19823                               NA's   :906      NA's   :2661    NA's   :2661    
       H               X2B              X3B               HR              RBI               SB                CS              BB        
 Min.   :  0.00   Min.   : 0.000   Min.   : 0.000   Min.   : 0.000   Min.   :  0.00   Min.   :  0.000   Min.   : 0.00   Min.   :  0.00  
 1st Qu.:  1.00   1st Qu.: 0.000   1st Qu.: 0.000   1st Qu.: 0.000   1st Qu.:  0.00   1st Qu.:  0.000   1st Qu.: 0.00   1st Qu.:  0.00  
 Median : 19.00   Median : 3.000   Median : 0.000   Median : 1.000   Median :  8.00   Median :  0.000   Median : 0.00   Median :  6.00  
 Mean   : 48.18   Mean   : 9.276   Mean   : 1.033   Mean   : 5.369   Mean   : 23.56   Mean   :  3.568   Mean   : 1.54   Mean   : 17.98  
 3rd Qu.: 87.25   3rd Qu.:16.000   3rd Qu.: 1.000   3rd Qu.: 7.000   3rd Qu.: 39.00   3rd Qu.:  3.000   3rd Qu.: 2.00   3rd Qu.: 29.00  
 Max.   :262.00   Max.   :59.000   Max.   :23.000   Max.   :73.000   Max.   :165.00   Max.   :110.000   Max.   :29.00   Max.   :232.00  
 NA's   :2661     NA's   :2661     NA's   :2661     NA's   :2661     NA's   :2661     NA's   :2661      NA's   :2661    NA's   :2661    
       SO              IBB               HBP               SH               SF              GIDP            G_old              BA             OBP       
 Min.   :  0.00   Min.   :  0.000   Min.   : 0.000   Min.   : 0.000   Min.   : 0.000   Min.   : 0.000   Min.   :  0.00   Min.   :0.000   Min.   :0.000  
 1st Qu.:  2.00   1st Qu.:  0.000   1st Qu.: 0.000   1st Qu.: 0.000   1st Qu.: 0.000   1st Qu.: 0.000   1st Qu.: 20.00   1st Qu.:0.160   1st Qu.:0.208  
 Median : 20.00   Median :  0.000   Median : 0.000   Median : 0.000   Median : 0.000   Median : 2.000   Median : 47.00   Median :0.242   Median :0.305  
 Mean   : 33.52   Mean   :  1.533   Mean   : 1.614   Mean   : 1.786   Mean   : 1.554   Mean   : 4.127   Mean   : 61.43   Mean   :0.212   Mean   :0.270  
 3rd Qu.: 55.00   3rd Qu.:  2.000   3rd Qu.: 2.000   3rd Qu.: 2.000   3rd Qu.: 2.000   3rd Qu.: 7.000   3rd Qu.:101.00   3rd Qu.:0.276   3rd Qu.:0.346  
 Max.   :223.00   Max.   :120.000   Max.   :35.000   Max.   :39.000   Max.   :17.000   Max.   :35.000   Max.   :163.00   Max.   :1.000   Max.   :1.000  
 NA's   :2661     NA's   :2662      NA's   :2670     NA's   :2661     NA's   :2662     NA's   :2661     NA's   :3414     NA's   :5618    NA's   :5562   
      X1B             SLG           teamID.y     lgID.y         salary        
 Min.   :  0.0   Min.   :0.000   CLE    :  935   AL:12304   Min.   :       0  
 1st Qu.:  0.0   1st Qu.:0.200   PIT    :  932   NL:13093   1st Qu.:  255000  
 Median : 13.0   Median :0.351   PHI    :  931              Median :  550000  
 Mean   : 32.5   Mean   :0.317   SDN    :  923              Mean   : 1879256  
 3rd Qu.: 59.0   3rd Qu.:0.432   LAN    :  921              3rd Qu.: 2150000  
 Max.   :225.0   Max.   :4.000   CIN    :  912              Max.   :33000000  
 NA's   :2661    NA's   :5618    (Other):19843                                
> #create dataframe of the lostplayers
> lost_players <- subset(combo,playerID %in% c('giambja01','damonjo01','saenzol01') )
> lost_players
       playerID yearID stint teamID.x lgID.x   G G_batting  AB   R   H X2B X3B HR RBI SB CS  BB  SO IBB HBP SH SF GIDP G_old        BA       OBP X1B
5135  damonjo01   1995     1      KCA     AL  47        47 188  32  53  11   5  3  23  7  0  12  22   0   1  2  3    2    47 0.2819149 0.3235294  34
5136  damonjo01   1996     1      KCA     AL 145       145 517  61 140  22   5  6  50 25  5  31  64   3   3 10  5    4   145 0.2707930 0.3129496 107
5137  damonjo01   1997     1      KCA     AL 146       146 472  70 130  12   8  8  48 16 10  42  70   2   3  6  1    3   146 0.2754237 0.3378378 102
5138  damonjo01   1998     1      KCA     AL 161       161 642 104 178  30  10 18  66 26 12  58  84   4   4  3  3    4   161 0.2772586 0.3394625 120
5139  damonjo01   1999     1      KCA     AL 145       145 583 101 179  39   9 14  77 36  6  67  50   5   3  3  4   13   145 0.3070326 0.3789954 117
5140  damonjo01   2000     1      KCA     AL 159       159 655 136 214  42  10 16  88 46  9  65  60   4   1  8 12    7   159 0.3267176 0.3819918 146
5141  damonjo01   2001     1      OAK     AL 155       155 644 108 165  34   4  9  49 27 12  61  70   1   5  5  4    7   155 0.2562112 0.3235294 118
5142  damonjo01   2002     1      BOS     AL 154       154 623 118 178  34  11 14  63 31  6  65  70   5   6  3  5    4   154 0.2857143 0.3562232 119
5143  damonjo01   2003     1      BOS     AL 145       145 608 103 166  32   6 12  67 30  6  68  74   4   2  6  6    5   145 0.2730263 0.3450292 116
5144  damonjo01   2004     1      BOS     AL 150       150 621 123 189  35   6 20  94 19  8  76  71   1   2  0  3    8   150 0.3043478 0.3803419 128
5145  damonjo01   2005     1      BOS     AL 148       148 624 117 197  35   6 10  75 18  1  53  69   3   2  0  9    5   148 0.3157051 0.3662791 146
5146  damonjo01   2006     1      NYA     AL 149       149 593 115 169  35   5 24  80 25 10  67  85   1   4  2  5    4   149 0.2849916 0.3587444 105
5147  damonjo01   2007     1      NYA     AL 141       141 533  93 144  27   2 12  63 27  3  66  79   1   2  1  3    4   141 0.2701689 0.3509934 103
5148  damonjo01   2008     1      NYA     AL 143       143 555  95 168  27   5 17  71 29  8  64  82   0   1  2  1    5   143 0.3027027 0.3752013 119
5149  damonjo01   2009     1      NYA     AL 143       143 550 107 155  36   3 24  82 12  0  71  98   1   2  2  1    9    NA 0.2818182 0.3653846  92
5150  damonjo01   2010     1      DET     AL 145       145 539  81 146  36   5  8  51 11  1  69  90   2   2  2  1    5    NA 0.2708720 0.3551555  97
5151  damonjo01   2011     1      TBA     AL 150       150 582  79 152  29   7 16  73 19  6  51  92   1   7  2  5    4   150 0.2611684 0.3255814 100
7872  giambja01   1995     1      OAK     AL  54        54 176  27  45   7   0  6  25  2  1  28  31   0   3  1  2    4    54 0.2556818 0.3636364  32
7873  giambja01   1996     1      OAK     AL 140       140 536  84 156  40   1 20  79  0  1  51  95   3   5  1  5   15   140 0.2910448 0.3551089  95
7874  giambja01   1997     1      OAK     AL 142       142 519  66 152  41   2 20  81  0  1  55  89   3   6  0  8   11   142 0.2928709 0.3622449  89
7875  giambja01   1998     1      OAK     AL 153       153 562  92 166  28   0 27 110  2  2  81 102   7   5  0  9   16   153 0.2953737 0.3835616 111
7876  giambja01   1999     1      OAK     AL 158       158 575 115 181  36   1 33 123  1  1 105 106   6   7  0  8   11   158 0.3147826 0.4215827 111
7877  giambja01   2000     1      OAK     AL 152       152 510 108 170  29   1 43 137  2  0 137  96   6   9  0  8    9   152 0.3333333 0.4759036  97
7878  giambja01   2001     1      OAK     AL 154       154 520 109 178  47   2 38 120  2  0 129  83  24  13  0  9   17   154 0.3423077 0.4769001  91
7879  giambja01   2002     1      NYA     AL 155       155 560 120 176  34   1 41 122  2  2 109 112   4  15  0  5   18   155 0.3142857 0.4354136 100
7880  giambja01   2003     1      NYA     AL 156       156 535  97 134  25   0 41 107  2  1 129 140   9  21  0  5    9   156 0.2504673 0.4115942  68
7881  giambja01   2004     1      NYA     AL  80        80 264  33  55   9   0 12  40  0  1  47  62   1   8  0  3    5    80 0.2083333 0.3416149  34
7882  giambja01   2005     1      NYA     AL 139       139 417  74 113  14   0 32  87  0  0 108 109   5  19  0  1    7   139 0.2709832 0.4403670  67
7883  giambja01   2006     1      NYA     AL 139       139 446  92 113  25   0 37 113  2  0 110 106  12  16  0  7   10   139 0.2533632 0.4127807  51
7884  giambja01   2007     1      NYA     AL  83        83 254  31  60   8   0 14  39  1  0  40  66   2   8  0  1    1    83 0.2362205 0.3564356  38
7885  giambja01   2008     1      NYA     AL 145       145 458  68 113  19   1 32  96  2  1  76 111   5  22  0  9    6   145 0.2467249 0.3734513  61
7886  giambja01   2009     1      OAK     AL  83        83 269  39  52  13   0 11  40  0  0  50  72   1   7  0  2    6    NA 0.1933086 0.3323171  28
            SLG teamID.y lgID.y   salary
5135  0.4414894      KCA     AL   109000
5136  0.3675048      KCA     AL   180000
5137  0.3855932      KCA     AL   240000
5138  0.4392523      KCA     AL   460000
5139  0.4768439      KCA     AL  2100000
5140  0.4946565      KCA     AL  4000000
5141  0.3633540      OAK     AL  7100000
5142  0.4430177      BOS     AL  7250000
5143  0.4046053      BOS     AL  7500000
5144  0.4766506      BOS     AL  8000000
5145  0.4391026      BOS     AL  8250000
5146  0.4822934      NYA     AL 13000000
5147  0.3958724      NYA     AL 13000000
5148  0.4612613      NYA     AL 13000000
5149  0.4890909      NYA     AL 13000000
5150  0.4007421      DET     AL  8000000
5151  0.4175258      TBA     AL  5250000
7872  0.3977273      OAK     AL   109000
7873  0.4813433      OAK     AL   120000
7874  0.4951830      OAK     AL   205000
7875  0.4893238      OAK     AL   315000
7876  0.5530435      OAK     AL  2103333
7877  0.6470588      OAK     AL  3103333
7878  0.6596154      OAK     AL  4103333
7879  0.5982143      NYA     AL 10428571
7880  0.5271028      NYA     AL 11428571
7881  0.3787879      NYA     AL 12428571
7882  0.5347722      NYA     AL 13428571
7883  0.5582960      NYA     AL 20428571
7884  0.4330709      NYA     AL 23428571
7885  0.5021834      NYA     AL 23428571
7886  0.3643123      OAK     AL  4000000
 [ reached getOption("max.print") -- omitted 12 rows ]
> lost_players <- subset(lost_players,yearID == 2001)
> lost_players <- lost_players[,c('playerID','H','X2B','X3B','HR','OBP','SLG','BA','AB')]
> head(lost_players)
       playerID   H X2B X3B HR       OBP       SLG        BA  AB
5141  damonjo01 165  34   4  9 0.3235294 0.3633540 0.2562112 644
7878  giambja01 178  47   2 38 0.4769001 0.6596154 0.3423077 520
20114 saenzol01  67  21   1  9 0.2911765 0.3836066 0.2196721 305
> #Replacement players criteria:
> #The total combined salary of the three players can not exceed 15 million dollars.
> #Their combined number of At Bats (AB) needs to be equal to or greater than the lost players.
> #Their mean OBP had to equal to or greater than the mean OBP of the lost players
> library(dplyr)
> avail.players <- filter(combo,yearID==2001)

> library(ggplot2)
> ggplot(avail.players,aes(x=OBP,y=salary)) + geom_point()
Warning message:
Removed 168 rows containing missing values (geom_point). 

> avail.players <- filter(avail.players,salary<8000000,OBP>0)
> avail.players <- filter(avail.players,AB >= 500)
> possible <- head(arrange(avail.players,desc(OBP)),10)
> possible <- possible[,c('playerID','OBP','AB','salary')]
> possible
    playerID       OBP  AB  salary
1  giambja01 0.4769001 520 4103333
2  heltoto01 0.4316547 587 4950000
3  berkmla01 0.4302326 577  305000
4  gonzalu01 0.4285714 609 4833333
5  thomeji01 0.4161491 526 7875000
6  alomaro01 0.4146707 575 7750000
7  edmonji01 0.4102142 500 6333333
8  gilesbr02 0.4035608 576 7333333
9  pujolal01 0.4029630 590  200000
10 olerujo01 0.4011799 572 6700000
> possible[2:4,]
   playerID       OBP  AB  salary
2 heltoto01 0.4316547 587 4950000
3 berkmla01 0.4302326 577  305000
4 gonzalu01 0.4285714 609 4833333
