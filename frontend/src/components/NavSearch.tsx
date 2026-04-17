import { useRef, useState } from "react";
import { Combobox, Group, Image, Loader, Text, TextInput, useCombobox } from "@mantine/core";
import { IconSearch } from "@tabler/icons-react";
import { useNavigate } from "react-router-dom";
import type { GameListing, GetGameListingResult } from "../types";
import { api_url } from "../global";

export default function NavSearch() {
  const [search, setSearch] = useState("");
  const [results, setResults] = useState<GameListing[]>();
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
      setLoading(false);
      return;
    }

    combobox.openDropdown();
    setLoading(true);
    debounceRef.current = setTimeout(async () => {
      try {
        const params = new URLSearchParams({ search: value });
        const data: GetGameListingResult = await fetch(
          api_url(`/api/games?${params}`)
        ).then((r) => r.json());
        setResults(data?.data.slice(0, 8));
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
          onFocus={() => (results?.length ?? 0) > 0 && combobox.openDropdown()}
        />
      </Combobox.Target>

      <Combobox.Dropdown bg='dark.7' bd='1px solid dark.5'>
        <Combobox.Options>
          {(results?.length ?? 0) > 0 ? (
            results?.map((game) => (
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
