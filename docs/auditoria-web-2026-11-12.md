# Revisión de Limpiezas Icorse · 12 de noviembre de 2026

La web tiene una identidad reconocible: naranja y verde, logo centrado, paneles suaves y una composición sencilla. Conviene conservar esa base. La sensación de que «falta algo» parece venir, sobre todo, de la jerarquía del contenido y de las acciones para contactar: al entrar hay bastante texto, pero cuesta identificar el siguiente paso.

## Revisión estética y de uso

Revisión visual de Inicio y Servicios a 1440 y 390 píxeles de ancho, con Chrome. Se comprobó también la nueva página de casas y se verificó el diseño a 320 y 768 píxeles. Estas observaciones son una valoración de diseño; no son resultados de un estudio con clientes.

| Prioridad | Observación | Siguiente mejora propuesta |
| --- | --- | --- |
| Alta | En Inicio, la presentación empieza con dos párrafos y varias frases destacadas. | Ya se ha añadido el botón «Solicitar presupuesto» junto al texto inicial. Queda pendiente revisar el título y los destacados conservando la composición. |
| Resuelta | «Iniciar chat» era un párrafo sin enlace ni comportamiento asociado en `app.js`. | Convertido en «Iniciar chat por WhatsApp», con un enlace al número confirmado por el propietario y un área de pulsación de al menos 44 px. |
| Resuelta | El menú variaba entre páginas y la sección activa apenas se distinguía. La altura fija reservada para la cabecera provocaba solapamientos en pantallas estrechas. | Menú uniforme en las diez páginas públicas, enlaces más espaciados, sección activa subrayada y foco de teclado visible. La cabecera conserva su posición al desplazarse y su altura real determina dónde empieza el contenido. |
| Media | En Servicios conviven paneles suaves, bordes negros, textos manuscritos para las máquinas y un título inclinado. | Elegir una misma jerarquía de títulos para el bloque de maquinaria. Mantener sus fotos y la paleta de marca. |
| Media | Los cinco PNG actuales suman unos 11,38 MiB. El logo pesa 1,52 MiB y la imagen principal 2,69 MiB, aunque se muestran mucho más pequeños. | Preparar versiones optimizadas para cada tamaño, conservar los originales y comparar la apariencia antes de sustituirlos. El peso no es una medición de velocidad ni de Core Web Vitals. |
| Media | La imagen principal representa la entrada de un edificio residencial. Sirve para la marca, pero explica poco el trabajo dentro de una casa. | Incorporar más adelante una foto propia de limpieza de una vivienda, con permiso de uso y sin datos identificativos de clientes. |

La primera mejora de contacto ya está aplicada: botón de presupuesto en Inicio, chat de WhatsApp funcional y teléfono pulsable en Contacto. Se conservan los textos de presentación, las imágenes y la identidad visual.

## Apartado de limpieza de casas añadido

- Página propia en `/limpieza-casas.html`, con tareas habituales, servicio puntual o de mantenimiento, zonas y acceso al presupuesto.
- Cobertura indicada: Galapagar, El Escorial y San Lorenzo de El Escorial.
- Enlace desde el texto de Inicio, bloque propio en Inicio y bloque destacado en Servicios.
- Se reutilizan logo, colores, tipografía, paneles, cabecera y componentes existentes.
- El alcance y la frecuencia se acuerdan en el presupuesto; no se anuncian tarifas ni disponibilidad garantizada.

## Cuidado del posicionamiento

Se mantienen las direcciones y los títulos existentes, el contenido principal de comunidades y las rutas de contacto. La nueva página tiene título y descripción propios, una única URL canónica, contenido visible para los tres municipios y datos estructurados de tipo `Service` coherentes con ese contenido. Se ha añadido al sitemap y se han actualizado las fechas de las páginas modificadas.

Se han retirado las etiquetas canónicas duplicadas que apuntaban a `www` en las dos páginas de comunidades. Cada una conserva su canónica sin `www`, que coincide con el sitemap y el dominio de `CNAME`. Sus textos y títulos permanecen iguales.

Una página útil dedicada a casas permite diferenciar la intención de búsqueda de la de comunidades. No se han creado tres copias casi idénticas cambiando el municipio. Los enlaces internos y los títulos descriptivos siguen la [guía SEO de Google](https://developers.google.com/search/docs/fundamentals/seo-starter-guide?hl=es); la coherencia de las canónicas sigue su [documentación de canonicalización](https://developers.google.com/search/docs/crawling-indexing/consolidate-duplicate-urls?hl=es). La precaución con páginas repetidas por localidad se apoya en las [políticas sobre páginas puerta](https://developers.google.com/search/docs/essentials/spam-policies?hl=es#doorway-abuse).

### Observaciones para otra revisión

- Inicio no tiene un `h1`. Conviene incorporarlo al revisar su presentación, con un texto útil y visible que respete su enfoque actual.
- Resuelto: la cabecera participa en el flujo de la página con `position: sticky`. Al repartirse el menú en varias líneas, el contenido se coloca debajo sin depender de alturas fijas, también con JavaScript desactivado.
- Hay metadatos sociales con `www` y la canónica de Empleo usa `www`, mientras que el sitemap emplea el dominio sin `www`. Se puede revisar su coherencia en una intervención específica; en esta entrega solo se corrigen las canónicas duplicadas inequívocas de comunidades.
- Resuelto: el propietario confirmó el `664 345 431` como número de WhatsApp. Se han actualizado los enlaces de Inicio y Contacto y el teléfono del aviso legal. Contacto incluye también un enlace para llamar a ese número.

## Seguimiento recomendado en Google

Esta revisión no dispone de datos de Search Console, consultas, clics, posiciones ni conversiones. Por tanto, no permite cuantificar el posicionamiento actual ni garantizar que permanezca igual.

Tras publicar, conviene revisar el sitemap en Search Console e inspeccionar la nueva URL. Comparar después periodos equivalentes de 28 días, separando las consultas de casas y las de comunidades, por página y dispositivo. Registrar la fecha del cambio y tener en cuenta la estacionalidad. Google puede tardar en rastrear e indexar la nueva página; su inclusión en el sitemap no garantiza indexación ni una posición determinada.

## Comprobaciones de esta entrega

Se revisan enlaces locales y recursos, título y canónica de la página nueva, datos estructurados, sitemap y conservación de las páginas existentes. La revisión en Chrome cubre escritorio y móvil, imágenes cargadas y errores de JavaScript. Las capturas de antes y después se guardan fuera del código publicado.
