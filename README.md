# Storyblok TypeScript Types Generator

Automatically generate TypeScript types from your Storyblok components schema. This ensures type safety and improved DX when working with **Storyblok** data in your TypeScript-based applications.

## 🚀 Features

- **Automated Type Generation:** Pulls Storyblok components and converts them into TypeScript types.
- **Run on Save (Bonus!):** If you have the `emeraldwalk.runonsave` VS Code extension installed, modifying any `.json` file inside the `__storyblok__` directory will trigger the script automatically.

## 📦 Installation

Ensure you have **Node v.20+** installed.

```sh
npm i
```

# 🔧 Setup

1. Log in to **Storyblok CLI**:

   ```sh
   npx storyblok login
   ```

2. Create a `.env.local` file in the root directory and add your **Storyblok Space ID**:

   ```sh
   STORYBLOK_SPACE_ID=your_space_id_here
   ```

## ⚡ Usage

To manually generate TypeScript types, run:

```sh
npm run storyblok:types
```

This will:

- Pull components from **Storyblok** and save them to `__storyblok__/components.schema.json`
- Generate TypeScript types in `types/storyblok.d.ts`

## 🏗 Automating with Run On Save

If you have the `emeraldwalk.runonsave` VS Code extension installed, your types will be regenerated automatically whenever you save any `.json` file inside `__storyblok__/` directory.

## 📜 License

MIT License. Free to use and modify! See [LICENSE.md](./LICENSE.md) for details.
