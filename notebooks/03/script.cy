// --- 1. Borrado de seguridad (Opcional) ---
// MATCH (n) DETACH DELETE n;

// --- 2. Creación de Nodos ---

// --- 2.1 Local ---
CREATE
// Salamanca    
(l1:Local {nombre:"Cafe Goya", tipo_actividad: "Cafetería", horario:"08-22", licencia: "En trámite"}),
(l2:Local {nombre:"Bar Velazquez", tipo_actividad: "Bar", horario:"09-23", licencia: "Concedida"}),
(l3:Local {nombre:"Restaurante Serrano", tipo_actividad: "Restaurante", horario:"13-00", licencia: "Pendiente de renovación"}),
(l4:Local {nombre:"Tienda Ortega", tipo_actividad: "Tienda", horario:"10-20", licencia: "Pendiente de renovación"}),
(l5:Local {nombre:"Pub Alcala", tipo_actividad: "Pub", horario:"18-03", licencia: "Pendiente de aprobación"}),

// Centro
(l6:Local {nombre:"Cafe Mayor", tipo_actividad: "Cafetería", horario:"08-22", licencia: "En trámite"}),
(l7:Local {nombre:"Libreria Sol", tipo_actividad: "Librería", horario:"10-20", licencia: "Concedida"}),
(l8:Local {nombre:"Restaurante GranVia", tipo_actividad: "Restaurante", horario:"13-00", licencia: "Pendiente de renovación"}),
(l9:Local {nombre:"Tienda Callao", tipo_actividad: "Tienda", horario:"10-21", licencia: "Pendiente de renovación"}),
(l10:Local {nombre:"Bar Arenal", tipo_actividad: "Bar", horario:"09-23", licencia: "Concedida"}),

// Chamberí
(l11:Local {nombre:"Cafe Olavide", tipo_actividad: "Cafetería", horario:"08-22", licencia: "En trámite"}),
(l12:Local {nombre:"Bar Ponzano", tipo_actividad: "Bar", horario:"09-23", licencia: "Concedida"}),
(l13:Local {nombre:"Restaurante Trafalgar", tipo_actividad: "Restaurante", horario:"13-00", licencia: "Pendiente de renovación"}),
(l14:Local {nombre:"Tienda Quevedo", tipo_actividad: "Tienda", horario:"10-20", licencia: "Pendiente de renovación"}),
(l15:Local {nombre:"Pub Bilbao", tipo_actividad: "Pub", horario:"18-03", licencia: "Pendiente de aprobación"});

// --- 2.2 Terraza ---
CREATE
(t1:Terraza {nombre:"Terraza1", capacidad:30, estado_licencia: "Concedida"}),
(t2:Terraza {nombre:"Terraza2", capacidad:25, estado_licencia: "Pendiente de renovación"}),
(t3:Terraza {nombre:"Terraza3", capacidad:40, estado_licencia: "Concedida"}),
(t4:Terraza {nombre:"Terraza4", capacidad:20, estado_licencia: "Pendiente de renovación"}),
(t5:Terraza {nombre:"Terraza5", capacidad:35, estado_licencia: "Concedida"}),
(t6:Terraza {nombre:"Terraza6", capacidad:30, estado_licencia: "Concedida"}),
(t7:Terraza {nombre:"Terraza7", capacidad:25, estado_licencia: "Pendiente de renovación"}),
(t8:Terraza {nombre:"Terraza8", capacidad:40, estado_licencia: "Concedida"}),
(t9:Terraza {nombre:"Terraza9", capacidad:20, estado_licencia: "Pendiente de renovación"}),
(t10:Terraza {nombre:"Terraza10", capacidad:35, estado_licencia: "Concedida"})


// --- 2.3 Alojamiento ---
CREATE
// Salamanca
(a1:Alojamiento {nombre:"Apto Salamanca1", precio:120, numero_habitaciones:2, reseñas:40, servicios:["WiFi", "Aire acondicionado"]}),
(a2:Alojamiento {nombre:"Apto Salamanca2", precio:80, numero_habitaciones:1, reseñas:0, servicios:["WiFi"]}),
(a3:Alojamiento {nombre:"Apto Salamanca3", precio:150, numero_habitaciones:3, reseñas:60, servicios:["WiFi", "Aire acondicionado", "Parking"]}),
(a4:Alojamiento {nombre:"Apto Salamanca4", precio:95, numero_habitaciones:0, reseñas:10, servicios:[]}),
(a5:Alojamiento {nombre:"Apto Salamanca5", precio:110, numero_habitaciones:2, reseñas:0, servicios:["WiFi"]}),

