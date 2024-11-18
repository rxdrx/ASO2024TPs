**Ejercicio 5: Torneos de ciclismo**

**Esquema de BD:**

`TORNEO<cod_torneo, nombre_torneo, cod_corredor, cod_bicicleta, marca_bicicleta, nyap_corredor, sponsor, DNI_presidente_sponsor, DNI_medico>`

\*\*Restricciones:\*\*

\- El código del torneo es único y no se repite para diferentes torneos. Pero los nombres de los torneos pueden repetirse entre diferentes torneos (por ejemplo, el “Tour de Francia” se desarrolla todos los años y siempre lleva el mismo nombre).  
\- Un corredor corre varios torneos. Tiene un código único por torneo, pero en diferentes torneos tiene diferentes códigos.  
\- Cada corredor tiene varias bicicletas asignadas para un torneo.  
\- Los cod\_bicicleta pueden cambiar en diferentes torneos, pero dentro de un torneo son únicos.  
\- Cada bicicleta tiene una sola marca.  
\- Cada corredor tiene varios sponsors en un torneo, y un sponsor puede representar a varios corredores.  
\- Cada sponsor tiene un único presidente y un único médico.

\#\#\# Paso 1: Determinar las Dependencias Funcionales (DFs)

A partir del esquema y las restricciones dadas, podemos determinar las siguientes dependencias funcionales:

1\. \*\*cod\_torneo → nombre\_torneo\*\*: el nombre de un torneo puede repetirse en diferentes años, pero el código de torneo (\`cod\_torneo\`) lo identifica de forma única.

2\. \*\*cod\_torneo, cod\_corredor → nyap\_corredor\*\*: Cada torneo tiene varios corredores y cada corredor puede participar en numerosos torneos, y si bien el nombre no cambia, si que puede repetirse, así que \`nyap\_corredor\` depende de la combinación de \`cod\_torneo, cod\_corredor\`

3\. \*\*cod\_bicicleta → marca\_bicicleta\*\*: cada bicicleta tiene un código único dentro de un torneo y este código identifica de manera única la marca de la bicicleta dentro de ese torneo. Pero los códigos de bicicletas pueden ser distintos entre torneos por eso se debe añadir \`cod\_torneo\` para que haya dependencia.

4\. \*\*sponsor → DNI\_presidente\_sponsor, DNI\_medico\*\*: cada sponsor tiene un único presidente y un único médico asociado. Hace que \`DNI\_presidente\_sponsor\` y \`DNI\_medico\` dependan de \`sponsor\`.

\#\#\# Paso 2: Determinar las Claves Candidatas

La clave primaria debe identificar de manera única cada fila en la tabla \`TORNEO\`. Según las dependencias y restricciones:

\- Cada combinación de \`cod\_torneo\`, \`cod\_corredor\`, \`cod\_bicicleta y \`sponsor\` identifica de manera única una fila.

Por lo tanto, la \*\*clave candidata\*\* es:

\- (\`cod\_torneo\`, \`cod\_corredor\`, \`cod\_bicicleta\`, \`sponsor\`)

\#\#\# Paso 3: Diseño en Tercera Forma Normal (3FN)

Se dividió la tabla original en seis tablas (\`NOMBRE\_TORNEO\`, \`CORREDOR\`, \`BICICLETA\`, \`SPONSOR\`, \`CORREDOR\_SPONSOR\`, \`TORNEO\`) para eliminar dependencias transitivas y garantizar que cada atributo no clave dependa únicamente de la clave primaria completa.

1\. \*\*Tabla \`NOMBRE\_TORNEO\`\*\*  
   \- \`cod\_torneo\` (Clave primaria)  
   \- \`nombre\_torneo\`

2\. \*\*Tabla \`CORREDOR\`\*\*  
   \- \`cod\_torneo\` (Clave foránea que referencia a \`TORNEO\`)  
   \- \`cod\_corredor\`  
   \- \`nyap\_corredor\`  
   \- Clave primaria compuesta: (\`cod\_torneo\`, \`cod\_corredor\`)

3\. \*\*Tabla \`BICICLETA\`\*\*  
   \- \`cod\_torneo\` (Clave foránea que referencia a \`TORNEO\`)  
   \- \`cod\_corredor\` (Clave foránea que referencia a \`CORREDOR\`)  
   \- \`cod\_bicicleta\`  
   \- \`marca\_bicicleta\`  
   \- Clave primaria compuesta: (\`cod\_torneo\`, \`cod\_bicicleta\`)

4\. \*\*Tabla \`SPONSOR\`\*\*  
   \- \`sponsor\` (Clave primaria)  
   \- \`DNI\_presidente\_sponsor\`  
   \- \`DNI\_medico\`

5\. \*\*Tabla \`CORREDOR\_SPONSOR\`\*\*  
   \- \`cod\_torneo\` (Clave foránea que referencia a \`TORNEO\`)  
   \- \`cod\_corredor\` (Clave foránea que referencia a \`CORREDOR\`)  
   \- \`sponsor\` (Clave foránea que referencia a \`SPONSOR\`)  
   \- Clave primaria compuesta: (\`cod\_torneo\`, \`cod\_corredor\`, \`sponsor\`)

6\. \*\*Tabla \`TORNEO\`\*\*  
   \- \`cod\_torneo\` (Clave foránea que referencia a \`TORNEO\`)  
   \- \`cod\_corredor\` (Clave foránea que referencia a \`CORREDOR\`)  
   \- \`cod\_bicicleta\` (Clave foránea que referencia a \`BICICLETA\`)  
   \- \`sponsor\` (Clave foránea que referencia a \`SPONSOR\`)  
   \- Clave primaria compuesta: (\`cod\_torneo\`, \`cod\_corredor\`, \`cod\_bicicleta\`, \`sponsor\`)

