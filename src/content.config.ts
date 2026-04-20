import { defineCollection, z } from "astro:content";
import { glob } from "astro/loaders";

const pages = defineCollection({
  loader: glob({ pattern: "**/*.md", base: "./src/content/pages" }),
  schema: z.object({
    title: z.string(),
    pageTitle: z.string(),
    pageHeading: z.string(),
    intro: z.array(z.string()),
    sections: z.array(
      z.object({
        heading: z.string(),
        body: z.array(z.string()),
      }),
    ),
  }),
});

export const collections = { pages };
