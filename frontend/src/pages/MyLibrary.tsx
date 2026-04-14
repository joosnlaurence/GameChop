import { useState } from "react";
import {
  Box,
  Container,
  Group,
  Select,
  SimpleGrid,
  Tabs,
  TextInput,
  Title,
} from "@mantine/core";
import { IconSearch } from "@tabler/icons-react";
import { type Game } from "../types";
import GameCard from "../components/GameCard";

const ownedGames: Game[] = [
  { id: 1, title: "Neon Legends", image: "https://images.unsplash.com/photo-1542751371-adc38448a05e?w=300&h=400&fit=crop", achievements: { earned: 12, total: 20 } },
  { id: 2, title: "Warzones Elite", image: "https://images.unsplash.com/photo-1538481199705-c710c4e965fc?w=300&h=400&fit=crop", achievements: { earned: 18, total: 25 } },
  { id: 3, title: "Cyber Phantom", image: "https://images.unsplash.com/photo-1511512578047-dfb367046420?w=300&h=400&fit=crop", achievements: { earned: 5, total: 20 } },
  { id: 4, title: "Shadow Realm", image: "https://images.unsplash.com/photo-1493711662062-fa541adb3fc8?w=300&h=400&fit=crop", achievements: { earned: 22, total: 22 } },
  { id: 5, title: "Velocity Shift", image: "https://images.unsplash.com/photo-1550745165-9bc0b252726f?w=300&h=400&fit=crop", achievements: { earned: 8, total: 30 } },
  { id: 6, title: "Infinite Quest", image: "https://images.unsplash.com/photo-1612287230202-1ff1d85d1bdf?w=300&h=400&fit=crop", achievements: { earned: 14, total: 18 } },
  { id: 7, title: "Dark Legacy", image: "https://images.unsplash.com/photo-1542751371-adc38448a05e?w=300&h=400&fit=crop", achievements: { earned: 3, total: 15 } },
  { id: 8, title: "Cosmic Wars", image: "https://images.unsplash.com/photo-1538481199705-c710c4e965fc?w=300&h=400&fit=crop", achievements: { earned: 0, total: 35 } },
];

const initialWishlist: Game[] = [
  { id: 101, title: "Apex Warriors", price: 44.99, image: "https://images.unsplash.com/photo-1550745165-9bc0b252726f?w=300&h=400&fit=crop", wishlisted: true },
  { id: 102, title: "Mystic Realms", price: 49.99, image: "https://images.unsplash.com/photo-1511512578047-dfb367046420?w=300&h=400&fit=crop", wishlisted: true },
  { id: 103, title: "Galactic Conquest", price: 59.99, image: "https://images.unsplash.com/photo-1493711662062-fa541adb3fc8?w=300&h=400&fit=crop", wishlisted: true },
  { id: 104, title: "Urban Legends", price: 54.99, image: "https://images.unsplash.com/photo-1542751371-adc38448a05e?w=300&h=400&fit=crop", wishlisted: true },
];

export default function MyLibrary() {
  const [search, setSearch] = useState("");
  const [activeTab, setActiveTab] = useState<string | null>("owned");
  const [wishlist, setWishlist] = useState<Game[]>(initialWishlist);

  const isWishlist = activeTab === "wishlist";
  const sourceGames = isWishlist ? wishlist : ownedGames;

  const filteredGames = sourceGames.filter((game) =>
    game.title.toLowerCase().includes(search.toLowerCase())
  );

  const handleRemoveFromWishlist = (id: number) => {
    setWishlist((prev) => prev.filter((g) => g.id !== id));
  };

  return (
    <Container size="xl" pt="xl" pb={120} px="clamp(1rem, 5vw, 77.5px)">
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

      <TextInput
        placeholder={isWishlist ? "Search your wishlist..." : "Search your library..."}
        leftSection={<IconSearch size={16} />}
        value={search}
        onChange={(e) => setSearch(e.currentTarget.value)}
        mb="lg"
      />

      <Group mb="xl" gap="sm">
        <Select
          placeholder="Genre"
          data={["Action", "RPG", "Strategy", "Sports", "Horror", "Adventure"]}
          w={180}
        />
        <Select
          placeholder="Publisher"
          data={["Activision", "EA Games", "Ubisoft", "Valve"]}
          w={180}
        />
        <Select
          placeholder="Developer"
          data={["Studio A", "Studio B", "Studio C", "Studio D"]}
          w={180}
        />
        <Box style={{ flex: 1 }} />
        <Select
          placeholder="Sort by: Recently Purchased"
          data={["Recently Purchased", "Alphabetical", "Most Played", "Price"]}
          defaultValue="Recently Purchased"
          w={250}
        />
      </Group>

      <SimpleGrid cols={{ base: 2, sm: 3, md: 4 }} spacing="md">
        {filteredGames.map((game) => (
          <GameCard
            key={game.id}
            game={game}
            variant={isWishlist ? "wishlist" : "library"}
            onRemoveFromWishlist={handleRemoveFromWishlist}
          />
        ))}
      </SimpleGrid>
    </Container>
  );
}
