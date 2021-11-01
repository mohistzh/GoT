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