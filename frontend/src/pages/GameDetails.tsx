import { Group, Stack, Image, Title, Text, Badge, Button, ActionIcon, ScrollArea, Box, Card, SimpleGrid, SegmentedControl, Progress, HoverCard, UnstyledButton } from '@mantine/core';
import { useParams } from 'react-router-dom';
import type { GetGameDetailsResult, Hardware } from '../types';
import { IconAwardFilled, IconHeart, IconHeartFilled, IconLock, IconShoppingCart } from '@tabler/icons-react';
import { useState } from 'react';
import SelectStore from '../components/SelectStore';
import { useCart } from '../context/CartContext';
import { useAuth } from '../context/AuthContext';
import { useQuery, useQueryClient } from '@tanstack/react-query';
import GameDetailsSkeleton from './skeletons/GameDetailsSkeleton';

const parseDate = (dateStr: string) => {
  const date = new Date(dateStr);
  const year = date.getFullYear();
  const month = date.toLocaleString('en-US', { month: 'long' });
  const day = date.getDate();
  return `${month} ${day}, ${year}`
};

function Hardware({ hardware }: { hardware: Hardware}) {
  return (
    <Stack gap='0.75rem'>
      <Box>
        <Text c='dimmed' fz='sm'>OS:</Text>
        <Text fz='sm'>{hardware.os}</Text>
      </Box>
      <Box>
        <Text c='dimmed' fz='sm'>Proessor:</Text>
        <Text fz='sm'>{hardware.cpu}</Text>
      </Box>
      <Box>
        <Text c='dimmed' fz='sm'>Memory:</Text>
        <Text fz='sm'>{hardware.mem}</Text>
      </Box>
      <Box>
        <Text c='dimmed' fz='sm'>Graphics:</Text>
        <Text fz='sm'>{hardware.gpu}</Text>
      </Box>
      <Box>
        <Text c='dimmed' fz='sm'>Storage:</Text>
        <Text fz='sm'>{hardware.storage}</Text>
      </Box>
    </Stack>
  )
}

export interface Preview {
  preview_id: number;
  url: string;
}

