import { Button, Group } from "@mantine/core";
import { IconChevronRight } from "@tabler/icons-react";

export default function SelectStore() {
  return (
    <>
      <Button 
        pl='1rem'
        fz='1rem'
        fw='600'
        bg='dark.7'
      >
        <Group gap='4'>
          Select Your Store  
          <IconChevronRight size='16'/>
        </Group>
      </Button>
    </>
  );
}