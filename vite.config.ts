import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'

// Use VITE_BASE para definir dinamicamente a base antes do build.
// Por exemplo: VITE_BASE=/pemautomation-website/ pnpm run build
export default defineConfig(() => ({
  base: process.env.VITE_BASE || '/pemautomation-website/',
  plugins: [react()],
}))