// =======================================================
//  WE WERE LIARS — Script Neo4j (Amazon Prime adaptation)
//  Version corrigée : familles Sinclair, maisons et animaux
// =======================================================


// ---------- CLEAN DATABASE ----------
MATCH (n)
DETACH DELETE n;


// ---------- CREATE HOUSES ----------
CREATE (:House {name:"Clairmont", type:"Maison principale", location:"Beechwood Island"});
CREATE (:House {name:"Windemere", type:"Maison de Penny Sinclair"});
CREATE (:House {name:"Red Gate", type:"Maison de Carrie Sinclair"});
CREATE (:House {name:"Cuddledown", type:"Maison de Bess Sinclair"});
CREATE (:House {name:"Sinclair", type:"Famille"});


// ---------- CREATE FAMILY MEMBERS ----------
CREATE (:Person {name:"Harris Sinclair", role:"patriarche", alive:true});
CREATE (:Person {name:"Tipper Taft Sinclair", role:"matriarche", alive:true});

CREATE (:Person {name:"Penny Sinclair", role:"fille aînée de Harris", alive:true});
CREATE (:Person {name:"Carrie Sinclair", role:"fille de Harris", alive:true});
CREATE (:Person {name:"Bess Sinclair", role:"fille cadette de Harris", alive:true});

CREATE (:Person {name:"Cadence 'Cady' Sinclair Eastman", role:"petite-fille de Harris", age:17, alive:true});
CREATE (:Person {name:"Johnny Sinclair Dennis", role:"petit-fils de Harris", age:17, alive:true});
CREATE (:Person {name:"Will Sinclair Dennis", role:"frère de Johnny", age:12, alive:true});
CREATE (:Person {name:"Liberty Sinclair Dennis", role:"soeur de Johnny", age:14, alive:true});
CREATE (:Person {name:"Bonnie Sinclair Dennis", role:"soeur de Johnny", age:10, alive:true});

CREATE (:Person {name:"Mirren Sinclair Sheffield", role:"petite-fille de Harris", age:17, alive:true});
CREATE (:Person {name:"Taft Sinclair Sheffield", role:"frère de Mirren", age:12, alive:true});
CREATE (:Person {name:"Libby Sinclair Sheffield", role:"soeur de Mirren", age:8, alive:true});

CREATE (:Person {name:"Gat Patil", role:"ami proche de la famille", origin:"indien", age:17, alive:true});

CREATE (:Person {name:"Ed Patil", role:"compagnon de Carrie Sinclair", origin:"indien", alive:true});
CREATE (:Person {name:"Brody Sheffield", role:"époux de Bess Sinclair", alive:true});
CREATE (:Person {name:"Cadence's Father", role:"père de Cady", alive:true});


// ---------- CREATE ANIMALS ----------
CREATE (:Animal {name:"Bosh", type:"Golden Retriever", house:"Clairmont"});
CREATE (:Animal {name:"Prince Philip", type:"Golden Retriever", house:"Clairmont"});


// ---------- RELATIONS DE FAMILLE ----------

// Mariage Harris & Tipper
MATCH (h:Person {name:"Harris Sinclair"}), (t:Person {name:"Tipper Taft Sinclair"})
CREATE (h)-[:MARRIED_TO]->(t);

// Leurs enfants
MATCH (h:Person {name:"Harris Sinclair"}), (t:Person {name:"Tipper Taft Sinclair"})
MATCH (p1:Person {name:"Penny Sinclair"}), (p2:Person {name:"Carrie Sinclair"}), (p3:Person {name:"Bess Sinclair"})
CREATE (p1)-[:CHILD_OF]->(h),
       (p2)-[:CHILD_OF]->(h),
       (p3)-[:CHILD_OF]->(h),
       (p1)-[:CHILD_OF]->(t),
       (p2)-[:CHILD_OF]->(t),
       (p3)-[:CHILD_OF]->(t);

// Enfants de Penny
MATCH (p:Person {name:"Penny Sinclair"}), (c:Person {name:"Cadence 'Cady' Sinclair Eastman"})
CREATE (c)-[:CHILD_OF]->(p);

// Enfants de Carrie
MATCH (p:Person {name:"Carrie Sinclair"})
MATCH (c1:Person {name:"Johnny Sinclair Dennis"}), (c2:Person {name:"Will Sinclair Dennis"}), (c3:Person {name:"Liberty Sinclair Dennis"}), (c4:Person {name:"Bonnie Sinclair Dennis"})
CREATE (c1)-[:CHILD_OF]->(p),
       (c2)-[:CHILD_OF]->(p),
       (c3)-[:CHILD_OF]->(p),
       (c4)-[:CHILD_OF]->(p);

