######### 1 ################
grunt> a = load '/user/root/pig/full_text_clean.txt';
grunt> b= sample a 0.1;
grunt> c = store b into '/user/root/pig/full_text_small.txt ';
########### 2 ##############
grunt> a = load '/user/root/pig/full_text_clean.txt' AS
(id:chararray,lat:float, lon:float,
tweet:chararray,modified_lat:float,modified_lon:float);
grunt> b = foreach a generate flatten(TOKENIZE(tweet)) as token;
grunt> c= group b by token;
grunt> d= foreach c generate flatten(group),COUNT(b) as cnt;
grunt> e= order d by cnt desc;
grunt> f= limit e 4;
grunt> dump f;
(I,109447)
(RT,78153)
(the,75595)
######### 3 $##########
grunt> a = load '/user/root/pig/full_text_clean.txt' AS
(id:chararray,lat:float, lon:float,
tweet:chararray,modified_lat:float,modified_lon:float);
grunt> b= GROUP a All;
c= foreach b generate COUNT_STAR(a);
(377616)
###### 4 ##########
a = load '/user/root/pig/full_text_clean.txt' AS
(id:chararray,lat:float, lon:float,
tweet:chararray,modified_lat:float,modified_lon:float);
b = load '/user/root/pig/cities_clean.txt' AS
(city_name:chararray,lat:float,
lon:float,modified_lat:float,modified_lon:float);
c= join a by (modified_lat,modified_lon),b
by(modified_lat,modified_lon);
d= foreach c generate a::tweet as tweet,b::city_name as
city,SQRT((a::lat - b::lat) * (a::lat - b::lat) + (a::lon - b::lon) *
(a::lon - b::lon)) as distance;
e= group d by (tweet,city_name);
f= foreach e {
>> sortd = order d by distance asc;
>> l = limit sortd 1;
>> generate FLATTEN(group) AS (tweet,cityy),l as dd;
>> };
g= limit f 3;
dump g;