// Centro
(a6:Alojamiento {nombre:"Apto Centro1", precio:130, numero_habitaciones:2, reseñas:30, servicios:["WiFi", "Aire acondicionado"]}),
(a7:Alojamiento {nombre:"Apto Centro2", precio:70, numero_habitaciones:1, reseñas:5, servicios:["WiFi"]}),
(a8:Alojamiento {nombre:"Apto Centro3", precio:160, numero_habitaciones:3, reseñas:80, servicios:["WiFi", "Aire acondicionado", "Parking"]}),
(a9:Alojamiento {nombre:"Apto Centro4", precio:90, numero_habitaciones:0, reseñas:0, servicios:[]}),
(a10:Alojamiento {nombre:"Apto Centro5", precio:115, numero_habitaciones:2, reseñas:25, servicios:["WiFi"]}),

// Chamberí
(a11:Alojamiento {nombre:"Apto Chamberi1", precio:125, numero_habitaciones:2, reseñas:35, servicios:["WiFi", "Aire acondicionado"]}),
(a12:Alojamiento {nombre:"Apto Chamberi2", precio:85, numero_habitaciones:1, reseñas:0, servicios:["WiFi"]}),
(a13:Alojamiento {nombre:"Apto Chamberi3", precio:170, numero_habitaciones:3, reseñas:90, servicios:["WiFi", "Aire acondicionado", "Parking"]}),
(a14:Alojamiento {nombre:"Apto Chamberi4", precio:100, numero_habitaciones:0, reseñas:15, servicios:[]}),
(a15:Alojamiento {nombre:"Apto Chamberi5", precio:105, numero_habitaciones:2, reseñas:0, servicios:["WiFi"]});

// --- 2.4 Barrios ---
CREATE 
(b1:Barrio {nombre: "Salamanca"}),
(b2:Barrio {nombre: "Centro"}),
(b3:Barrio {nombre: "Chamberí"});

// --- 3. Creación de Relaciones ---

// --- 3.1 Ubicado_en ---

// --- 3.1.1 SALAMANCA ---
MATCH 
(b:Barrio {nombre:"Salamanca"}),
(l1:Local {nombre:"Cafe Goya"}),
(l2:Local {nombre:"Bar Velazquez"}),
(l3:Local {nombre:"Restaurante Serrano"}),
(l4:Local {nombre:"Tienda Ortega"}),
(l5:Local {nombre:"Pub Alcala"}),
(t1:Terraza {nombre:"Terraza1"}),
(t2:Terraza {nombre:"Terraza2"}),
(t3:Terraza {nombre:"Terraza3"}),
(t4:Terraza {nombre:"Terraza4"}),
(t5:Terraza {nombre:"Terraza5"}),
(a1:Alojamiento {nombre:"Apto Salamanca1"}),
(a2:Alojamiento {nombre:"Apto Salamanca2"}),
(a3:Alojamiento {nombre:"Apto Salamanca3"}),
(a4:Alojamiento {nombre:"Apto Salamanca4"}),
(a5:Alojamiento {nombre:"Apto Salamanca5"})
CREATE
(l1)-[:Ubicado_en {distancia:10}]->(b),
(l2)-[:Ubicado_en {distancia:0}]->(b),
(l3)-[:Ubicado_en {distancia:0}]->(b),
(l4)-[:Ubicado_en {distancia:20}]->(b),
(l5)-[:Ubicado_en {distancia:0}]->(b),
(t1)-[:Ubicado_en {distancia:0}]->(b),
(t2)-[:Ubicado_en {distancia:330}]->(b),
(t3)-[:Ubicado_en {distancia:0}]->(b),
(t4)-[:Ubicado_en {distancia:0}]->(b),
(t5)-[:Ubicado_en {distancia:150}]->(b),
(a1)-[:Ubicado_en {distancia:0}]->(b),
(a2)-[:Ubicado_en {distancia:220}]->(b),
(a3)-[:Ubicado_en {distancia:110}]->(b),
(a4)-[:Ubicado_en {distancia:0}]->(b),
(a5)-[:Ubicado_en {distancia:0}]->(b);