export default function GameDetails() {
  const { gameId } = useParams();
  
  const { data: gameDetails, isLoading, error } = useQuery({
    queryKey: ['game_details', gameId],
    queryFn: async (): Promise<GetGameDetailsResult> => 
      await fetch(`http://localhost:3000/api/games/${gameId}`)
        .then(res => res.json())
  });

  const [orderType, setOrderType] = useState('digital');
  const [selectedPreview, setSelectedPreview] = useState<Preview | null>(null);
  const [, setSelectedStore] = useState<{ id: number; address: string; city: string; state: string; open_hour: string; close_hour: string; google_map_url: string } | null>(null);
  const [wishlistLoading, setWishlistLoading] = useState(false);

  const { addItem } = useCart();
  const { user } = useAuth();
  const queryClient = useQueryClient();

  const { data: libraryData } = useQuery({
    queryKey: ['user_library', user?.id],
    queryFn: async () =>
      fetch(`http://localhost:3000/api/users/${user!.id}/library`, {
        credentials: 'include',
      }).then((r) => r.json()),
    enabled: !!user,
  });

  const isWishlisted: boolean = !!libraryData?.wishlisted?.some(
    (g: { game_id: number }) => g.game_id === Number(gameId)
  );

  const isOwned: boolean = !!libraryData?.owned?.some(
    (g: { game_id: number }) => g.game_id === Number(gameId)
  );


  if (isLoading) {
    return <GameDetailsSkeleton />
  }
  
  if (error) {
    console.error(error);
    return <Text>Something went wrong...</Text>
  }

  if (!gameDetails) {
    return <Text>404 Game not found...</Text>
  }

  if(!selectedPreview && gameDetails.previews.length > 0) {
    setSelectedPreview(gameDetails.previews[0]);
  }

  const publishers = gameDetails.publishers.join(', ');
  const developers = gameDetails.developers.join(', ');
  const pubDevMiddot = publishers && developers ? ' · ' : '';
  const dateMiddot = publishers || developers ? ' · ' : '';
  
  const release = parseDate(gameDetails.release_date);
  const subtitle = `${publishers}${pubDevMiddot}${developers}${dateMiddot}${release}`;

  const numAchieved = gameDetails.achievements.reduce((sum: number, a) => sum += a.achieved ? 1 : 0, 0 );

  const handleAddToCart = () => {
    addItem({
      game_id: gameDetails.game_id,
      title: gameDetails.title,
      thumbnail: gameDetails.thumbnail,
      price: gameDetails.price,
      type: orderType === 'physical' ? 'Physical' : 'Digital'
    })
  }

  const handleWishlist = async () => {
    if (!user || wishlistLoading) return;
    setWishlistLoading(true);
    try {
      if (isWishlisted) {
        await fetch(`http://localhost:3000/api/users/${user.id}/wishlist/${gameDetails.game_id}`, {
          method: 'DELETE',
          credentials: 'include',
        });
      } else {
        await fetch(`http://localhost:3000/api/users/${user.id}/wishlist`, {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          credentials: 'include',
          body: JSON.stringify({ gameId: gameDetails.game_id }),
        });
      }
      queryClient.invalidateQueries({ queryKey: ['user_library', user.id] });
    } finally {
      setWishlistLoading(false);
    }
  }


  return (
    <Stack gap='48'>
      <Group justify='space-between' mb='32'  wrap='nowrap' align='stretch'> 
        <Group gap='24' wrap='nowrap' flex='1'>
          <Image
            bd='2px solid dark.5'
            bdrs="md"
            src={gameDetails.thumbnail}
            maw={192}
            style={{ aspectRatio: '3/4', objectFit: 'cover' }}
            alt={gameDetails.title}
          />
          <Stack>
            <Title order={1} size='3rem' fw='600'>{gameDetails.title}</Title>
            <Text c='dimmed'>{subtitle}</Text>
            <Group gap='0.5rem'>
              {
                gameDetails.genres.map((genre) => 
                  <Badge
                    key={genre}
                    tt='none'
                    bg='dark.7'
                    bd='1px solid dark.5'
                    bdrs='10px'
                    size='xl'
                    fw='400'
                  >
                    {genre}
                  </Badge>
                )
              }
            </Group>
            <Group gap='1rem'>
              <Text
                c='violet'
                fz='2.25rem'
                fw='400'
                lh='2.5rem'
              >
                ${gameDetails.price}
              </Text>
              <Button
                onClick = {handleAddToCart}
                leftSection={<IconShoppingCart stroke='1.5'/>}
                size='md'
                p='0px 32px'
              >
                Add to Cart
              </Button>
              {isOwned
                ? <Badge size='lg' color='violet' variant='light' radius='md'>Owned</Badge>
                : (
                  <ActionIcon
                    size='42'
                    color={isWishlisted ? 'red' : 'dark.7'}
                    bd='1px solid dark.5'
                    onClick={handleWishlist}
                    loading={wishlistLoading}
                    disabled={!user}
                  >
                    {isWishlisted
                      ? <IconHeartFilled size='24' />
                      : <IconHeart size='24' stroke='1.5' />}
                  </ActionIcon>
                )
              }
            </Group>
          </Stack>
        </Group>
        <Image
          src={selectedPreview?.url ?? ''}
          w='100%'
          maw={450}
          mah={256}
          bdrs='10px'
          style={{ aspectRatio: '16/9', objectFit: 'cover' }}
          alt={`${gameDetails.title} Preview Image ${selectedPreview?.preview_id ?? ''}`}
        />
      </Group>
      
        <ScrollArea 
          offsetScrollbars
          type='always'
          scrollbarSize='16'
          scrollbars='x'
          styles={{
            // scrollbar : {
            //   backgroundColor: 'var(--mantine-color-dark-8)',
            //   borderRadius: '100px'
            // },
            thumb: {
              backgroundColor: 'var(--mantine-color-dark-5)'
            }
          }}
        >
        {/* <Scroller controlSize='48'> */}
          <Group wrap='nowrap'>
            {
              gameDetails.previews.map((preview, i) => 
                <UnstyledButton
                  onClick={() => setSelectedPreview(preview)}
                >
                  <Image
                    key={preview.preview_id}
                    src={preview.url}
                    draggable={false}
                    w='186'
                    bdrs='10px'
                    bd={preview.preview_id === selectedPreview?.preview_id ?'2px solid violet' : undefined}
                    style={{ aspectRatio: '5/3', objectFit: 'cover' }}
                    alt={`${gameDetails.title} Preview Image ${i+1}`}
                  />
                </UnstyledButton>
              )
            }
          </Group>
        {/* </Scroller> */}
        </ScrollArea>
      
      <Group gap='32' align='flex-start'>
        <Stack gap='32' flex='2'>
          <Card p='25'>
            <Title order={2} fw='600' fz='1.5rem' lh='2rem' pb='1rem'>
              Summary
            </Title>
            <Text c='dimmed'>
              {gameDetails.summary}
            </Text>
          </Card>
          <Card p='25'>
            <Title order={2} fw='600' fz='1.5rem' lh='2rem' pb='1rem'>
              System Requirements
            </Title>
            <SimpleGrid cols={2}>
              <Stack gap='1rem'>
                <Text fz='lg' fw='600' lh='xl'>Minimum</Text>
                <Hardware hardware={gameDetails.requirements.minimum}/>
              </Stack>
              <Stack gap='1rem'>
                <Text fz='lg' fw='600' lh='xl' c='violet'>Recommended</Text>
                <Hardware hardware={gameDetails.requirements.recommended}/>
              </Stack>
            </SimpleGrid>
          </Card>
        </Stack>
        <Stack gap='32' flex='1'>
          <Card p='25'>
            <Title order={2} fw='600' fz='1.25rem' lh='1.75rem' pb='1rem'>
              Details
            </Title>
            <Stack gap='0.75rem'>
              <Box>
                <Text c='dimmed' fz='sm'>Publisher{gameDetails.publishers.length > 1 && 's'}:</Text>
                <Text fz='sm'>{gameDetails.publishers.join(', ')}</Text>
              </Box>
              <Box>
                <Text c='dimmed' fz='sm'>Developer{gameDetails.developers.length > 1 && 's'}:</Text>
                <Text fz='sm'>{gameDetails.developers.join(', ')}</Text>
              </Box>
              <Box>
                <Text c='dimmed' fz='sm'>Release Date:</Text>
                <Text fz='sm'>{release}</Text>
              </Box>
              <Box>
                <Text c='dimmed' fz='sm'>Genres:</Text>
                <Text fz='sm'>{gameDetails.genres.join(', ')}</Text>
              </Box>
            </Stack>
          </Card>
          <Card p='25'>
            <Stack gap='1rem'>
              <Title order={2} fw='600' fz='1.25rem' lh='1.75rem'>
                Purchase Options
              </Title>
              <SegmentedControl 
                value={orderType}
                onChange={setOrderType}
                color='violet'
                size='lg'
                data={[
                  { label: 'Digital', value:'digital' }, 
                  { label: 'Physical', value: 'physical'}
                ]}
                styles={{
                  indicator: {
                    borderRadius: '10px'
                  }
                }}
              />
              {
                orderType === 'physical' &&
                <SelectStore onSelectStore={setSelectedStore} />
              }
            </Stack>
          </Card>
          <Card p='25'>
            <Title order={2} fw='600' fz='1.25rem' lh='1.75rem' pb='1rem'>
              Achievements
            </Title>
            <Stack gap={16}>
              <div>
                <Group justify="space-between">
                  <Text fw={500} fz="xs" c="dimmed">
                    Progress
                  </Text>
                  <Text fw={500} fz="xs" c="dimmed">
                    {numAchieved} of {gameDetails.achievements.length}
                  </Text>
                </Group>
                <Progress
                  value={(numAchieved / gameDetails.achievements.length) * 100}
                  color="violet"
                  size="sm"
                  radius="xl"
                />
              </div>
              <ScrollArea.Autosize mah={320}>
                <HoverCard.Group>
                  <Stack gap={8}>
                    {
                      gameDetails.achievements.map((a) => 
                        <HoverCard shadow='md' width={320} key={a.id}>
                          <HoverCard.Target>
                            <Card bg='dark.7' bd='none' p='6 12'>
                              <Group justify='space-between' wrap='nowrap'>
                                {a.title}
                                {
                                  a.achieved 
                                  ?
                                  <IconAwardFilled color='var(--mantine-color-yellow-8)' stroke='1.5'/>
                                  :
                                  <IconLock color='var(--mantine-color-dimmed)' stroke='1.5'/>
                                }
                              </Group>
                            </Card>
                          </HoverCard.Target>
                          <HoverCard.Dropdown>
                            {a.description}
                          </HoverCard.Dropdown>
                        </HoverCard>
                      )
                    }
                  </Stack>
                </HoverCard.Group>
              </ScrollArea.Autosize>
            </Stack>
          </Card>
        </Stack>
      </Group>
    </Stack>
  );
}