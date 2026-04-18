import {
  Box,
  Card,
  Container,
  Group,
  Image,
  SimpleGrid,
  Stack,
  Text,
  Title,
  UnstyledButton,
} from "@mantine/core";
import { Carousel } from "@mantine/carousel";
import {
  IconChevronLeft,
  IconChevronRight,
  IconSparkles,
  IconGridDots,
  IconTrophy,
  IconCompass,
  IconGhost3,
  IconSword,
  IconCrosshair,
  IconCar,
  IconRun,
  IconSwords,
  IconMap,
  IconEyeOff,
  IconFlame,
  IconPuzzle,
  IconSettings,
} from "@tabler/icons-react";
import { Link } from "react-router-dom";
import type { TablerIcon } from "@tabler/icons-react";
import GameCard from "../components/GameCard";
import { useQuery } from "@tanstack/react-query";
import type { FeaturedPublisher, GameListing, GetGameListingResult } from "../types";
import HomeSkeleton from "./skeletons/HomeSkeleton";

const genres: { name: string; image: string; icon: TablerIcon }[] = [
  { name: "Action",     image: "https://images.unsplash.com/photo-1563089145-599997674d42?auto=format&fit=crop&w=800&q=80", icon: IconSword      },
  { name: "Adventure",  image: "/images/adventure_bg.jpg",                                                                  icon: IconCompass    },
  { name: "RPG",        image: "/images/rpg_bg.jpg",                                                                        icon: IconSparkles   },
  { name: "FPS",        image: "https://images.unsplash.com/photo-1547394765-185e1e68f34e?auto=format&fit=crop&w=800&q=80", icon: IconCrosshair  },
  { name: "Sports",     image: "/images/sports_bg.jpg",                                                                     icon: IconTrophy     },
  { name: "Racing",     image: "https://images.unsplash.com/photo-1568605117036-5fe5e7bab0b7?auto=format&fit=crop&w=800&q=80", icon: IconCar      },
  { name: "Horror",     image: "/images/horror_bg.jpg",                                                                     icon: IconGhost3     },
  { name: "Platformer", image: "https://images.unsplash.com/photo-1551103782-8ab07afd45c1?auto=format&fit=crop&w=800&q=80", icon: IconRun        },
  { name: "Fighting",   image: "https://images.unsplash.com/photo-1555597673-b21d5c935865?auto=format&fit=crop&w=800&q=80", icon: IconSwords     },
  { name: "Strategy",   image: "/images/strategy_bg.jpg",                                                                   icon: IconGridDots   },
  { name: "Simulation", image: "https://images.unsplash.com/photo-1477959858617-67f85cf4f1df?auto=format&fit=crop&w=800&q=80", icon: IconSettings },
  { name: "Open World", image: "https://images.unsplash.com/photo-1506905925346-21bda4d32df4?auto=format&fit=crop&w=800&q=80", icon: IconMap      },
  { name: "Stealth",    image: "https://images.unsplash.com/photo-1509347528160-9a9e33742cdb?auto=format&fit=crop&w=800&q=80", icon: IconEyeOff   },
  { name: "Survival",   image: "https://images.unsplash.com/photo-1497436072909-60f360e1d4b1?auto=format&fit=crop&w=800&q=80", icon: IconFlame    },
  { name: "Puzzle",     image: "https://images.unsplash.com/photo-1611996575749-79a3a250f948?auto=format&fit=crop&w=800&q=80", icon: IconPuzzle   },
];

const arrowStyles = {
  width: 48,
  height: 48,
  borderRadius: "50%",
  backgroundColor: "var(--mantine-color-violet-filled)",
  border: "none",
  display: "flex",
  alignItems: "center",
  justifyContent: "center",
  boxShadow: "0 4px 6px -4px rgba(0, 0, 0, 0.1)",
  color: "white",
} as const;

function SectionHeader({ title, to = "/browse" }: { title: string; to?: string }) {
  return (
    <Group justify="space-between" mb="md">
      <Title order={2} fz={30}>
        {title}
      </Title>
      <UnstyledButton
        component={Link}
        to={to}
        style={{ display: "flex", alignItems: "center", gap: 4 }}
      >
        <Text fz="sm" c="violet">
          View All
        </Text>
        <IconChevronRight size={16} color="var(--mantine-color-violet-filled)" />
      </UnstyledButton>
    </Group>
  );
}

function GameCarousel({ games }: { games: GameListing[]}) {
  return (
    <Carousel
      slideSize={{ base: "50%", sm: "33%", md: '25%' }}
      slideGap="sm"
      previousControlIcon={<IconChevronLeft size={24} />}
      nextControlIcon={<IconChevronRight size={24} />}
      px='clamp(1rem, 5vw, 64px)'
      styles={{
        control: arrowStyles,
        controls: { left: -64, right: -64 },
      }}
      emblaOptions={{
        loop: true
      }}
    >
      {
        games 
        ?
        games.map((game) => 
          <Carousel.Slide key={game.game_id} miw={0}>
            <GameCard game={game}/>
          </Carousel.Slide>
        ) : undefined
      } 
    </Carousel>
  )
}

