import { Button, Group, Modal } from "@mantine/core";
import { useDisclosure } from "@mantine/hooks";
import { IconChevronRight } from "@tabler/icons-react";

export default function SelectStore() {
  const [opened, {open, close}] = useDisclosure(false);
  
  return (
    <>
      <Modal.Root opened={opened} onClose={close}>
        <Modal.Overlay />
        <Modal.Content>
          <Modal.Header>
            <Modal.Title>Select Your Store</Modal.Title>
            <Modal.CloseButton />
          </Modal.Header>
          <Modal.Body>
            {'Hi :)'}
          </Modal.Body>
        </Modal.Content>
      </Modal.Root>
      <Button 
        pl='1rem'
        fz='1rem'
        fw='600'
        bg='dark.7'
        bd='1px solid dark.5'
        onClick={open}
      >
        <Group gap='4'>
          Select Your Store  
          <IconChevronRight size='16'/>
        </Group>
      </Button>
    </>
  );
}