import { Box, Container, Group, SimpleGrid, Skeleton, Stack } from "@mantine/core";

export default function HomeSkeleton() {
  return (
    <Container size="xl" pt="xl" pb={120} px="clamp(1rem, 5vw, 77.5px)">
      <Stack gap={100}>
        {/* Browse by Genre */}
        <Box>
          <Skeleton h={36} w={220} mx="auto" mb="xl" />
          <Group wrap="nowrap" gap="sm" px={64}>
            {Array.from({ length: 5 }).map((_, i) => (
              <Skeleton key={i} h={180} radius="md" style={{ flex: 1 }} />
            ))}
          </Group>
        </Box>

        {/* New Releases */}
        <Box>
          <Group justify="space-between" mb="md">
            <Skeleton h={30} w={180} />
            <Skeleton h={20} w={70} />
          </Group>
          <Group wrap="nowrap" gap="sm" px={64}>
            {Array.from({ length: 4 }).map((_, i) => (
              <Stack key={i} gap={8} style={{ flex: 1 }}>
                <Skeleton style={{ aspectRatio: "3/4" }} w="100%" radius="md" />
                <Skeleton h={16} w="80%" />
                <Skeleton h={14} w="50%" />
              </Stack>
            ))}
          </Group>
        </Box>

        {/* Popular Games */}
        <Box>
          <Group justify="space-between" mb="md">
            <Skeleton h={30} w={200} />
            <Skeleton h={20} w={70} />
          </Group>
          <Group wrap="nowrap" gap="sm" px={64}>
            {Array.from({ length: 4 }).map((_, i) => (
              <Stack key={i} gap={8} style={{ flex: 1 }}>
                <Skeleton style={{ aspectRatio: "3/4" }} w="100%" radius="md" />
                <Skeleton h={16} w="80%" />
                <Skeleton h={14} w="50%" />
              </Stack>
            ))}
          </Group>
        </Box>

        {/* Featured Publishers */}
        <Box>
          <Group justify="space-between" mb="md">
            <Skeleton h={30} w={240} />
            <Skeleton h={20} w={70} />
          </Group>
          <SimpleGrid cols={{ base: 2, sm: 4 }} spacing="md">
            {Array.from({ length: 4 }).map((_, i) => (
              <Stack key={i} gap={0}>
                <Skeleton h={140} radius="md" style={{ borderBottomLeftRadius: 0, borderBottomRightRadius: 0 }} />
                <Skeleton h={32} radius="md" style={{ borderTopLeftRadius: 0, borderTopRightRadius: 0 }} />
              </Stack>
            ))}
          </SimpleGrid>
        </Box>
      </Stack>
    </Container>
  );
}