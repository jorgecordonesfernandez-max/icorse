# Revisión de Limpiezas Icorse · 12 de noviembre de 2026

La web tiene una identidad reconocible: naranja y verde, logo centrado, paneles suaves y una composición sencilla. Conviene conservar esa base. La sensación de que «falta algo» parece venir, sobre todo, de la jerarquía del contenido y de las acciones para contactar: al entrar hay bastante texto, pero cuesta identificar el siguiente paso.

## Revisión estética y de uso

Revisión visual de Inicio y Servicios a 1440 y 390 píxeles de ancho, con Chrome. Se comprobó también la nueva página de casas y se verificó el diseño a 320 y 768 píxeles. Estas observaciones son una valoración de diseño; no son resultados de un estudio con clientes.

| Prioridad | Observación | Siguiente mejora propuesta |
| --- | --- | --- |
| Resuelta | En Inicio, la presentación empezaba directamente con dos párrafos y varias frases destacadas. | Añadidos el título principal visible «Limpieza de comunidades y viviendas» y el botón «Solicitar presupuesto». Se conservan los párrafos y la imagen; los destacados pueden revisarse más adelante. |
| Resuelta | «Iniciar chat» era un párrafo sin enlace ni comportamiento asociado en `app.js`. | Convertido en «Iniciar chat por WhatsApp», con un enlace al número confirmado por el propietario y un área de pulsación de al menos 44 px. |
| Resuelta | El menú variaba entre páginas y la sección activa apenas se distinguía. La altura fija reservada para la cabecera provocaba solapamientos en pantallas estrechas. | Menú uniforme en las diez páginas públicas, enlaces más espaciados, sección activa subrayada y foco de teclado visible. La cabecera conserva su posición al desplazarse y su altura real determina dónde empieza el contenido. |
| Resuelta | El bloque de maquinaria combinaba textos manuscritos, un rótulo inclinado y máquinas a distintas alturas. | Título antes de las tres máquinas, tipografía de la web, colores de marca y composición alineada en escritorio y en columna en móvil. Las fotos se muestran completas. |
| Resuelta | Los cinco PNG originales suman unos 11,38 MiB y se mostraban mucho más pequeños. | Versiones WebP adecuadas para su uso, imagen principal adaptable a la pantalla y favicon pequeño. Se conservan los PNG originales y sus direcciones como alternativa. Las dimensiones y posiciones de los elementos se compararon antes y después. |
| Media | La imagen principal representa la entrada de un edificio residencial. Sirve para la marca, pero explica poco el trabajo dentro de una casa. | Incorporar más adelante una foto propia de limpieza de una vivienda, con permiso de uso y sin datos identificativos de clientes. |

La primera mejora de contacto ya está aplicada: botón de presupuesto en Inicio, chat de WhatsApp funcional y teléfono pulsable en Contacto. Se conservan los textos de presentación, las imágenes y la identidad visual.

## Apartado de limpieza de casas añadido

- Página propia en `/limpieza-casas.html`, con tareas habituales, servicio puntual o de mantenimiento, zonas y acceso al presupuesto.
- Cobertura indicada: Galapagar, El Escorial y San Lorenzo de El Escorial.
- Enlace desde el texto de Inicio, bloque propio en Inicio y bloque destacado en Servicios.
- Se reutilizan logo, colores, tipografía, paneles, cabecera y componentes existentes.
- El alcance y la frecuencia se acuerdan en el presupuesto; no se anuncian tarifas ni disponibilidad garantizada.
- En Inicio, el bloque de casas aparece antes de «Así trabajamos».

## Últimas mejoras, realizadas por etapas

1. **Presupuesto para comunidades:** botones al principio y al final de las dos páginas locales. Se comprobaron ambos destinos y su tamaño de pulsación en móvil antes de continuar.
2. **Imágenes:** comparación de posiciones y tamaños antes y después de optimizar, revisión visual y comprobación de las diez páginas públicas. Se mantienen las imágenes originales y sus textos alternativos.
3. **Maquinaria:** título de sección antes de los nombres, tipografía coherente y fotos completas. Revisión visual a 320, 390, 768 y 1440 px.

