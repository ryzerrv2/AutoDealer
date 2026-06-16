-- Hardening consigliato per il progetto Supabase.
-- Applicare dallo SQL editor Supabase dopo aver verificato i nomi reali delle tabelle.
-- Nota: un'app statica non puo' proteggere operazioni admin solo con JavaScript.

alter table public.cars enable row level security;
alter table public.settings enable row level security;

drop policy if exists "cars_public_read" on public.cars;
create policy "cars_public_read"
	on public.cars
	for select
	to anon
	using (true);

drop policy if exists "cars_no_public_insert" on public.cars;
create policy "cars_no_public_insert"
	on public.cars
	for insert
	to anon
	with check (false);

drop policy if exists "cars_no_public_update" on public.cars;
create policy "cars_no_public_update"
	on public.cars
	for update
	to anon
	using (false)
	with check (false);

drop policy if exists "cars_no_public_delete" on public.cars;
create policy "cars_no_public_delete"
	on public.cars
	for delete
	to anon
	using (false);

drop policy if exists "settings_public_read_safe_keys" on public.settings;
create policy "settings_public_read_safe_keys"
	on public.settings
	for select
	to anon
	using (key in ('waNumber', 'name', 'address'));

drop policy if exists "settings_no_public_insert" on public.settings;
create policy "settings_no_public_insert"
	on public.settings
	for insert
	to anon
	with check (false);

drop policy if exists "settings_no_public_update" on public.settings;
create policy "settings_no_public_update"
	on public.settings
	for update
	to anon
	using (false)
	with check (false);

drop policy if exists "settings_no_public_delete" on public.settings;
create policy "settings_no_public_delete"
	on public.settings
	for delete
	to anon
	using (false);
