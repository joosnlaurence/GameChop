import { Card, Image, Stack, Text } from "@mantine/core";
import { Link } from "react-router-dom";

export interface Game {
  id: number;
  title: string;
  price?: number;
  image: string;
  publisher?: string;
  developer?: string;
  genres?: string[];
  wishlisted?: boolean;
  inLibrary?: boolean;
}

export default function GameCard({ game }: { game: Game}) {
  /*game.wishlisted = true;
  game.publisher = 'Jason';
  game.developer = 'Laureano';*/
  const publisherDeveloper = 
    `${game.publisher ?? ''}${(game.developer && game.publisher) ? ' · ' : ''}${game.developer ?? ''}`;
  
  return (
    <Card
      component={Link}
      to={`/browse/${game.id}`}
      p={0}
      bg="transparent"
      radius={0}
      w='100%'
      style={{ overflow: "hidden", textDecoration: "none" }}
    >
      <Image 
        bdrs='md' 
        src={game.image} 
        w='100%'
        style={{ aspectRatio: '3/4', objectFit: 'cover' }}
        alt={game.title} 
      />
      <Stack gap={0} pt="0.75rem">
        <Text fw={600} fz="lg" c="dark.0" lineClamp={1}>
          {game.title}
        </Text>
        {
          <Text fw={400} fz='xs' c='dimmed' truncate>
            {publisherDeveloper}
          </Text>
        }
        <Text 
          fw={400} 
          fz="md" 
          c={!game.inLibrary ? 'violet' : undefined} 
          lh='1.5rem'
        >
          {game.inLibrary ? 'In Library' : `$${game.price}`}
        </Text>
      </Stack>
    </Card>
  );
}
