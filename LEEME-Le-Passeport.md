# Le Passeport Travel — Guía de puesta en marcha

Dos archivos, cero servidores, cero bases de datos.

| Archivo | Qué es |
|---|---|
| `index.html` | El sitio completo **y** el panel de la dueña (todo en uno). |
| `content.json` | El contenido editable: destinos, precios, promociones, textos y fotos. |

El sitio lee `content.json` al cargar. El panel escribe ese mismo archivo en GitHub. Eso es todo el "backend".

---

## 1. Publicarlo en internet (10 minutos, gratis)

1. Crea una cuenta en **github.com** (si la dueña tendrá el control, créala a su nombre).
2. **New repository** → nombre: `lepasseport` → **Public** → Create.
3. **Add file → Upload files** → arrastra `index.html` y `content.json` → Commit.
4. **Settings → Pages** → Source: `Deploy from a branch` → Branch: `main` / `(root)` → Save.
5. En 1–2 minutos el sitio queda vivo en:
   `https://TU-USUARIO.github.io/lepasseport/`

Para un dominio propio (`lepasseporttravel.com`): en **Settings → Pages → Custom domain**, y en tu proveedor de dominio apunta un CNAME a `TU-USUARIO.github.io`.

---

## 2. El token (lo que permite editar desde la página)

1. GitHub → foto de perfil → **Settings**
2. **Developer settings** → **Personal access tokens** → **Fine-grained tokens** → **Generate new token**
3. Configúralo así:
   - **Repository access:** Only select repositories → `lepasseport`
   - **Permissions → Repository permissions → Contents:** `Read and write`
   - **Expiration:** 1 año (hay que renovarlo cuando venza)
4. Copia el token (empieza con `github_pat_...`). **Solo se muestra una vez.**

---

## 3. Cómo entra la dueña al panel

- Abre el sitio y va a `https://.../lepasseport/#admin`
  (o hace clic en **"Acceso administración"** al pie del sitio, o presiona `Ctrl + Shift + A`).
- **Contraseña inicial: `passeport2026`** → cámbiala en la pestaña *Ajustes*.
- La primera vez, en **Ajustes / GitHub** pega: usuario, repositorio (`lepasseport`), rama (`main`) y el token → **Guardar** → **Probar conexión** (debe decir ✓ Conectado).

El token queda guardado **solo en su navegador**, nunca viaja al sitio ni lo ve nadie más. Si cambia de computadora, lo vuelve a pegar.

---

## 4. Qué puede hacer sin tocar código

**Destinos** — cambiar fotos (arrastrando el archivo), precios, noches, descuentos, textos, actividades; crear o eliminar destinos.
**Promociones** — activar/desactivar la sección, cambiar el banner, la fecha de fin (el contador regresivo corre solo).
**Textos & Portada** — nombre de la marca, número de WhatsApp, titular, y las fotos del carrusel del hero. Si pega la URL de un **.mp4**, el hero pasa a ser video.
**Multimedia** — subir fotos/videos; se guardan en la carpeta `media/` del repositorio y quedan con URL pública (clic en la imagen = copia la URL).

> Cada cambio se ve al instante en su pantalla. Para que lo vean los clientes, hay que presionar **Publicar cambios** (arriba a la derecha). Aparece un aviso "● Cambios sin publicar" mientras haya pendientes.

---

## 5. Los leads

El test **"Encuentra tu viaje ideal"** arma un mensaje con las 5 respuestas + nombre, WhatsApp y correo, y lo abre directo en **WhatsApp: 55 5953 8285**. Sin intermediarios, sin servicios de pago y sin guardar datos de clientes en ningún lado: la conversación vive en WhatsApp, que es donde se cierra la venta.

---

## 6. Las fotos

Vienen de Unsplash (uso libre) enlazadas directo, así que cargan rápido y en alta resolución. Si alguna URL fallara, el sitio muestra automáticamente una imagen de respaldo — nunca se ve un hueco roto. Cuando la agencia tenga fotos propias, se suben desde *Multimedia* y se reemplazan.

---

## 7. Si algo falla

| Síntoma | Causa casi siempre |
|---|---|
| "✗ No se pudo publicar: 404" | Usuario o repositorio mal escritos, o el token no tiene acceso a ese repo. |
| "✗ Error 403" | Al token le falta el permiso **Contents: Read and write**. |
| Publica pero el sitio no cambia | GitHub Pages tarda 1–2 min. Recarga con `Ctrl + F5`. |
| El sitio se ve sin destinos al abrirlo con doble clic | Normal en local: `content.json` no se puede leer con `file://`. Súbelo a GitHub Pages (o usa un servidor local) y se ve completo. Aun así trae una copia de respaldo del contenido embebida. |
