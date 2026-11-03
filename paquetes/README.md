# Paquetes por integrante

Orden de commits para la entrega (mismo orden de la tabla de roles):

| # | Integrante | Rol | Carpeta |
|---|------------|-----|---------|
| 1 | Diego Baños | Autenticación y backend | `01-diego-banos-auth-backend` |
| 2 | Javier Cruz | Gestión de prendas | `02-javier-cruz-closet` |
| 3 | Juleysi Carballo | Recomendaciones y clima | `03-juleysi-carballo-today` |
| 4 | Diego Castro | Asistente de moda | `04-diego-castro-assistant` |
| 5 | Ariana Martínez | Recordatorios y calidad | `05-ariana-martinez-reminders` |
| 6 | Iván Vásquez | Perfil, shell y design system | `06-ivan-vasquez-shell` |

## Cómo hacer los commits (en orden)

Desde la raíz del repo:

```powershell
# Solo stagear (revisar con git status / git diff --staged)
.\scripts\paquete.ps1 -Numero 1 -Accion stage

# Stagear y crear el commit del paquete
.\scripts\paquete.ps1 -Numero 1 -Accion commit

# Repetir 2 … 6
.\scripts\paquete.ps1 -Numero 2 -Accion commit
# …
.\scripts\paquete.ps1 -Numero 6 -Accion commit
```

O todos seguidos (solo si estás seguro):

```powershell
.\scripts\paquete.ps1 -Accion commit-all
```

Cada carpeta incluye:

- `ARCHIVOS.txt` — rutas que pertenecen al integrante (una por línea)
- `COMMIT_MSG.txt` — mensaje conventional commit listo para pegar
- `README.md` — pantallas y alcance transversal

> **Nota:** `ARCHIVOS.txt` lista la propiedad lógica del módulo. Algunos archivos compartidos
> (p. ej. `test/helpers/fakes.dart`) aparecen en más de un paquete; el script de commit
> solo agrega archivos existentes y evita duplicar commits vacíos.