// --- 3.1.2 CHAMBERÍ ---
MATCH 
(b:Barrio {nombre:"Chamberí"}),
(l11:Local {nombre:"Cafe Olavide"}),
(l12:Local {nombre:"Bar Ponzano"}),
(l13:Local {nombre:"Restaurante Trafalgar"}),
(l14:Local {nombre:"Tienda Quevedo"}),
(l15:Local {nombre:"Pub Bilbao"}),
(a11:Alojamiento {nombre:"Apto Chamberi1"}),
(a12:Alojamiento {nombre:"Apto Chamberi2"}),
(a13:Alojamiento {nombre:"Apto Chamberi3"}),
(a14:Alojamiento {nombre:"Apto Chamberi4"}),
(a15:Alojamiento {nombre:"Apto Chamberi5"})
CREATE
(l11)-[:Ubicado_en {distancia:0}]->(b),
(l12)-[:Ubicado_en {distancia:0}]->(b),
(l13)-[:Ubicado_en {distancia:0}]->(b),
(l14)-[:Ubicado_en {distancia:0}]->(b),
(l15)-[:Ubicado_en {distancia:0}]->(b),
(a11)-[:Ubicado_en {distancia:0}]->(b),
(a12)-[:Ubicado_en {distancia:0}]->(b),
(a13)-[:Ubicado_en {distancia:0}]->(b),
(a14)-[:Ubicado_en {distancia:0}]->(b),
(a15)-[:Ubicado_en {distancia:0}]->(b);

// --- 3.2 Cercano_a ---
MATCH 
(l1:Local {nombre:"Cafe Goya"}),
(a1:Alojamiento {nombre:"Apto Salamanca1"}),
(t1:Terraza {nombre:"Terraza1"})
CREATE
(l1)-[:Cercano_a {distancia:200}]->(a1),
(l1)-[:Cercano_a {distancia:100}]->(t1),
(t1)-[:Cercano_a {distancia:150}]->(a1);

MATCH
(l2:Local {nombre:"Bar Velazquez"}),
(a2:Alojamiento {nombre:"Apto Salamanca2"}),
(t2:Terraza {nombre:"Terraza2"}),
(l3:Local {nombre:"Restaurante Serrano"}),
(a3:Alojamiento {nombre:"Apto Salamanca3"}),
(t3:Terraza {nombre:"Terraza3"})
CREATE
(l2)-[:Cercano_a {distancia:180}]->(a2),
(l2)-[:Cercano_a {distancia:120}]->(t2),
(t2)-[:Cercano_a {distancia:210}]->(a2),
(l3)-[:Cercano_a {distancia:250}]->(a3),
(l3)-[:Cercano_a {distancia:140}]->(t3);

MATCH
(l6:Local {nombre:"Cafe Mayor"}),
(a6:Alojamiento {nombre:"Apto Centro1"}),
(t6:Terraza {nombre:"Terraza6"}),
(l10:Local {nombre:"Bar Arenal"}),
(a9:Alojamiento {nombre:"Apto Centro4"}),
(t9:Terraza {nombre:"Terraza9"})
CREATE
(l6)-[:Cercano_a {distancia:150}]->(a6),
(l6)-[:Cercano_a {distancia:90}]->(t6),
(t6)-[:Cercano_a {distancia:200}]->(a6),
(l10)-[:Cercano_a {distancia:300}]->(a9),
(l10)-[:Cercano_a {distancia:130}]->(t9);

MATCH
(l12:Local {nombre:"Bar Ponzano"}),
(a12:Alojamiento {nombre:"Apto Chamberi2"}),
(l13:Local {nombre:"Restaurante Trafalgar"}),
(a13:Alojamiento {nombre:"Apto Chamberi3"})
CREATE
(l12)-[:Cercano_a {distancia:160}]->(a12),
(l13)-[:Cercano_a {distancia:280}]->(a13);

// --- 3.3 Relacionado_con (Versión Optimizada con MERGE) ---

// --- 3.3.1 Por tipo de actividad ---
// Conectamos los locales del mismo tipo de forma secuencial
MATCH (l1:Local {nombre:"Cafe Goya"}), (l6:Local {nombre:"Cafe Mayor"}), (l11:Local {nombre:"Cafe Olavide"})
MERGE (l1)-[:Relacionado_con {criterio:"tipo_actividad"}]->(l6)
MERGE (l6)-[:Relacionado_con {criterio:"tipo_actividad"}]->(l11);

