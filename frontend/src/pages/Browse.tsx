import { Group, SimpleGrid, Stack, Title, Text } from "@mantine/core";
import GameCard from "../components/GameCard";
import { useCart, type CartItem } from "../context/CartContext";
import SelectStore from "../components/SelectStore";
import SearchFilters from "../components/SearchWidget";
import GenreSidebar from "../components/GenreSidebar";
import StickyBox from "react-sticky-box";
import { useEffect, useRef, useState } from "react";
import { useQuery } from "@tanstack/react-query";
import type { GetGameListingResult } from "../types";
import BrowseSkeleton from "./skeletons/BrowseSkeleton";

const GENRES = ['Action', 'Puzzle', 'RPG', 'FPS', 'Platformer', 'Puzzle', 'RPG', 'FPS', 'Platformer', 'Puzzle', 'RPG', 'FPS', 'Platformer', 'Puzzle', 'RPG', 'FPS', 'Platformer', 'Puzzle', 'RPG', 'FPS', 'Platformer']

export default function Browse() {
  const {data: games, isLoading, error} = useQuery({
    queryKey: ['game_listings'],
    queryFn: async (): Promise<GetGameListingResult[]> =>
      fetch(`http://localhost:3000/api/games`)
        .then(res => res.json())
  });
  
  const [offset, setOffset] = useState(0);
  const rootRef = useRef<HTMLDivElement>(null);
  const { addItem } = useCart();
  
  useEffect(() => {
    const root = rootRef.current;
    if(!root) return;

    setOffset(root.getBoundingClientRect().top + window.scrollY);
  }, []);

  if(isLoading) {
    return <BrowseSkeleton />;
  }

  if(error) {
    console.error(error);
    return <Text>Some unknown error occurred...</Text>
  }

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
          {<GenreSidebar 
            genres={GENRES}
          />}
        </StickyBox>
        {
          games 
          ?
          <SimpleGrid flex='4' cols={{ base: 1, sm: 2, md: 3, lg: 4 }}>
            {games.map((game) => 
              <GameCard game={game} variant='store'/>  
            )}
          </SimpleGrid>
          :
          <Text>No games found...</Text>
        }
      </Group>
    </Stack>
  );
};