-- Limpiezas Icorse - Production schema (Supabase)
-- Run in Supabase SQL Editor

create extension if not exists pgcrypto;

create type public.user_role as enum ('admin', 'employee');
create type public.machine_status as enum ('operativa', 'revision', 'fuera');
create type public.incident_priority as enum ('alta', 'media', 'baja');
create type public.incident_status as enum ('abierta', 'resuelta');
create type public.signup_status as enum ('apuntado', 'cancelado');

create table if not exists public.profiles (
  id uuid primary key references auth.users(id) on delete cascade,
  full_name text not null,
  role public.user_role not null default 'employee',
  active boolean not null default true,
  created_at timestamptz not null default now()
);

create table if not exists public.events (
  id uuid primary key default gen_random_uuid(),
  title text not null,
  event_date date not null,
  description text,
  created_by uuid not null references public.profiles(id),
  created_at timestamptz not null default now()
);

create table if not exists public.incidents (
  id uuid primary key default gen_random_uuid(),
  title text not null,
  area text not null,
  priority public.incident_priority not null default 'media',
  status public.incident_status not null default 'abierta',
  created_by uuid not null references public.profiles(id),
  assigned_to uuid references public.profiles(id),
  resolved_at timestamptz,
  created_at timestamptz not null default now()
);

create table if not exists public.machines (
  id uuid primary key default gen_random_uuid(),
  code text unique not null,
  name text not null,
  status public.machine_status not null default 'operativa',
  last_review_date date,
  notes text,
  updated_at timestamptz not null default now()
);

create table if not exists public.integral_activities (
  id uuid primary key default gen_random_uuid(),
  title text not null,
  activity_date date not null,
  zone text not null,
  description text,
  created_by uuid not null references public.profiles(id),
  created_at timestamptz not null default now()
);

create table if not exists public.integral_signups (
  id uuid primary key default gen_random_uuid(),
  activity_id uuid not null references public.integral_activities(id) on delete cascade,
  employee_id uuid not null references public.profiles(id) on delete cascade,
  status public.signup_status not null default 'apuntado',
  created_at timestamptz not null default now(),
  unique (activity_id, employee_id)
);

create table if not exists public.chat_messages (
  id uuid primary key default gen_random_uuid(),
  sender_id uuid not null references public.profiles(id) on delete cascade,
  recipient_id uuid not null references public.profiles(id) on delete cascade,
  body text not null,
  read_at timestamptz,
  created_at timestamptz not null default now()
);

create index if not exists idx_events_date on public.events(event_date);
create index if not exists idx_incidents_status_priority on public.incidents(status, priority);
create index if not exists idx_integrals_date on public.integral_activities(activity_date);
create index if not exists idx_signups_activity on public.integral_signups(activity_id);
create index if not exists idx_chat_sender_recipient_date on public.chat_messages(sender_id, recipient_id, created_at desc);

create or replace function public.is_admin(uid uuid)
returns boolean
language sql
stable
as $$
  select exists (
    select 1
    from public.profiles p
    where p.id = uid
      and p.role = 'admin'
      and p.active = true
  );
$$;

alter table public.profiles enable row level security;
alter table public.events enable row level security;
alter table public.incidents enable row level security;
alter table public.machines enable row level security;
alter table public.integral_activities enable row level security;
alter table public.integral_signups enable row level security;
alter table public.chat_messages enable row level security;

-- Profiles
drop policy if exists profiles_select_self_or_admin on public.profiles;
create policy profiles_select_self_or_admin on public.profiles
for select to authenticated
using (auth.uid() = id or public.is_admin(auth.uid()));

drop policy if exists profiles_update_self_or_admin on public.profiles;
create policy profiles_update_self_or_admin on public.profiles
for update to authenticated
using (auth.uid() = id or public.is_admin(auth.uid()))
with check (auth.uid() = id or public.is_admin(auth.uid()));

drop policy if exists profiles_insert_self_or_admin on public.profiles;
create policy profiles_insert_self_or_admin on public.profiles
for insert to authenticated
with check (auth.uid() = id or public.is_admin(auth.uid()));

