select c.idCoffee, c.gradingDate, n.value, s.value
from coffee as c join coffee2numeric2value as n on c.idCoffee = n.Coffee_idCoffee join numerictypes as nt on n.NumericTypes_NumericTypeID = nt.NumericTypeID join coffe2string2value as s on c.idCoffee = s.Coffee_idCoffee join stringtypes as st on s.StringTypes_StringTypeID = st.StringTypeID
where nt.TypeName = "Total.Cup.Points" and st.TypeName = "Owner";


#Best 20 coffee models that have at least 8 points for "Aroma".
select c.idCoffee as id, s.value as "Owner", n.value as "Aroma"
from coffee as c join coffee2numeric2value as n on c.idCoffee = n.Coffee_idCoffee join numerictypes as nt on n.NumericTypes_NumericTypeID = nt.NumericTypeID join coffe2string2value as s on c.idCoffee = s.Coffee_idCoffee join stringtypes as st on s.StringTypes_StringTypeID = st.StringTypeID
where nt.TypeName = "Aroma" and n.value >= 8 and st.TypeName = "Owner"
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


#Best 15 coffee models that are "Arabica" and have at least 9 points for "Clean Cup".




