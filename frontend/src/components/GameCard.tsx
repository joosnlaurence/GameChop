import { Card, Image, Stack, Text } from "@mantine/core";
import { Link } from "react-router-dom";

export interface Game {
  id: number;
  title: string;
  price: string;
  image: string;
}

export default function GameCard({ game }: { game: Game }) {
  return (
    <Card
      component={Link}
      to={`/browse/${game.id}`}
      p={0}
      bg="transparent"
      radius={10}
      w={256}
      style={{ overflow: "hidden", textDecoration: "none" }}
    >
      <Image src={game.image} h={341} alt={game.title} />
      <Stack gap={4} p="sm">
        <Text fw={600} fz="sm" c="dark.0" lineClamp={1}>
          {game.title}
        </Text>
        <Text fw={700} fz="sm" c="violet">
          {game.price}
        </Text>
      </Stack>
    </Card>
  );
}
