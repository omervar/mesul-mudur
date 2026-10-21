-- Supabase SQL Editor'de bir defa çalıştırın. Bu tablo sadece oturum açmış sahibince okunur/yazılır.
create table if not exists public.mesul_mudur_workspaces (
  user_id uuid primary key references auth.users(id) on delete cascade,
  payload jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now()
);
alter table public.mesul_mudur_workspaces enable row level security;
revoke all on public.mesul_mudur_workspaces from anon;
grant select, insert, update on public.mesul_mudur_workspaces to authenticated;
drop policy if exists "owner_read" on public.mesul_mudur_workspaces;
drop policy if exists "owner_insert" on public.mesul_mudur_workspaces;
drop policy if exists "owner_update" on public.mesul_mudur_workspaces;
create policy "owner_read" on public.mesul_mudur_workspaces for select to authenticated using (user_id = (select auth.uid()));
create policy "owner_insert" on public.mesul_mudur_workspaces for insert to authenticated with check (user_id = (select auth.uid()));
create policy "owner_update" on public.mesul_mudur_workspaces for update to authenticated using (user_id = (select auth.uid())) with check (user_id = (select auth.uid()));