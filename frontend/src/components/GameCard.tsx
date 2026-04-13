import { ActionIcon, Box, Button, Card, Group, Image, Progress, Stack, Text } from "@mantine/core";
import { IconHeartFilled, IconShoppingCart, IconX } from "@tabler/icons-react";
import { Link, useNavigate } from "react-router-dom";
import { useCart } from "../context/CartContext";

export interface Achievements {
  earned: number;
  total: number;
}

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
  achievements?: Achievements;
}

interface GameCardProps {
  game: Game;
  variant?: "store" | "library" | "wishlist";
  onRemoveFromWishlist?: (id: number) => void;
}

export default function GameCard({ game, variant = "store", onRemoveFromWishlist }: GameCardProps) {
  const publisherDeveloper =
    `${game.publisher ?? ''}${(game.developer && game.publisher) ? ' · ' : ''}${game.developer ?? ''}`;
  const navigate = useNavigate();
  const { addItem } = useCart();

  const isWishlist = variant === "wishlist";

  const handleAddToCart = (e: React.MouseEvent) => {
    e.stopPropagation();
    addItem({
      ...game,
      type: "Digital",
      price: game.price ?? 0,
    });
  };

  const handleRemove = (e: React.MouseEvent) => {
    e.stopPropagation();
    onRemoveFromWishlist?.(game.id);
  };

  const cardContent = (
    <>
      <Box pos="relative">
        <Image
          bdrs="md"
          src={game.image}
          w="100%"
          style={{ aspectRatio: '3/4', objectFit: 'cover' }}
          alt={game.title}
        />
        {isWishlist && (
          <>
            <ActionIcon
              pos="absolute"
              top={8}
              left={8}
              radius="xl"
              size="lg"
              variant="filled"
              color="dark.7"
              style={{ zIndex: 2 }}
              onClick={(e) => e.stopPropagation()}
            >
              <IconHeartFilled size={16} color="white" />
            </ActionIcon>
            <ActionIcon
              pos="absolute"
              top={8}
              right={8}
              radius="xl"
              size="lg"
              variant="filled"
              color="dark.7"
              style={{ zIndex: 2 }}
              onClick={handleRemove}
            >
              <IconX size={16} color="white" />
            </ActionIcon>
          </>
        )}
      </Box>
      <Stack gap={0} pt="0.75rem">
        <Text fw={600} fz="lg" c="dark.0" lineClamp={1}>
          {game.title}
        </Text>

        {variant === "library" && game.achievements ? (
          <Stack gap={4} mt={4}>
            <Group justify="space-between" gap={4}>
              <Text fw={500} fz="xs" c="dimmed">
                Achievements
              </Text>
              <Text fw={500} fz="xs" c="dimmed">
                {game.achievements.earned} of {game.achievements.total}
              </Text>
            </Group>
            <Progress
              value={(game.achievements.earned / game.achievements.total) * 100}
              color="violet"
              size="sm"
              radius="xl"
            />
          </Stack>
        ) : isWishlist ? (
          <>
            <Text fw={600} fz="md" c="violet" lh="1.5rem">
              ${game.price?.toFixed(2)}
            </Text>
            <Button
              fullWidth
              mt="xs"
              color="violet"
              leftSection={<IconShoppingCart size={16} />}
              onClick={handleAddToCart}
            >
              Add to Cart
            </Button>
          </>
        ) : (
          <>
            <Text fw={400} fz='xs' c='dimmed' truncate>
              {publisherDeveloper}
            </Text>
            <Text
              fw={400}
              fz="md"
              c={!game.inLibrary ? 'violet' : undefined}
              lh='1.5rem'
            >
              {game.inLibrary ? 'In Library' : `$${game.price}`}
            </Text>
          </>
        )}
      </Stack>
    </>
  );

  if (isWishlist) {
    return (
      <Card
        p={0}
        bg="transparent"
        radius={0}
        w="100%"
        style={{ overflow: "visible", cursor: "pointer" }}
        onClick={() => navigate(`/browse/${game.id}`)}
      >
        {cardContent}
      </Card>
    );
  }

  return (
    <Card
      component={Link}
      to={`/browse/${game.id}`}
      p={0}
      bg="transparent"
      radius={0}
      w="100%"
      style={{ overflow: "hidden", textDecoration: "none" }}
    >
      {cardContent}
    </Card>
  );
}