// Enfants de Bess
MATCH (p:Person {name:"Bess Sinclair"})
MATCH (c1:Person {name:"Mirren Sinclair Sheffield"}), (c2:Person {name:"Taft Sinclair Sheffield"}), (c3:Person {name:"Libby Sinclair Sheffield"})
CREATE (c1)-[:CHILD_OF]->(p),
       (c2)-[:CHILD_OF]->(p),
       (c3)-[:CHILD_OF]->(p);


// ---------- RELATIONS DE COUPLE ----------
MATCH (c:Person {name:"Carrie Sinclair"}), (e:Person {name:"Ed Patil"})
CREATE (c)-[:PARTNER_WITH]->(e);

MATCH (b:Person {name:"Bess Sinclair"}), (br:Person {name:"Brody Sheffield"})
CREATE (b)-[:MARRIED_TO]->(br);


// ---------- RELATIONS AVEC LES MAISONS ----------
MATCH (clairmont:House {name:"Clairmont"})
MATCH (h:Person {name:"Harris Sinclair"}), (t:Person {name:"Tipper Taft Sinclair"})
MATCH (a1:Animal {name:"Bosh"}), (a2:Animal {name:"Prince Philip"})
CREATE (h)-[:LIVES_IN]->(clairmont),
       (t)-[:LIVES_IN]->(clairmont),
       (a1)-[:GUARDS]->(clairmont),
       (a2)-[:GUARDS]->(clairmont);

MATCH (windemere:House {name:"Windemere"})
MATCH (p1:Person {name:"Penny Sinclair"}), (p2:Person {name:"Cadence 'Cady' Sinclair Eastman"})
CREATE (p1)-[:LIVES_IN]->(windemere),
       (p2)-[:LIVES_IN]->(windemere);

MATCH (redgate:House {name:"Red Gate"})
MATCH (p1:Person {name:"Carrie Sinclair"}), (p2:Person {name:"Ed Patil"})
MATCH (c1:Person {name:"Johnny Sinclair Dennis"}), (c2:Person {name:"Will Sinclair Dennis"}), (c3:Person {name:"Liberty Sinclair Dennis"}), (c4:Person {name:"Bonnie Sinclair Dennis"})
CREATE (p1)-[:LIVES_IN]->(redgate),
       (p2)-[:LIVES_IN]->(redgate),
       (c1)-[:LIVES_IN]->(redgate),
       (c2)-[:LIVES_IN]->(redgate),
       (c3)-[:LIVES_IN]->(redgate),
       (c4)-[:LIVES_IN]->(redgate);

MATCH (cuddledown:House {name:"Cuddledown"})
MATCH (p1:Person {name:"Bess Sinclair"}), (p2:Person {name:"Brody Sheffield"})
MATCH (c1:Person {name:"Mirren Sinclair Sheffield"}), (c2:Person {name:"Taft Sinclair Sheffield"}), (c3:Person {name:"Libby Sinclair Sheffield"})
CREATE (p1)-[:LIVES_IN]->(cuddledown),
       (p2)-[:LIVES_IN]->(cuddledown),
       (c1)-[:LIVES_IN]->(cuddledown),
       (c2)-[:LIVES_IN]->(cuddledown),
       (c3)-[:LIVES_IN]->(cuddledown);


// ---------- GROUPE “LES MENTEURS” ----------
MATCH (a:Person {name:"Cadence 'Cady' Sinclair Eastman"}),
      (b:Person {name:"Johnny Sinclair Dennis"}),
      (c:Person {name:"Mirren Sinclair Sheffield"}),
      (d:Person {name:"Gat Patil"})
CREATE (a)-[:FRIEND_WITH]->(b),
       (a)-[:FRIEND_WITH]->(c),
       (a)-[:FRIEND_WITH]->(d),
       (b)-[:FRIEND_WITH]->(c),
       (b)-[:FRIEND_WITH]->(d),
       (c)-[:FRIEND_WITH]->(d);


// ---------- APPARTENANCE À LA FAMILLE SINCLAIR ----------
MATCH (fam:House {name:"Sinclair"})
MATCH (p:Person)
WHERE p.name CONTAINS "Sinclair"
CREATE (p)-[:OF_HOUSE]->(fam);


// ---------- FIN ----------
RETURN "✅ Graphe complet : familles, maisons, amis et chiens ajoutés" AS status;
