select c.idCoffee, c.gradingDate, n.value, s.value
from coffee as c join coffee2numeric2value as n on c.idCoffee = n.Coffee_idCoffee join numerictypes as nt on n.NumericTypes_NumericTypeID = nt.NumericTypeID join coffe2string2value as s on c.idCoffee = s.Coffee_idCoffee join stringtypes as st on s.StringTypes_StringTypeID = st.StringTypeID
where nt.TypeName = "Total.Cup.Points" and st.TypeName = "Owner";


#Best 20 coffee models that have at least 8 points for "Aroma".
select c.idCoffee as id, s1.value as "Species", s2.value as "Owner", n1.value as "Aroma", n2.value as "Sweetness"
from coffee as c join coffee2numeric2value as n1 on c.idCoffee = n1.Coffee_idCoffee join numerictypes as nt1 on n1.NumericTypes_NumericTypeID = nt1.NumericTypeID join coffe2string2value as s1 on c.idCoffee = s1.Coffee_idCoffee join stringtypes as st1 on s1.StringTypes_StringTypeID = st1.StringTypeID join coffee2numeric2value as n2 on c.idCoffee = n2.Coffee_idCoffee join numerictypes as nt2 on n2.NumericTypes_NumericTypeID = nt2.NumericTypeID join coffe2string2value as s2 on c.idCoffee = s2.Coffee_idCoffee join stringtypes as st2 on s2.StringTypes_StringTypeID = st2.StringTypeID
where nt1.TypeName = "Aroma" and n1.value >= 8 and nt2.TypeName = "Sweetness" and n2.value = 10 and st1.TypeName = "Species" and st2.TypeName = "Owner"
limit 20;


#Best 10 coffee models that have at least 1 "Quaker".
select c.idCoffee as id, s.value as "Owner", n.value as "Quakers number"
from coffee as c join coffee2numeric2value as n on c.idCoffee = n.Coffee_idCoffee join numerictypes as nt on n.NumericTypes_NumericTypeID = nt.NumericTypeID join coffe2string2value as s on c.idCoffee = s.Coffee_idCoffee join stringtypes as st on s.StringTypes_StringTypeID = st.StringTypeID
where nt.TypeName = "Quakers" and n.value >= 1 and st.TypeName = "Owner"
limit 10;






#Worst 20 coffee that have at least 8.20 points for "Sweetness".
select c.idCoffee as id, s.value as "Owner", n.value as "Sweetness"
from coffee as c join coffee2numeric2value as n on c.idCoffee = n.Coffee_idCoffee join numerictypes as nt on n.NumericTypes_NumericTypeID = nt.NumericTypeID join coffe2string2value as s on c.idCoffee = s.Coffee_idCoffee join stringtypes as st on s.StringTypes_StringTypeID = st.StringTypeID
where nt.TypeName = "Sweetness" and n.value >= 8.20 and st.TypeName = "Owner"
order by c.idCoffee DESC
limit 20;




select s1.value as "Owner", count(s1.value)
from coffee as c join coffe2string2value as s1 on c.idCoffee = s1.Coffee_idCoffee join stringtypes as st1 on s1.StringTypes_StringTypeID = st1.StringTypeID 
where st1.TypeName = "Owner"
group by s1.value
order by count(s1.value) desc;


create view RobustaCoffee as 
select c.idCoffee as Id, s1.value as "Species"
from coffee as c join coffe2string2value as s1 on c.idCoffee = s1.Coffee_idCoffee join stringtypes as st1 on s1.StringTypes_StringTypeID = st1.StringTypeID 
where st1.TypeName = "Species" and s1.value = "Robusta";

select * from robustacoffee;

create view aromaaboveavg as
select c.idCoffee as Id, n1.value as "Aroma"
from coffee as c join coffee2numeric2value as n1 on c.idCoffee = n1.Coffee_idCoffee join numerictypes as nt1 on n1.NumericTypes_NumericTypeID = nt1.NumericTypeID
where nt1.TypeName = "Aroma" and n1.value > (select avg(n1.value) 
											 from coffee as c join coffee2numeric2value as n1 on c.idCoffee = n1.Coffee_idCoffee join numerictypes as nt1 on n1.NumericTypes_NumericTypeID = nt1.NumericTypeID
											 where nt1.TypeName = "Aroma");

select * from aromaaboveavg;


create view arabicamexicoaromaaboveavg as
select c.idCoffee as Id, s1.value as "Specie", s2.value as "Country Of Origin", n1.value as "Aroma"
from coffee as c join coffee2numeric2value as n1 on c.idCoffee = n1.Coffee_idCoffee join numerictypes as nt1 on n1.NumericTypes_NumericTypeID = nt1.NumericTypeID join coffe2string2value as s1 on c.idCoffee = s1.Coffee_idCoffee join stringtypes as st1 on s1.StringTypes_StringTypeID = st1.StringTypeID join coffe2string2value as s2 on c.idCoffee = s2.Coffee_idCoffee join stringtypes as st2 on s2.StringTypes_StringTypeID = st2.StringTypeID
where st1.TypeName = "Species" and st2.TypeName = "Country.of.Origin" and s1.value = "Arabica" and s2.value = "Mexico" and nt1.TypeName = "Aroma" and n1.value > (select avg(n1.value) 
																from coffee as c join coffee2numeric2value as n1 on c.idCoffee = n1.Coffee_idCoffee join numerictypes as nt1 on n1.NumericTypes_NumericTypeID = nt1.NumericTypeID
																where nt1.TypeName = "Aroma");

select * from arabicamexicoaromaaboveavg;

select c.id, c.Aroma , n1.value as "Acidity"
from arabicamexicoaromaaboveavg as c join coffee2numeric2value as n1 on c.id = n1.Coffee_idCoffee join numerictypes as nt1 on n1.NumericTypes_NumericTypeID = nt1.NumericTypeID
where nt1.TypeName = "Acidity";

call getAvg("altitude_high_meters");







