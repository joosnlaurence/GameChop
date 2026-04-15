import { useRef, useState } from "react";
import { Combobox, Group, Image, Loader, Text, TextInput, useCombobox } from "@mantine/core";
import { IconSearch } from "@tabler/icons-react";
import { useNavigate } from "react-router-dom";
import type { GetGameListingResult } from "../types";

export default function NavSearch() {
  const [search, setSearch] = useState("");
  const [results, setResults] = useState<GetGameListingResult[]>([]);
  const [loading, setLoading] = useState(false);
  const debounceRef = useRef<ReturnType<typeof setTimeout> | null>(null);
  const combobox = useCombobox({ onDropdownClose: () => combobox.resetSelectedOption() });
  const navigate = useNavigate();

  const handleChange = (value: string) => {
    setSearch(value);
    if (debounceRef.current) clearTimeout(debounceRef.current);

    if (!value.trim()) {
      setResults([]);
      combobox.closeDropdown();
      return;
    }

    combobox.openDropdown();
    setLoading(true);
    debounceRef.current = setTimeout(async () => {
      try {
        const params = new URLSearchParams({ search: value });
        const data: GetGameListingResult[] = await fetch(
          `http://localhost:3000/api/games?${params}`
        ).then((r) => r.json());
        setResults(data.slice(0, 8));
        combobox.openDropdown();
      } finally {
        setLoading(false);
      }
    }, 400);
  };

  const handleSelect = (gameId: string) => {
    setSearch("");
    setResults([]);
    combobox.closeDropdown();
    navigate(`/browse/${gameId}`);
  };

  return (
    <Combobox store={combobox} onOptionSubmit={handleSelect}>
      <Combobox.Target>
        <TextInput
          fz="sm"
          flex="1 0 auto"
          leftSection={loading ? <Loader size={14} /> : <IconSearch size="1rem" />}
          styles={{
            input: {
              background: "var(--mantine-color-dark-7)",
              border: "1px solid var(--mantine-color-dark-5)",
            },
          }}
          placeholder="Search games..."
          value={search}
          onChange={(e) => handleChange(e.currentTarget.value)}
          onBlur={() => combobox.closeDropdown()}
          onFocus={() => results.length > 0 && combobox.openDropdown()}
        />
      </Combobox.Target>

      <Combobox.Dropdown>
        <Combobox.Options>
          {results.length > 0 ? (
            results.map((game) => (
              <Combobox.Option value={String(game.game_id)} key={game.game_id}>
                <Group gap="sm" wrap="nowrap">
                  <Image
                    src={game.thumbnail}
                    w={28}
                    h={38}
                    radius="sm"
                    fit="cover"
                    bg="dark.6"
                    style={{ flexShrink: 0 }}
                  />
                  <Text fz="sm" fw={500} lineClamp={1}>
                    {game.title}
                  </Text>
                </Group>
              </Combobox.Option>
            ))
          ) : (
            !loading && <Combobox.Empty>No games found</Combobox.Empty>
          )}
        </Combobox.Options>
      </Combobox.Dropdown>
    </Combobox>
  );
}
