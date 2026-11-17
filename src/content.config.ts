import { defineCollection, z } from "astro:content";
import { glob } from "astro/loaders";

const blog = defineCollection({
  loader: glob({
    pattern: "**/*.md",
    base: "./src/content/blog",
    generateId: ({ entry }) =>
      entry.replace(/\/index\.md$/, "").replace(/\.md$/, ""),
  }),
  schema: ({ image }) =>
    z.object({
      title: z.string(),
      summary: z.string().optional(),
      date: z.coerce.date(),
      image: image().optional(),
      imageAlt: z.string().optional(),
      // Previous post id(s) (old folder names) that should redirect to this post.
      redirectFrom: z
        .union([z.string(), z.array(z.string())])
        .optional()
        .transform((v) => (v === undefined ? [] : [v].flat())),
    }),
});

export const collections = { blog };
