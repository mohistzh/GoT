CREATE(HouseStark:family:Stark {name:"House Stark",
Sigil: "A grey direwolf''s head facing sinister on a white field over green",
Words: "Winter is coming",
Titles: "Kings in the North",
Seat: "Winterfell",
Region: "The North",
Age: "Over 8000 years"
}) RETURN HouseStark

CREATE(RickardStark:Male:Stark {
    name: "Rickard Stark",
    Chinese: "瑞卡德史塔克"
}) RETURN RickardStark

MATCH (a:family), (b:Stark)
    WHERE a.name = "House Stark" AND b.name = "Rickard Stark"
CREATE (b) - [r: CITIZENS_OF] -> (a) RETURN a, b

-- MATCH(HouseStark:family {name: "House Stark"})
-- SET HouseStark: Stark
-- RETURN HouseStark

CREATE(LyarraStark: Female: Stark {name: "Lyarra Stark", Chinese: "莱亚拉史塔克"}) RETURN LyarraStark


MATCH(a:Stark), (b:Stark) WHERE a.name = "House Stark" AND b.name = "Lyarra Stark"
CREATE (b) - [r: CITIZENS_OF] -> (a) RETURN a, b


MATCH (a:Stark), (b:Stark)
    WHERE a.name = "Rickard Stark" AND b.name = "Lyarra Stark"
CREATE (a) - [r: SPOUSE_OF {type:"marriage"}] -> (b)
RETURN a, b


CREATE(BrandonStark:Stark:Male{name:"Brandon Stark", Chinese: "布兰德史塔克"}), (LyannaStark: Stark:Female{name:"Lyanna Stark", Chinese:"赖亚娜史塔克"}),
(BenjenStark: Stark: Male{name:"Benjen Stark", Chinese:"班扬史塔克"}),(EddardStark:Stark:Male{name:"Eddard Stark", Chinese:"艾德史塔克", NickName:"Ned"})

MATCH (a:Stark), (b:Stark)
    WHERE a.name = "Lyarra Stark" AND b.name = "Brandon Stark"
CREATE (a) - [r: PARENTS_OF {type:"natural"}] -> (b)
RETURN a, b

MATCH (a:Stark), (b:Stark)
    WHERE a.name = "Lyarra Stark" AND b.name = "Lyanna Stark"
CREATE (a) - [r: PARENTS_OF {type:"natural"}] -> (b)
RETURN a, b

MATCH (a:Stark), (b:Stark)
    WHERE a.name = "Lyarra Stark" AND b.name = "Benjen Stark"
CREATE (a) - [r: PARENTS_OF {type:"natural"}] -> (b)
RETURN a, b

MATCH (a:Stark), (b:Stark)
    WHERE a.name = "Lyarra Stark" AND b.name = "Eddard Stark"
CREATE (a) - [r: PARENTS_OF {type:"natural"}] -> (b)
RETURN a, b

MATCH(a:Stark), (b:Stark) WHERE a.name = "House Stark" AND b.name = "Eddard Stark"
CREATE (b) - [r: CITIZENS_OF] -> (a) RETURN a, b


MATCH (a:Stark), (b:Stark) WHERE a.name = "Catelyn Tully" AND b.name = "Eddard Stark"
CREATE (a) - [r: SPOUSE_OF {type: "marriage"}] -> (b)
RETURN a, b

CREATE p = (CatelynTully:Female:Stark {name:"Catelyn Tully", Chinese: "凯特琳徒利"}) - [:CITIZENS_OF] -> (HouseStark)
RETURN p


MATCH (a), (b) WHERE a.name = "Lyanna Stark" AND b.name = "Benjen Stark"
CREATE (a) - [r:SIBLINGS {type: "brother and sister"}] -> (b) RETURN a, b

MATCH (a), (b) WHERE a.name = "Eddard Stark" AND b.name = "Benjen Stark"
CREATE (a) - [r:SIBLINGS {type: "brothers"}] -> (b) RETURN a, b

Robb Stark
Talisa Maegyr


CREATE (RobbStark:Stark:Male {name: "Robb Stark", Chinese: "罗伯史塔克"}, FamilyIdentifier: "The first son of the Ned family")
- [:SPOUSE_OF {type: "marriage"}] -> (TalisaMaegyr:Female:Stark{name: "Talisa Maegyr", Chinese: "泰丽莎梅葛亚"})


Arya Stark, Brandon Stark, Rickon Stark, Sansa Stark


CREATE (AryaStark:Stark:Female {name: "Arya Stark"}) - [:SIBLINGS{type:"brother and sister"}] -> (BrandonStark:Stark:Male{name: "Brandon Stark"}),
(RickonStark:Stark:Male{name: "Rickon Stark"}) - [:SIBLINGS{type: "brother and sister"}] -> (SansaStark:Stark:Female{name:"Sansa Stark"})
RETURN AryaStark, BrandonStark, RickonStark, SansaStark

MATCH (a), (b) WHERE a.name = "Robb Stark" AND b.name = "Arya Stark" CREATE (a) - [r:SIBLINGS {type: "brother and sister"}] -> (b)
return a, b


MATCH (a), (b) WHERE a.name = "Brandon Stark" AND b.name = "Rickon Stark" CREATE (a) - [r:SIBLINGS {type: "brothers"}] -> (b)
return a, b


MATCH (a), (b) WHERE a.name = "Robb Stark" AND b.name = "Arya Stark" CREATE (a) - [r:SIBLINGS {type: "brother and sister"}] -> (b)
return a, b