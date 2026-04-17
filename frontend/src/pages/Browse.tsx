import { Group, SimpleGrid, Stack, Title, Text } from "@mantine/core";
import GameCard from "../components/GameCard";
import SelectStore from "../components/SelectStore";
import SearchFilters from "../components/SearchWidget";
import GenreSidebar from "../components/GenreSidebar";
import StickyBox from "react-sticky-box";
import { useEffect, useRef, useState } from "react";
import { keepPreviousData, useQuery } from "@tanstack/react-query";
import type { GetGameListingResult } from "../types";
import { DEFAULT_FILTERS, type GameFilters } from "../types";
import BrowseSkeleton from "./skeletons/BrowseSkeleton";

const GENRES = ['Action', 'Puzzle', 'RPG', 'FPS', 'Platformer', 'Puzzle', 'RPG', 'FPS', 'Platformer', 'Puzzle', 'RPG', 'FPS', 'Platformer', 'Puzzle', 'RPG', 'FPS', 'Platformer', 'Puzzle', 'RPG', 'FPS', 'Platformer']

export default function Browse() {
  const [filters, setFilters] = useState<GameFilters>(DEFAULT_FILTERS);

  const { data: gamesData, isLoading, error } = useQuery({
    queryKey: ['game_listings', filters.search, filters.genre, filters.publisher, filters.developer, filters.sortBy],
    queryFn: async (): Promise<GetGameListingResult> => {
      const params = new URLSearchParams();
      if (filters.search)    params.set('search',    filters.search);
      if (filters.genre)     params.set('genre',     filters.genre);
      if (filters.publisher) params.set('publisher', filters.publisher);
      if (filters.developer) params.set('developer', filters.developer);
      if (filters.sortBy)    params.set('sortBy',    filters.sortBy);
      return fetch(`http://localhost:3000/api/games?${params.toString()}`)
        .then(res => res.json());
    },
    placeholderData: keepPreviousData,
  });

  const [offset, setOffset] = useState(0);
  const rootRef = useRef<HTMLDivElement>(null);

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
          <SelectStore onSelectStore={function (store: Store): void {
            throw new Error("Function not implemented.");
          } } />
        </Group>
        <SearchFilters filters={filters} onFiltersChange={setFilters} />
      </Stack>
      <Group w='100%' align="flex-start">
        <StickyBox style={{flex: '1'}} offsetTop={offset}>
          <GenreSidebar
            genres={GENRES}
            selected={filters.genre ? [filters.genre] : []}
            onToggle={(genre) =>
              setFilters((f) => ({ ...f, genre: f.genre === genre ? null : genre }))
            }
          />
        </StickyBox>
        {
          gamesData
          ?
          <SimpleGrid flex='4' cols={{ base: 1, sm: 2, md: 3, lg: 4 }}>
            {gamesData?.data.map((game) =>
              <GameCard key={game.game_id} game={game} variant='store'/>
            )}
          </SimpleGrid>
          :
          <Text>No games found...</Text>
        }
      </Group>
    </Stack>
  );
};