### Peso de imágenes descargadas en las pruebas locales

| Página y pantalla | Antes | Después | Reducción |
| --- | --- | --- | --- |
| Inicio, escritorio de 1440 px | 4,42 MB | 0,20 MB | 95,5 % |
| Inicio, móvil de 390 px y densidad 2× | 4,42 MB | 0,27 MB | 93,9 % |
| Servicios, escritorio y móvil | 9,11 MB | 0,37 MB | 96,0 % |

Se mide la suma de bytes de los recursos de imagen descargados por Chrome en sesiones nuevas, sin caché previa. No equivale a una mejora porcentual del tiempo total de carga ni a una medición de Core Web Vitals con usuarios reales. Las capturas y los informes de comprobación se guardan fuera del repositorio publicado.

## Cuidado del posicionamiento

Se mantienen las direcciones y los títulos existentes, el contenido principal de comunidades y las rutas de contacto. La nueva página tiene título y descripción propios, una única URL canónica, contenido visible para los tres municipios y datos estructurados de tipo `Service` coherentes con ese contenido. Se ha añadido al sitemap y se han actualizado las fechas de las páginas modificadas.

Se han retirado las etiquetas canónicas duplicadas que apuntaban a `www` en las dos páginas de comunidades. Cada una conserva su canónica sin `www`, que coincide con el sitemap y el dominio de `CNAME`. Sus textos y títulos permanecen iguales.

Una página útil dedicada a casas permite diferenciar la intención de búsqueda de la de comunidades. No se han creado tres copias casi idénticas cambiando el municipio. Los enlaces internos y los títulos descriptivos siguen la [guía SEO de Google](https://developers.google.com/search/docs/fundamentals/seo-starter-guide?hl=es); la coherencia de las canónicas sigue su [documentación de canonicalización](https://developers.google.com/search/docs/crawling-indexing/consolidate-duplicate-urls?hl=es). La precaución con páginas repetidas por localidad se apoya en las [políticas sobre páginas puerta](https://developers.google.com/search/docs/essentials/spam-policies?hl=es#doorway-abuse).

### Observaciones para otra revisión

- Resuelto: Inicio cuenta con un único `h1` visible, «Limpieza de comunidades y viviendas», que mantiene el enfoque de la página y utiliza los colores de la marca.
- Resuelto: la cabecera participa en el flujo de la página con `position: sticky`. Al repartirse el menú en varias líneas, el contenido se coloca debajo sin depender de alturas fijas, también con JavaScript desactivado.
- Hay metadatos sociales con `www` y la canónica de Empleo usa `www`, mientras que el sitemap emplea el dominio sin `www`. Se puede revisar su coherencia en una intervención específica; en esta entrega solo se corrigen las canónicas duplicadas inequívocas de comunidades.
- Resuelto: el propietario confirmó el `664 345 431` como número de WhatsApp. Se han actualizado los enlaces de Inicio y Contacto y el teléfono del aviso legal. Contacto incluye también un enlace para llamar a ese número.

## Seguimiento recomendado en Google

Esta revisión no dispone de datos de Search Console, consultas, clics, posiciones ni conversiones. Por tanto, no permite cuantificar el posicionamiento actual ni garantizar que permanezca igual.

Tras publicar, conviene revisar el sitemap en Search Console e inspeccionar la nueva URL. Comparar después periodos equivalentes de 28 días, separando las consultas de casas y las de comunidades, por página y dispositivo. Registrar la fecha del cambio y tener en cuenta la estacionalidad. Google puede tardar en rastrear e indexar la nueva página; su inclusión en el sitemap no garantiza indexación ni una posición determinada.

## Comprobaciones de esta entrega

Se revisan enlaces locales y recursos, título y canónica de la página nueva, datos estructurados, sitemap y conservación de las páginas existentes. La revisión en Chrome cubre escritorio y móvil, imágenes cargadas y errores de JavaScript. Las capturas de antes y después se guardan fuera del código publicado.
