import { Group, Stack, Title } from "@mantine/core";
import GameCard from "../components/GameCard";
import { useCart, type CartItem } from "../context/CartContext";
import SelectStore from "../components/SelectStore";


const testGames: CartItem[] = 
[
  {
    id: 1,
    title: "Neon Legends",
    price: "$59.99",
    image: "https://images.unsplash.com/photo-1511512578047-dfb367046420?w=300&h=400&fit=crop",
    type: "Digital",
  },
  {
    id: 2,
    title: "Apex Warriors",
    price: "$49.99",
    image: "https://images.unsplash.com/photo-1612287230202-1ff1d85d1bdf?w=300&h=400&fit=crop",
    type: "Physical",
  },
  {
    id: 3,
    title: "Cyber Frontiers",
    price: "$39.99",
    image: "https://images.unsplash.com/photo-1511512578047-dfb367046420?w=300&h=400&fit=crop",
    type: "Digital",
  },
];

export default function Browse() {
  const { addItem } = useCart();
  return (
    <Stack px='101.5' pt='19.5'>
      <Group justify='space-between'>
        <Title order={1}>Browse Games</Title>
        <SelectStore />
      </Group>
      <div style = {{ display: "flex", gap: "1rem", flexWrap: "wrap"}}>
        {testGames.map((game) => 
          <GameCard game={game} width={220}/>  
        )}
      </div>
    </Stack>
  );
};