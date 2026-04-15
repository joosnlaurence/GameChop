import { useState } from "react";
import { Box, SimpleGrid, Tabs, Text, Title } from "@mantine/core";
import { type Game, type GetUserLibraryResult, DEFAULT_FILTERS, type GameFilters } from "../types";
import GameCard from "../components/GameCard";
import SearchFilters from "../components/SearchWidget";
import { keepPreviousData, useQuery } from "@tanstack/react-query";
import { useAuth } from "../context/AuthContext";

const LIBRARY_SORT_OPTIONS = [
  { value: "alpha",      label: "Alphabetical" },
  { value: "price_asc",  label: "Price: Low to High" },
  { value: "price_desc", label: "Price: High to Low" },
];

export default function MyLibrary() {
  const { user } = useAuth();
  const [activeTab, setActiveTab] = useState<string | null>("owned");
  const [filters, setFilters] = useState<GameFilters>(DEFAULT_FILTERS);

  const { data, isLoading, error } = useQuery({
    queryKey: ["library", user?.id, filters.search, filters.genre, filters.publisher, filters.developer, filters.sortBy],
    queryFn: async (): Promise<GetUserLibraryResult> => {
      const params = new URLSearchParams();
      if (filters.search)    params.set("search",    filters.search);
      if (filters.genre)     params.set("genre",     filters.genre);
      if (filters.publisher) params.set("publisher", filters.publisher);
      if (filters.developer) params.set("developer", filters.developer);
      if (filters.sortBy)    params.set("sortBy",    filters.sortBy);
      return fetch(`http://localhost:3000/api/users/${user!.id}/library?${params.toString()}`, {
        credentials: "include",
      }).then((res) => res.json());
    },
    enabled: !!user,
    placeholderData: keepPreviousData,
  });

  const ownedGames: Game[] = (data?.owned ?? []).map((g) => ({
    game_id: g.game_id,
    title: g.title,
    thumbnail: g.thumbnail,
    achievements: {
      earned: g.earned_achievements,
      total: g.total_achievements,
    },
  }));

  const [wishlist, setWishlist] = useState<Game[]>([]);

  const serverWishlist: Game[] = (data?.wishlisted ?? []).map((g) => ({
    game_id: g.game_id,
    title: g.title,
    thumbnail: g.thumbnail,
    price: g.price,
    wishlisted: true,
  }));

  const isWishlist = activeTab === "wishlist";
  const displayGames = isWishlist
    ? (wishlist.length > 0 ? wishlist : serverWishlist)
    : ownedGames;

  const handleRemoveFromWishlist = (id: number) => {
    const base = wishlist.length > 0 ? wishlist : serverWishlist;
    setWishlist(base.filter((g) => g.game_id !== id));
  };

  if (!user) {
    return <Text>Please log in to view your library.</Text>;
  }

  if (isLoading) {
    return <Text>Loading library...</Text>;
  }

  if (error) {
    return <Text>Failed to load library.</Text>;
  }

  return (
    <Box>
      <Title order={1} fz={36} mb="xl">
        My Library
      </Title>

      <Tabs value={activeTab} onChange={setActiveTab} mb="xl" color="violet">
        <Tabs.List>
          <Tabs.Tab value="owned" fw={600}>
            Owned Games
          </Tabs.Tab>
          <Tabs.Tab value="wishlist" fw={600}>
            Wishlist
          </Tabs.Tab>
        </Tabs.List>
      </Tabs>

      <SearchFilters
        filters={filters}
        onFiltersChange={setFilters}
        sortOptions={LIBRARY_SORT_OPTIONS}
        searchPlaceholder={isWishlist ? "Search your wishlist..." : "Search your library..."}
        debounceMs={400}
      />

      <Box mt="xl">
        <SimpleGrid cols={{ base: 2, sm: 3, md: 4 }} spacing="md">
          {displayGames.map((game) => (
            <GameCard
              key={game.game_id}
              game={game}
              variant={isWishlist ? "wishlist" : "library"}
              onRemoveFromWishlist={handleRemoveFromWishlist}
            />
          ))}
        </SimpleGrid>
        {displayGames.length === 0 && (
          <Text c="dimmed" ta="center" mt="xl">
            No games found.
          </Text>
        )}
      </Box>
    </Box>
  );
}
