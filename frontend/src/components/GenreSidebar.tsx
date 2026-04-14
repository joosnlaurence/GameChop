import { Button, Card, ScrollArea, Stack, Title, type CardProps } from "@mantine/core";

interface GenreSidebarProps extends CardProps {
  genres: string[],
  selected: string[];
  onToggle: (genre: string) => void;
}

const CARD_HEIGHT = 560

export default function GenreSidebar({ 
  genres,
  selected,
  onToggle, 
  ...rest 
}: GenreSidebarProps) {
  return (
    <Card 
      bd='1px solid dark.5'
      mah={CARD_HEIGHT}
      {...rest}
    >
      <Title order={2} size='h4' fw='600'>Genres</Title>
      <ScrollArea 
        h={CARD_HEIGHT} 
      >
        <Stack gap='8'>
          {
            genres.map((genre) => 
              <Button w='100%' variant='subtle' justify='flex-start' bdrs='4px'>
                {genre}
              </Button>
            )
          }
        </Stack>
      </ScrollArea>
    </Card> 
  )
}