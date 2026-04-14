import { Group, Stack, Image, Title, Text, Badge, Button, ActionIcon, ScrollArea, Box, Card, SimpleGrid, SegmentedControl, Progress, HoverCard, UnstyledButton, Scroller } from '@mantine/core';
import { useParams } from 'react-router-dom';
import type { GetGameDetailsResult, Hardware } from '../types';
import { IconAwardFilled, IconHeart, IconLock, IconShoppingCart } from '@tabler/icons-react';
import { useState } from 'react';
import SelectStore from '../components/SelectStore';

const gameDetails: GetGameDetailsResult = {
  id: 1,
  title: "Neon Legends",
  summary: "Dive into a vibrant cyberpunk world where ancient legends meet cutting-edge technology. Neon Legends offers an immersive action RPG experience with dynamic combat, deep character customization, and a gripping story that unfolds across a sprawling open world. Team up with friends or go solo as you uncover the mysteries of a city on the brink of collapse.",
  price: 59.99,
  genres: ["Action", "RPG", "Open World"],
  publishers: ["Neon Interactive"],
  developers: ["Neon Studio"],
  thumbnail: "https://images.unsplash.com/photo-1542751371-adc38448a05e?w=300&h=400&fit=crop",
  release_date: '2022-02-25T05:00:00.000Z',
  achievements: [
    { "id": 1, "title": "First Steps", "description": "Complete the tutorial.", "achieved": true },
    { "id": 2, "title": "Rookie Hunter", "description": "Defeat your first enemy.", "achieved": true },
    { "id": 3, "title": "Weapon Master", "description": "Unlock all weapon types.", "achieved": true },
    { "id": 4, "title": "Speed Demon", "description": "Complete a level in under 2 minutes.", "achieved": true },
    { "id": 5, "title": "Legendary Fighter", "description": "Win 100 battles.", "achieved": true },
    { "id": 6, "title": "Treasure Seeker", "description": "Find all hidden collectibles in a level.", "achieved": true },
    { "id": 7, "title": "Quest Completer", "description": "Finish all side quests.", "achieved": true },
    { "id": 8, "title": "Stealth Expert", "description": "Complete a mission without being detected.", "achieved": true },
    { "id": 9, "title": "Boss Slayer", "description": "Defeat all boss enemies.", "achieved": true },
    { "id": 10, "title": "Explorer Elite", "description": "Discover every area on the map.", "achieved": true },
    { "id": 11, "title": "Team Player", "description": "Complete 10 co-op missions.", "achieved": true },
    { "id": 12, "title": "Fashion Icon", "description": "Collect every cosmetic item.", "achieved": true },
    { "id": 13, "title": "Master Craftsman", "description": "Craft 50 items.", "achieved": false },
    { "id": 14, "title": "Ultimate Victory", "description": "Complete the game on the hardest difficulty.", "achieved": false },
    { "id": 15, "title": "Collector Supreme", "description": "Collect every item in the game.", "achieved": false },
    { "id": 16, "title": "Hidden Secret", "description": "Find the secret Easter egg.", "achieved": false },
    { "id": 17, "title": "No Damage Run", "description": "Complete a level without taking damage.", "achieved": false },
    { "id": 18, "title": "Time Trial Champion", "description": "Set a new record on every time trial.", "achieved": false },
    { "id": 19, "title": "Perfect Score", "description": "Earn a perfect score on any level.", "achieved": false },
    { "id": 20, "title": "Platinum Trophy", "description": "Unlock every other achievement.", "achieved": false }
  ],
  previews: [
    { preview_id: 1, url: 'https://images.unsplash.com/photo-1538481199705-c710c4e965fc?w=400&h=225&fit=crop' },
    { preview_id: 2, url: 'https://images.unsplash.com/photo-1542751371-adc38448a05e?w=300&h=400&fit=crop' },
    { preview_id: 3, url: 'https://images.unsplash.com/photo-1538481199705-c710c4e965fc?w=400&h=225&fit=crop' },
    { preview_id: 4, url: 'https://images.unsplash.com/photo-1542751371-adc38448a05e?w=300&h=400&fit=crop' },
    { preview_id: 5, url: 'https://images.unsplash.com/photo-1538481199705-c710c4e965fc?w=400&h=225&fit=crop' },
    { preview_id: 6, url: 'https://images.unsplash.com/photo-1542751371-adc38448a05e?w=300&h=400&fit=crop' },
    { preview_id: 7, url: 'https://images.unsplash.com/photo-1538481199705-c710c4e965fc?w=400&h=225&fit=crop' },
    { preview_id: 8, url: 'https://images.unsplash.com/photo-1542751371-adc38448a05e?w=300&h=400&fit=crop' },
    { preview_id: 9, url: 'https://images.unsplash.com/photo-1538481199705-c710c4e965fc?w=400&h=225&fit=crop' }
  ],
  requirements: {
    minimum: {
      id: 1, os: "Windows 10", cpu: "Intel i5-8400 / AMD Ryzen 3 3300X",
      mem: "12 GB", gpu: "GTX 1060 3GB / RX 580 4GB", storage: "60 GB", recommended: 0
    },
    recommended: {
      id: 2, os: "Windows 10/11", cpu: "Intel i7-8700K / AMD Ryzen 5 3600X",
      mem: "16 GB", gpu: "GTX 1070 8GB / RX Vega 56 8GB", storage: "60 GB", recommended: 1
    }
  }
}

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

export default function GameDetails() {
  const { gameId } = useParams();
  


  const [orderType, setOrderType] = useState('digital');
  const [selectedPreview, setSelectedPreview] = useState(gameDetails?.previews[0] ?? 0);

  const publishers = gameDetails.publishers.join(', ');
  const developers = gameDetails.developers.join(', ');
  const pubDevMiddot = publishers && developers ? ' · ' : '';
  const dateMiddot = publishers || developers ? ' · ' : '';
  
  const release = parseDate(gameDetails.release_date);
  const subtitle = `${publishers}${pubDevMiddot}${developers}${dateMiddot}${release}`;

  const numAchieved = gameDetails.achievements.reduce((sum: number, a) => sum += a.achieved ? 1 : 0, 0 );

  // something like this 
  // const gameDetails = await fetch(...);
  
  return (
    <Stack gap='48'>
      <Group justify='space-between' wrap='nowrap'> 
        <Group gap='24' mb='32' wrap='nowrap'>
          <Image
            bd='2px solid dark.5'
            bdrs="md"
            src={gameDetails.thumbnail}
            w="192"
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
                leftSection={<IconShoppingCart stroke='1.5'/>}
                size='md'
                p='0px 32px'
              >
                Add to Cart
              </Button>
              <ActionIcon size='42' color='dark.7' bd='1px solid dark.5'>
                <IconHeart size='24' stroke='1.5'/>
              </ActionIcon>
            </Group>
          </Stack>
        </Group>
        <Image
          src={selectedPreview.url}
          maw='384'
          bdrs='10px'
          style={{ aspectRatio: '3/2', objectFit: 'cover' }}
          alt={`${gameDetails.title} Preview Image ${1}`}
        />
      </Group>
      
        <ScrollArea 
          offsetScrollbars
          type='always'
          scrollbarSize='16'
          scrollbars='x'
          styles={{
            scrollbar : {
              backgroundColor: 'var(--mantine-color-dark-8)',
              borderRadius: '100px'
            },
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
                    bd={preview.preview_id === selectedPreview.preview_id ?'2px solid violet' : undefined}
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
                <SelectStore />
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
                        <HoverCard shadow='md' width={320}>
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