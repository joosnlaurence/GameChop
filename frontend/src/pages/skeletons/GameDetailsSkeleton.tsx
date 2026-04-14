import { Skeleton, Group, Stack, Card, SimpleGrid } from '@mantine/core';

function GameDetailsSkeleton() {
  return (
    <Stack gap='48'>
      {/* Hero section */}
      <Group justify='space-between' mb='32' wrap='nowrap' align='stretch'>
        <Group gap='24' wrap='nowrap'>
          <Skeleton w={192} h={256} radius='md' />
          <Stack>
            <Skeleton h={40} w={300} />
            <Skeleton h={20} w={400} />
            <Group gap='0.5rem'>
              <Skeleton h={32} w={80} radius='10px' />
              <Skeleton h={32} w={60} radius='10px' />
              <Skeleton h={32} w={100} radius='10px' />
            </Group>
            <Group gap='1rem'>
              <Skeleton h={36} w={80} />
              <Skeleton h={42} w={160} radius='md' />
              <Skeleton h={42} w={42} radius='md' />
            </Group>
          </Stack>
        </Group>
        <Skeleton w={450} mih={250} radius='10px' />
      </Group>

      {/* Preview strip */}
      <Group wrap='nowrap'>
        {Array.from({ length: 6 }).map((_, i) => (
          <Skeleton key={i} w={186} h={112} radius='10px' style={{ flexShrink: 0 }} />
        ))}
      </Group>

      {/* Content area */}
      <Group gap='32' align='flex-start'>
        <Stack gap='32' flex={2}>
          <Card p='25'>
            <Skeleton h={24} w={120} mb='1rem' />
            <Stack gap={8}>
              <Skeleton h={14} />
              <Skeleton h={14} />
              <Skeleton h={14} w='80%' />
            </Stack>
          </Card>
          <Card p='25'>
            <Skeleton h={24} w={200} mb='1rem' />
            <SimpleGrid cols={2}>
              {[0, 1].map((col) => (
                <Stack gap='0.75rem' key={col}>
                  <Skeleton h={20} w={120} />
                  {Array.from({ length: 5 }).map((_, i) => (
                    <Stack gap={4} key={i}>
                      <Skeleton h={12} w={60} />
                      <Skeleton h={14} w='90%' />
                    </Stack>
                  ))}
                </Stack>
              ))}
            </SimpleGrid>
          </Card>
        </Stack>
        <Stack gap='32' flex={1}>
          <Card p='25'>
            <Skeleton h={20} w={80} mb='1rem' />
            {Array.from({ length: 4 }).map((_, i) => (
              <Stack gap={4} key={i} mb={12}>
                <Skeleton h={12} w={80} />
                <Skeleton h={14} w='70%' />
              </Stack>
            ))}
          </Card>
          <Card p='25'>
            <Skeleton h={20} w={150} mb='1rem' />
            <Skeleton h={42} radius='10px' />
          </Card>
          <Card p='25'>
            <Skeleton h={20} w={120} mb='1rem' />
            <Skeleton h={8} radius='xl' mb={16} />
            {Array.from({ length: 6 }).map((_, i) => (
              <Skeleton key={i} h={38} mb={8} radius='sm' />
            ))}
          </Card>
        </Stack>
      </Group>
    </Stack>
  );
}

export default GameDetailsSkeleton;