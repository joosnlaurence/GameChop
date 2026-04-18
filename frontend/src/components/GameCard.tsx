import { ActionIcon, Badge, Box, Button, Group, Image, Progress, Stack, Text } from "@mantine/core";
import { IconHeartFilled, IconShoppingCart } from "@tabler/icons-react";
import { useNavigate } from "react-router-dom";
import { useCart } from "../context/CartContext";
import type { Game } from "../types";


interface GameCardProps {
  game: Game;
  variant?: "store" | "library" | "wishlist";
  onRemoveFromWishlist?: (id: number) => void;
}

export default function GameCard({ game, variant, onRemoveFromWishlist }: GameCardProps) {
  const publishers = (game?.publishers ?? []).join(', ');
  const developers = (game?.developers ?? []).join(', ');
  const middot = publishers && developers ? ' · ' : '';
  const publisherDeveloper = `${publishers}${middot}${developers}`;

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
    onRemoveFromWishlist?.(game.game_id);
  };
  const cardContent = (
    <>
      <Box pos="relative">
        <Image
          bdrs="md"
          src={game.thumbnail}
          // fallbackSrc="https://placehold.co/600x900?text=No+Image"
          w="100%"
          bg='dark.8'
          style={{ aspectRatio: '3/4', objectFit: 'cover' }}
          alt={game.title}
        />
        {isWishlist && (
          <ActionIcon
            pos="absolute"
            top={8}
            right={8}
            radius="xl"
            size="lg"
            variant="filled"
            color="red"
            style={{ zIndex: 2 }}
            onClick={handleRemove}
          >
            <IconHeartFilled size={16} />
          </ActionIcon>
        )}
      </Box>
      <Stack gap={0} pt="0.75rem">
        <Text fw={600} fz="lg" c="dark.0" lineClamp={1}>
          {game.title}
        </Text>

        {variant === 'store' && game.genres 
          ? 
          <Group wrap='nowrap' gap='8'>
          {
            game.genres.slice(0, 2).map((genre) => 
              <Badge 
                component={Text} 
                tt='none' 
                c='dimmed' 
                fw='400'  
                bg='dark.7' 
                bdrs='6px'
                px='4px'
                style={{ cursor: 'pointer' }}
              >
                {genre}
              </Badge>
            )
          }
          </Group>
          : undefined
        }

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
      <Box
        w="100%"
        style={{ overflow: "visible", cursor: "pointer" }}
        onClick={() => navigate(`/browse/${game.game_id}`)}
      >
        {cardContent}
      </Box>
    );
  }

  return (
    <Box
      style={{ overflow: "hidden", cursor: 'pointer', textDecoration: "none" }}
      onClick={() => navigate(`/browse/${game.game_id}`)}
    >
      {cardContent}
    </Box>
  );
}
