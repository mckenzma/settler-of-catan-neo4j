// Creating Settlers of Catan board layout
LOAD CSV WITH HEADERS FROM 'file:///Settlers-of-Catan-Neo4j.csv' AS row
// create (:TerrainHex) and (:Vertex)
MERGE (terrainHex:TerrainHex {id: toInteger(row.TerrainHex), name: "", resource: ""})
MERGE (top:Vertex {id: toInteger(row.Top)})
MERGE (topLeft:Vertex {id: toInteger(row.TopLeft)})
MERGE (topRight:Vertex {id: toInteger(row.TopRight)})
MERGE (bottomLeft:Vertex {id: toInteger(row.BottomLeft)})
MERGE (bottomRight:Vertex {id: toInteger(row.BottomRight)})
MERGE (bottom:Vertex {id: toInteger(row.Bottom)})
// create (:Vertex)-[:VERTEX_OF]->(:TerrainHex)
MERGE (top)-[:VERTEX_OF]->(terrainHex)
MERGE (topLeft)-[:VERTEX_OF]->(terrainHex)
MERGE (topRight)-[:VERTEX_OF]->(terrainHex)
MERGE (bottomLeft)-[:VERTEX_OF]->(terrainHex)
MERGE (bottomRight)-[:VERTEX_OF]->(terrainHex)
MERGE (bottom)-[:VERTEX_OF]->(terrainHex)
// create (:Vertex)-[:CONNECTS_TO]->(:Vertex)
MERGE (top)-[:CONNECTS_TO]->(topLeft)
MERGE (top)-[:CONNECTS_TO]->(topRight)
MERGE (topLeft)-[:CONNECTS_TO]->(bottomLeft)
MERGE (topRight)-[:CONNECTS_TO]->(bottomRight)
MERGE (bottomLeft)-[:CONNECTS_TO]->(bottom)
MERGE (bottomRight)-[:CONNECTS_TO]->(bottom)

// create (:ResourceCard)
// Brick
FOREACH (value IN range(1,19,1) |
 MERGE (:ResourceCard {id: value, name: "Brick"}))
// Ore
FOREACH (value IN range(1,19,1) |
 MERGE (:ResourceCard {id: value, name: "Ore"}))
// Wool
FOREACH (value IN range(1,19,1) |
 MERGE (:ResourceCard {id: value, name: "Wool"}))
// Grain
FOREACH (value IN range(1,19,1) |
 MERGE (:ResourceCard {id: value, name: "Grain"}))
// Lumber
FOREACH (value IN range(1,19,1) |
 MERGE (:ResourceCard {id: value, name: "Lumber"}))

// create (:DevelopmentCard)
// Knight
FOREACH (value IN range(1,14,1) |
 MERGE (:DevelopmentCard {id: value, name: "Knight"}))
// Progress: Monopoly
MERGE (:DevelopmentCard {id: 1, name: "Monopoly"})
MERGE (:DevelopmentCard {id: 2, name: "Monopoly"})
// Progress: Road Building
MERGE (:DevelopmentCard {id: 1, name: "Road Building"})
MERGE (:DevelopmentCard {id: 2, name: "Road Building"})
// Progress: Year of Plenty
MERGE (:DevelopmentCard {id: 1, name: "Year of Plenty"})
MERGe (:DevelopmentCard {id: 2, name: "Year of Plenty"})
// Victory Points
MERGE (:DevelopmentCard {id: 1, name: "Chapel"})
MERGE (:DevelopmentCard {id: 2, name: "Library"})
MERGE (:DevelopmentCard {id: 3, name: "Market"})
MERGE (:DevelopmentCard {id: 4, name: "Palace"})
MERGE (:DevelopmentCard {id: 5, name: "University"})

////////////////////////////////////////////
////////////////////////////////////////////
// everything below in the work
////////////////////////////////////////////
////////////////////////////////////////////

// Add context to (:TerrainHex)
WITH [["Fields", "Grain"], 
      ["Fields", "Grain"], 
      ["Fields", "Grain"], 
      ["Fields", "Grain"], 
      ["Forest", "Wood"], 
      ["Forest", "Wood"], 
      ["Forest", "Wood"], 
      ["Forest", "Wood"], 
      ["Pasture", "Wool"],
      ["Pasture", "Wool"], 
      ["Pasture", "Wool"], 
      ["Pasture", "Wool"], 
      ["Mountains", "Ore"], 
      ["Mountains", "Ore"], 
      ["Mountains", "Ore"], 
      ["Hills", "Brick"], 
      ["Hills", "Brick"], 
      ["Hills", "Brick"], 
      ["Desert", "None"]] AS resources
WITH apoc.coll.shuffle(resources) AS resources
UNWIND range(1,19) AS value
MATCH (th:TerrainHex {id: value})
WITH th, resources[value -1] AS hexName
SET th.name = hexName[0], 
	th.resource = hexName[1]

// Clear (:TerrainHex) properties
MATCH (th:TerrainHex)
SET th.name = "",
	th.resource = ""

The nineteen (19) terrain hexes are distributed as follows:
Four (4) Fields (Grain Resource) Hexes.
Four (4) Forest (Lumber Resource) Hexes.
Four (4) Pasture (Wool Resource) Hexes.
Three (3) Mountains (Ore Resource) Hexes.
Three (3) Hills (Brick Resource) Hexes.
One (1) Desert (No Resource) Hex.



//Create the pieces
UNWIND ["red", "white", "orange", "blue"] AS color
RETURN color




One x "2" (B:*).
Two x "3" (D, Q:**).
Two x "4" (J, N:***).
Two x "5" (A, O:****).
Two x "6" (C, P:*****).
Two x "8" (E, K:*****).
Two x "9" (G, M:****).
Two x "10" (F, L:***).
Two x "11" (I, R:**).
One x "12" (H:*).




