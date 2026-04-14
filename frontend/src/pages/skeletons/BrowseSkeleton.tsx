import { Group, SimpleGrid, Stack, Skeleton } from "@mantine/core";

export default function BrowseSkeleton() {
  return (
    <Stack gap="32px">
      <Stack gap="24px">
        <Group justify="space-between">
          <Skeleton h={36} w={200} />
          <Skeleton h={36} w={180} radius="md" />
        </Group>
        <Skeleton h={42} radius="md" />
      </Stack>
      <Group w="100%" align="flex-start">
        {/* Genre sidebar */}
        <Stack flex={1} gap={8}>
          {Array.from({ length: 10 }).map((_, i) => (
            <Skeleton key={i} h={32} radius="sm" />
          ))}
        </Stack>
        {/* Game cards grid */}
        <SimpleGrid flex={4} cols={{ base: 1, sm: 2, md: 3, lg: 4 }}>
          {Array.from({ length: 12 }).map((_, i) => (
            <Stack key={i} gap={8}>
              <Skeleton style={{ aspectRatio: '3/4' }} w="100%" radius="md" />
              <Skeleton h={16} w="80%" />
              <Skeleton h={14} w="50%" />
            </Stack>
          ))}
        </SimpleGrid>
      </Group>
    </Stack>
  );
}