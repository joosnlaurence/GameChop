import { Group, SimpleGrid, Stack, Title, Text, Pagination } from "@mantine/core";
import GameCard from "../components/GameCard";
import SelectStore from "../components/SelectStore";
import SearchFilters from "../components/SearchWidget";
import GenreSidebar from "../components/GenreSidebar";
import { useState } from "react";
import { useSearchParams } from "react-router-dom";
import { keepPreviousData, useQuery } from "@tanstack/react-query";
import type { GetGameFiltersResult, GetGameListingResult } from "../types";
import { DEFAULT_FILTERS, type GameFilters } from "../types";
import BrowseSkeleton from "./skeletons/BrowseSkeleton";
import { useCart } from "../context/CartContext";

export default function Browse() {
  const [searchParams] = useSearchParams();
  const [filters, setFilters] = useState<GameFilters>({
    ...DEFAULT_FILTERS,
    genre:  searchParams.get("genre")  ?? DEFAULT_FILTERS.genre,
    sortBy: searchParams.get("sortBy") ?? DEFAULT_FILTERS.sortBy,
  });
  const [page, setPage] = useState(1);
    useCart();

  const { data: gamesData, isLoading, error } = useQuery({
    queryKey: ['game_listings', filters.search, filters.genre, filters.publisher, filters.developer, filters.sortBy, page],
    queryFn: async (): Promise<GetGameListingResult> => {
      const params = new URLSearchParams();
      if (filters.search)    params.set('search',    filters.search);
      if (filters.genre)     params.set('genre',     filters.genre);
      if (filters.publisher) params.set('publisher', filters.publisher);
      if (filters.developer) params.set('developer', filters.developer);
      if (filters.sortBy)    params.set('sortBy',    filters.sortBy);
      params.append('page', page.toString());
      params.append('limit', '12');
      return fetch(`http://localhost:3000/api/games?${params.toString()}`)
        .then(res => res.json());
    },
    placeholderData: keepPreviousData,
  });

  const { data: filterOptions, isLoading: filtersLoading } = useQuery<GetGameFiltersResult>({
    queryKey: ['genres'],
    queryFn: async () => 
      fetch(`http://localhost:3000/api/games/filters`)
        .then(res => res.json()),
    staleTime: Infinity
  });

  if(isLoading || filtersLoading) {
    return <BrowseSkeleton />;
  }

  if(error) {
    console.error(error);
    return <Text>Some unknown error occurred...</Text>
  }

  const handleFiltersChange = (newFilters: GameFilters) => {
    const isEmpty = JSON.stringify(newFilters) === JSON.stringify(DEFAULT_FILTERS);
    if (!isEmpty) setPage(1);
    setFilters(newFilters);
  }

  return (
    <Stack gap='32px'>
      <Stack gap='24px'>
        <Group justify='space-between'>
          <Title order={1}>Browse Games</Title>
          <SelectStore onSelectStore={() => {}} />
        </Group>
        <SearchFilters filterOptions={filterOptions} filters={filters} onFiltersChange={handleFiltersChange} />
      </Stack>
      <Group w='100%' align="flex-start">
        <GenreSidebar
          genres={filterOptions?.genres ?? []}
          selected={filters.genre}
          onToggle={(genre) =>
            handleFiltersChange({ ...filters, genre: filters.genre === genre ? null : genre })
          }
          flex='1'
          display={{ base: 'none', sm: 'block', md: 'block' }}
        />
        <Stack flex='4' align='center'>
        {
          gamesData
          ?
          <>
          <SimpleGrid cols={{ base: 2, sm: 3, md: 3, lg: 4 }}>
            {gamesData?.data.map((game) =>
              <GameCard key={game.game_id} game={game} variant='store'/>
            )}
          </SimpleGrid>
          <Pagination total={gamesData?.pagination.totalPages ?? 1} value={page} onChange={setPage} size='lg' />
          </>
          :
          <Text>No games found...</Text>
        }
        </Stack>
      </Group>
    </Stack>
  );
};
