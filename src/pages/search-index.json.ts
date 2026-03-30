import { getCollection } from 'astro:content';

const posts = await getCollection('posts');
const searchIndex = posts.map(post => ({
  id: post.id.replace(/\.md$/, ''),
  title: post.data.title,
  description: post.data.description || '',
}));

export async function GET() {
  return new Response(JSON.stringify(searchIndex), {
    headers: { 'Content-Type': 'application/json' },
  });
}
