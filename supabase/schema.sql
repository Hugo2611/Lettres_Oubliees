-- Run this in the Supabase SQL editor after creating a private project.
create table if not exists public.letters (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  title text not null,
  content text not null,
  written_at date,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  category text,
  recipient text,
  tags text[] not null default '{}',
  is_favorite boolean not null default false
);
create index if not exists letters_owner_date_idx on public.letters(user_id, written_at desc);
create index if not exists letters_owner_favorite_idx on public.letters(user_id, is_favorite) where is_favorite = true;
alter table public.letters enable row level security;
revoke all on public.letters from anon;
grant select, insert, update, delete on public.letters to authenticated;
drop policy if exists "Owners can read their letters" on public.letters;
drop policy if exists "Owners can create their letters" on public.letters;
drop policy if exists "Owners can update their letters" on public.letters;
drop policy if exists "Owners can delete their letters" on public.letters;
create policy "Owners can read their letters" on public.letters for select to authenticated using ((select auth.uid()) = user_id);
create policy "Owners can create their letters" on public.letters for insert to authenticated with check ((select auth.uid()) = user_id);
create policy "Owners can update their letters" on public.letters for update to authenticated using ((select auth.uid()) = user_id) with check ((select auth.uid()) = user_id);
create policy "Owners can delete their letters" on public.letters for delete to authenticated using ((select auth.uid()) = user_id);