const NUM_HOME_PAGE_GAMES = 4;
const NUM_FEATURED_PUBLISHERS = 4;

export default function Home() {
  const {data: gamesData, isLoading: gamesIsLoading, error: gamesError} = useQuery({
    queryKey: ['game_listings'],
    queryFn: async (): Promise<GetGameListingResult> =>
      fetch(`http://localhost:3000/api/games`)
        .then(res => res.json())
  });
  const {data: publishersData, isLoading: pubsIsLoading, error: pubsError} = useQuery({
    queryKey: ['publishers'],
    queryFn: async (): Promise<FeaturedPublisher[]> =>
      fetch(`http://localhost:3000/api/publishers/featured`)
        .then(res => res.json()) 
  });

  if(gamesIsLoading || pubsIsLoading) {
    return <HomeSkeleton />
  }

  if(gamesError || pubsError) {
    console.error(gamesError ?? pubsError);
    return <Text>Some error occurred...</Text>
  }

  if(!gamesData) {
    return <Text>No games found?</Text>
  }

  if(!publishersData) {
    return <Text>No publishers found?</Text>
  }

  const newReleases = gamesData?.data.sort(
    (a, b) => new Date(b.release_date).getTime() - new Date(a.release_date).getTime()
  ).slice(0, NUM_HOME_PAGE_GAMES);

  // We don't really have a way of telling if a game is popular right now
  // This would probably invove some backend work

  // const popularGames = games?.sort(
  //   (a, b) => b.orders - a.orders
  // ).slice(0, NUM_NEW_RELEASES);

  const popularGames = gamesData?.data.slice(0, NUM_HOME_PAGE_GAMES);

  const featuredPublishers = publishersData?.sort(
    (a, b) => b.game_count - a.game_count
  ).slice(0, NUM_FEATURED_PUBLISHERS);

  return (
    <Container size="xl">
      <Stack gap={100}>
        {/* Browse by Genre */}
        <Box>
          <Title order={2} fz={36} ta="center" mb="xl">
            Browse by Genre
          </Title>
          <Carousel
            slideSize={{ base: "50%", sm: "33.333%", md: "20%" }}
            slideGap="sm"


            previousControlIcon={<IconChevronLeft size={24} />}
            nextControlIcon={<IconChevronRight size={24} />}
            styles={{
              control: arrowStyles,
              controls: { left: -64, right: -64 },
              root: { padding: "0 64px" },
            }}
          >
            {genres.map((genre) => (
              <Carousel.Slide key={genre.name}>
                <UnstyledButton
                  component={Link}
                  to={`/browse?genre=${encodeURIComponent(genre.name)}`}
                  w="100%"
                >
                  <Box pos="relative">
                    <Image
                      src={genre.image}
                      h={180}
                      radius="md"
                      alt={genre.name}
                      style={{ opacity: 0.5 }}
                    />
                    <Box
                      pos="absolute"
                      top={0}
                      left={0}
                      right={0}
                      bottom={0}
                      style={{
                        borderRadius: "var(--mantine-radius-md)",
                        display: "flex",
                        flexDirection: "column",
                        alignItems: "center",
                        justifyContent: "center",
                        gap: 8,
                      }}
                    >
                      <Box
                        style={{
                          width: 44,
                          height: 44,
                          borderRadius: "50%",
                          background: "rgba(255, 255, 255, 0.25)",
                          display: "flex",
                          alignItems: "center",
                          justifyContent: "center",
                        }}
                      >
                        <genre.icon size={22} stroke={1.5} color="white" />
                      </Box>
                      <Text
                        fw={600}
                        fz={18}
                        lh="28px"
                        ta="center"
                        style={{
                          borderRadius: 8,
                          background: "#fff",
                          color: "#8B5CF6",
                          width: 123,
                          height: 40,
                          display: "flex",
                          alignItems: "center",
                          justifyContent: "center",
                          letterSpacing: 0,
                        }}
                      >
                        {genre.name}
                      </Text>
                    </Box>
                  </Box>
                </UnstyledButton>
              </Carousel.Slide>
            ))}
          </Carousel>
        </Box>

        {/* New Releases */}
        <Box>
          <SectionHeader title="New Releases" to="/browse?sortBy=newest" />
          <GameCarousel games={newReleases}/>
        </Box>

        {/* Popular Games */}
        <Box>
          <SectionHeader title="Popular Games" />
          <GameCarousel games={popularGames}/>
        </Box>

        {/* Featured Publishers */}
        <Box>
          <SectionHeader title="Featured Publishers" />
          <SimpleGrid cols={{ base: 2, sm: 4 }} spacing="md">
            {featuredPublishers.map((pub) => (
              <Card
                key={pub.name}
                p={0}
                bg="dark.7"
                radius="md"
                style={{ overflow: "hidden" }}
              >
                <Image src={pub.logo} h={140} alt={pub.name} />
                <Text ta="center" fw={600} fz="sm" py="xs">
                  {pub.name}
                </Text>
              </Card>
            ))}
          </SimpleGrid>
        </Box>
      </Stack>
    </Container>
  );
}