-- Events
drop policy if exists events_select_all_auth on public.events;
create policy events_select_all_auth on public.events
for select to authenticated
using (true);

drop policy if exists events_write_admin on public.events;
create policy events_write_admin on public.events
for all to authenticated
using (public.is_admin(auth.uid()))
with check (public.is_admin(auth.uid()));

-- Incidents
drop policy if exists incidents_select_all_auth on public.incidents;
create policy incidents_select_all_auth on public.incidents
for select to authenticated
using (true);

drop policy if exists incidents_insert_auth on public.incidents;
create policy incidents_insert_auth on public.incidents
for insert to authenticated
with check (created_by = auth.uid());

drop policy if exists incidents_update_creator_or_admin on public.incidents;
create policy incidents_update_creator_or_admin on public.incidents
for update to authenticated
using (created_by = auth.uid() or public.is_admin(auth.uid()))
with check (created_by = auth.uid() or public.is_admin(auth.uid()));

-- Machines
drop policy if exists machines_select_all_auth on public.machines;
create policy machines_select_all_auth on public.machines
for select to authenticated
using (true);

drop policy if exists machines_write_admin on public.machines;
create policy machines_write_admin on public.machines
for all to authenticated
using (public.is_admin(auth.uid()))
with check (public.is_admin(auth.uid()));

-- Integral activities
drop policy if exists integrals_select_all_auth on public.integral_activities;
create policy integrals_select_all_auth on public.integral_activities
for select to authenticated
using (true);

drop policy if exists integrals_write_admin on public.integral_activities;
create policy integrals_write_admin on public.integral_activities
for all to authenticated
using (public.is_admin(auth.uid()))
with check (public.is_admin(auth.uid()));

-- Integral signups
drop policy if exists signups_select_all_auth on public.integral_signups;
create policy signups_select_all_auth on public.integral_signups
for select to authenticated
using (true);

drop policy if exists signups_insert_self_or_admin on public.integral_signups;
create policy signups_insert_self_or_admin on public.integral_signups
for insert to authenticated
with check (employee_id = auth.uid() or public.is_admin(auth.uid()));

drop policy if exists signups_update_self_or_admin on public.integral_signups;
create policy signups_update_self_or_admin on public.integral_signups
for update to authenticated
using (employee_id = auth.uid() or public.is_admin(auth.uid()))
with check (employee_id = auth.uid() or public.is_admin(auth.uid()));

-- Chat
drop policy if exists chat_select_participant_or_admin on public.chat_messages;
create policy chat_select_participant_or_admin on public.chat_messages
for select to authenticated
using (
  sender_id = auth.uid()
  or recipient_id = auth.uid()
  or public.is_admin(auth.uid())
);

drop policy if exists chat_insert_sender_or_admin on public.chat_messages;
create policy chat_insert_sender_or_admin on public.chat_messages
for insert to authenticated
with check (
  sender_id = auth.uid()
  and (
    recipient_id <> auth.uid()
    or public.is_admin(auth.uid())
  )
);

drop policy if exists chat_update_recipient_or_admin on public.chat_messages;
create policy chat_update_recipient_or_admin on public.chat_messages
for update to authenticated
using (recipient_id = auth.uid() or public.is_admin(auth.uid()))
with check (recipient_id = auth.uid() or public.is_admin(auth.uid()));

-- Seed machinery units (idempotent)
insert into public.machines (code, name, status)
values
  ('fregadora-1', 'Fregadora industrial 1', 'operativa'),
  ('karcher-1', 'Kärcher alta presión 1', 'operativa'),
  ('karcher-2', 'Kärcher alta presión 2', 'operativa'),
  ('abrillantadora-1', 'Abrillantadora industrial 1', 'revision'),
  ('aspirador-1', 'Aspirador industrial 1', 'operativa'),
  ('aspirador-2', 'Aspirador industrial 2', 'operativa')
on conflict (code) do update
set
  name = excluded.name,
  status = excluded.status,
  updated_at = now();


