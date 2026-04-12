import { Button, Group, MultiSelect, Select, TextInput } from "@mantine/core";
import { IconSearch, IconX } from "@tabler/icons-react";

// This data should probably be given as props
const GENRES = ['Action', 'Puzzle', 'RPG', 'FPS', 'Platformer']
const PUBLISHERS = ['Epic Games', 'Nintendo', 'Ubisoft']
const DEVELOPERS = ['Nintendo', 'FromSoftware', 'Naughty Dog']

// Search Widget placeholder for you to continue off of
export default function SearchFilters() {
  return (
    <>
      <TextInput 
        flex='1 0 auto'
        leftSection={<IconSearch size='1.25rem' />}
        size='lg'
        placeholder='Search games...' 
      />
      <Group w='100%'>
        <MultiSelect 
          placeholder="Genres" 
          data={GENRES}
          searchable
          flex='1'
          miw='0'
        />
        <Select 
          placeholder="Publisher" 
          data={PUBLISHERS}
          searchable
          flex='1'
        />
        <Select
          placeholder="Developer" 
          data={DEVELOPERS}
          searchable
          flex='1'
        />
        <Select
          placeholder="Sort By" 
          data={['Price: Low to High', 'Price: High to Low', 'Newest', 'Alphabetical']}
          flex='1'
        />
        <Button color='dark.7' bd='1px solid dark.5' leftSection={<IconX />}>
          Clear Filters
        </Button>
      </Group>
    </>
  );
}