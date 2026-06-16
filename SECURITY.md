# Security Notes

## Browser hardening

The static pages include a Content Security Policy, Referrer Policy, Permissions Policy, URL validation for vehicle images, safer WhatsApp links, upload MIME checks, Supabase REST path allowlists, local admin login throttling, and client-side admin guards around write actions.

Because the project is currently a static frontend, inline scripts and inline event handlers still require `'unsafe-inline'` in the CSP. Moving JavaScript into external files and replacing inline handlers with `addEventListener` would allow a stricter nonce/hash-based CSP.

## Supabase hardening

The public Supabase anon key is expected to be visible in a browser app. Security must come from Row Level Security and server-side authorization, not from hiding the key or hashing a password in JavaScript.

Apply `supabase-security.sql` in the Supabase SQL editor to make `cars` and safe settings publicly readable while blocking anonymous writes. After that, admin mutations should move to an authenticated Supabase user flow, Edge Function, or backend endpoint.

Rate limiting and DoS protection must be enforced before the database receives traffic, for example with Supabase/Edge Function controls, API gateway rules, CDN/WAF limits, or backend middleware. The browser throttle only slows repeated attempts from the same browser profile and is not a security boundary.
