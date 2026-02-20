(function () {
  if (!window.SUPABASE_CONFIG) {
    console.warn("SUPABASE_CONFIG missing. Create supabase-config.js from template.");
    return;
  }

  if (!window.supabase || !window.supabase.createClient) {
    console.warn("Supabase JS library missing.");
    return;
  }

  window.sb = window.supabase.createClient(
    window.SUPABASE_CONFIG.url,
    window.SUPABASE_CONFIG.anonKey,
    {
      auth: {
        persistSession: true,
        autoRefreshToken: true,
        detectSessionInUrl: true
      }
    }
  );
})();