MATCH (l3:Local {nombre:"Restaurante Serrano"}), (l8:Local {nombre:"Restaurante GranVia"}), (l13:Local {nombre:"Restaurante Trafalgar"})
MERGE (l3)-[:Relacionado_con {criterio:"tipo_actividad"}]->(l8)
MERGE (l8)-[:Relacionado_con {criterio:"tipo_actividad"}]->(l13);

MATCH (l2:Local {nombre:"Bar Velazquez"}), (l10:Local {nombre:"Bar Arenal"}), (l12:Local {nombre:"Bar Ponzano"})
MERGE (l2)-[:Relacionado_con {criterio:"tipo_actividad"}]->(l10)
MERGE (l10)-[:Relacionado_con {criterio:"tipo_actividad"}]->(l12);

// --- 3.3.2 Por estado de licencia ---
// Usamos id(t1) < id(t2) para conectar todas las que tengan licencia "Concedida" sin duplicar flechas
MATCH (t1:Terraza {estado_licencia:"Concedida"}), (t2:Terraza {estado_licencia:"Concedida"})
WHERE id(t1) < id(t2)
MERGE (t1)-[:Relacionado_con {criterio:"estado_licencia"}]->(t2);

// --- 3.3.3 Por precio ---
MATCH (a2:Alojamiento {nombre:"Apto Salamanca2"}), (a7:Alojamiento {nombre:"Apto Centro2"}), (a12:Alojamiento {nombre:"Apto Chamberi2"})
MERGE (a2)-[:Relacionado_con {criterio:"precio_bajo"}]->(a7)
MERGE (a7)-[:Relacionado_con {criterio:"precio_bajo"}]->(a12);

MATCH (a3:Alojamiento {nombre:"Apto Salamanca3"}), (a8:Alojamiento {nombre:"Apto Centro3"}), (a13:Alojamiento {nombre:"Apto Chamberi3"})
MERGE (a3)-[:Relacionado_con {criterio:"precio_premium"}]->(a8)
MERGE (a8)-[:Relacionado_con {criterio:"precio_premium"}]->(a13);

// Conexión en cadena para alojamientos sin reseñas
MATCH (a2:Alojamiento {nombre:"Apto Salamanca2"}), 
      (a5:Alojamiento {nombre:"Apto Salamanca5"}), 
      (a9:Alojamiento {nombre:"Apto Centro4"}), 
      (a12:Alojamiento {nombre:"Apto Chamberi2"}), 
      (a15:Alojamiento {nombre:"Apto Chamberi5"})
MERGE (a2)-[:Relacionado_con {criterio:"sin_reseñas"}]->(a5)
MERGE (a5)-[:Relacionado_con {criterio:"sin_reseñas"}]->(a9)
MERGE (a9)-[:Relacionado_con {criterio:"sin_reseñas"}]->(a12)
MERGE (a12)-[:Relacionado_con {criterio:"sin_reseñas"}]->(a15);

// Visualizar todo:
// MATCH (n)-[r]->(m)
// RETURN n,r,m;

// Visualizar todo lo relacionado con el barrio de Salamanca:
//MATCH (b:Barrio {nombre: "Salamanca"})-[r]-(n)
//RETURN b, r, n

// Verificar los nodos y atributos creados:
// MATCH (n:Local)
// RETURN n.nombre, n.tipo_actividad, n.horario, n.licencia;

// MATCH (n:Terraza)
// RETURN n.nombre, n.capacidad, n.estado_licencia;

// MATCH (n:Alojamiento)
// RETURN n.nombre, n.precio, n.numero_habitaciones, n.reseñas, n.servicios;

// MATCH (n:Barrio)
// RETURN n.nombre;

// Consultar relaciones y sus atributos:
// MATCH (n)-[r:Ubicado_en]->(m:Barrio)
// RETURN n.nombre AS entidad, m.nombre AS barrio, r.distancia AS distancia 

// MATCH (n)-[r:Relacionado_con]->(m)
// RETURN n.nombre AS entidad, m.nombre AS relacionado, r.criterio AS criterio

// MATCH (n)-[r:Cercano_a]->(m)
// RETURN n.nombre AS entidad, m.nombre AS barrio, r.distancia AS distancia


