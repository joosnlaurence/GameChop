import { Group, SimpleGrid, Stack, Title } from "@mantine/core";
import GameCard from "../components/GameCard";
import { useCart, type CartItem } from "../context/CartContext";
import SelectStore from "../components/SelectStore";
import SearchFilters from "../components/SearchWidget";
import GenreSidebar from "../components/GenreSidebar";
import StickyBox from "react-sticky-box";
import { useEffect, useRef, useState } from "react";

const testGames: CartItem[] = 
[
  {
    id: 1,
    title: "Neon Legends",
    price: 59.99,
    image: "https://images.unsplash.com/photo-1511512578047-dfb367046420?w=300&h=400&fit=crop",
    type: "Digital",
  },
  {
    id: 2,
    title: "Apex Warriors",
    price: 49.99,
    image: "https://images.unsplash.com/photo-1612287230202-1ff1d85d1bdf?w=300&h=400&fit=crop",
    type: "Physical",
  },
  {
    id: 3,
    title: "Cyber Frontiers",
    price: 39.99,
    image: "https://images.unsplash.com/photo-1511512578047-dfb367046420?w=300&h=400&fit=crop",
    type: "Digital",
  },
  {
    id: 4,
    title: "Cyber Frontiers",
    price: 39.99,
    image: "https://images.unsplash.com/photo-1511512578047-dfb367046420?w=300&h=400&fit=crop",
    type: "Digital",
  },
  {
    id: 5,
    title: "Cyber Frontiers",
    price: 39.99,
    image: "https://images.unsplash.com/photo-1511512578047-dfb367046420?w=300&h=400&fit=crop",
    type: "Digital",
  },
];

const GENRES = ['Action', 'Puzzle', 'RPG', 'FPS', 'Platformer', 'Puzzle', 'RPG', 'FPS', 'Platformer', 'Puzzle', 'RPG', 'FPS', 'Platformer', 'Puzzle', 'RPG', 'FPS', 'Platformer', 'Puzzle', 'RPG', 'FPS', 'Platformer']

export default function Browse() {
  const [offset, setOffset] = useState(0);
  const rootRef = useRef<HTMLDivElement>(null);
  const { addItem } = useCart();
  
  useEffect(() => {
    const root = rootRef.current;
    if(!root) return;

    setOffset(root.getBoundingClientRect().top + window.scrollY);
  }, []);

  console.log(offset);
  return (
    <Stack gap='32px' ref={rootRef}>
      <Stack gap='24px'>
        <Group justify='space-between'>
          <Title order={1}>Browse Games</Title>
          <SelectStore />
        </Group>
        <SearchFilters />
      </Stack>
      <Group w='100%' align="flex-start">
        <StickyBox style={{flex: '1'}} offsetTop={offset}>
          <GenreSidebar 
            genres={GENRES}
          />
        </StickyBox>
        <SimpleGrid flex='4' cols={{ base: 1, sm: 2, md: 3, lg: 4 }}>
          {testGames.map((game) => 
            <GameCard game={game}/>  
          )}
        </SimpleGrid>
      </Group>
    </Stack>
  );
};