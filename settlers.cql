// Creating Settlers of Catan board layout

// create vertices
FOREACH (value IN range(1,54,1) |
 CREATE (:Vertex {id: value}))

//create terrain hexes
FOREACH (value IN range(1,19,1) |
 CREATE (:TerrainHex {id: value}))

 //connect vertices to each terrain hex
CREATE (v1:Vertex)