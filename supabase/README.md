# Supabase setup - Limpiezas Icorse

## 1) Crear proyecto Supabase
- Crea un proyecto en https://supabase.com
- Guarda `Project URL` y `anon public key`

## 2) Ejecutar schema
- Ve a SQL Editor
- Pega y ejecuta `supabase/schema.sql`

## 3) Crear usuario admin inicial
- Authentication > Users > Add user
- Email recomendado: admin@limpiezasicorse.com
- Crea password fuerte
- Copia el `UUID` del usuario
- En SQL Editor ejecuta:

```sql
insert into public.profiles (id, full_name, role)
values ('UUID_DEL_ADMIN', 'Administración Icorse', 'admin')
on conflict (id) do update set role='admin', full_name='Administración Icorse';
```

## 4) Crear empleados
- Opción A: desde panel admin futuro (recomendado)
- Opción B: crear usuarios en Auth y añadir perfil en `public.profiles`

## 5) Seguridad mínima recomendada
- En Auth > Policies confirma RLS ON en tablas
- En Auth > Settings configura email recovery
- Activa MFA para cuentas admin (recomendado)

## 6) Frontend
- Usa `supabase-config.js` (plantilla) para URL y key pública
- Nunca subas service role key al frontend

## 7) Dominio y CORS
- Añade `https://www.limpiezasicorse.com` en Auth > URL Configuration (Site URL y Redirect URLs)
