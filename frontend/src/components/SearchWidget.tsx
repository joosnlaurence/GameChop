import { useEffect, useRef, useState } from "react";
import { Button, Group, Select, Stack, TextInput } from "@mantine/core";
import { IconSearch, IconX } from "@tabler/icons-react";
import type { GameFilters, GetGameFiltersResult } from "../types";

const BROWSE_SORT_OPTIONS = [
  { value: "newest",     label: "Newest" },
  { value: "alpha",      label: "Alphabetical" },
  { value: "price_asc",  label: "Price: Low to High" },
  { value: "price_desc", label: "Price: High to Low" },
];

interface SearchFiltersProps {
  filterOptions?: GetGameFiltersResult;
  filters: GameFilters;
  onFiltersChange: (filters: GameFilters) => void;
  sortOptions?: { value: string; label: string }[];
  searchPlaceholder?: string;
  debounceMs?: number;
}

export default function SearchFilters({
  filterOptions,
  filters,
  onFiltersChange,
  sortOptions = BROWSE_SORT_OPTIONS,
  searchPlaceholder = "Search games...",
  debounceMs = 400,
}: SearchFiltersProps) {
  // Internal state so the input feels instant while the actual query is debounced
  const [searchInput, setSearchInput] = useState(filters.search);
  const debounceRef = useRef<ReturnType<typeof setTimeout> | null>(null);
  const filtersRef  = useRef(filters);

  

  // Keep ref in sync so debounce closure always sees latest filter values
  useEffect(() => { filtersRef.current = filters; }, [filters]);

  // Sync input when filters are cleared externally
  useEffect(() => {
    if (filters.search !== searchInput) {
      setSearchInput(filters.search);
    }
  // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [filters.search]);

  useEffect(() => {
    return () => {
      if (debounceRef.current) clearTimeout(debounceRef.current);
    };
  }, []);

  const handleSearchChange = (value: string) => {
    setSearchInput(value);
    if (debounceRef.current) clearTimeout(debounceRef.current);
    debounceRef.current = setTimeout(() => {
      onFiltersChange({ ...filtersRef.current, search: value });
    }, debounceMs);
  };

  const handleFilterChange = (key: keyof GameFilters) => (value: string | null) => {
    onFiltersChange({ ...filtersRef.current, [key]: value });
  };

  const handleClear = () => {
    if (debounceRef.current) clearTimeout(debounceRef.current);
    setSearchInput("");
    onFiltersChange({ search: "", genre: null, publisher: null, developer: null, sortBy: null });
  };

  return (
    <Stack gap="sm">
      <TextInput
        flex="1 0 auto"
        leftSection={<IconSearch size="1.25rem" />}
        size="lg"
        placeholder={searchPlaceholder}
        value={searchInput}
        onChange={(e) => handleSearchChange(e.currentTarget.value)}
      />
      <Group w="100%">
        <Select
          placeholder="Genre"
          data={filterOptions?.genres ?? []}
          value={filters.genre}
          onChange={handleFilterChange("genre")}
          searchable
          clearable
          flex="1"
          miw="0"
        />
        <Select
          placeholder="Publisher"
          data={filterOptions?.publishers ?? []}
          value={filters.publisher}
          onChange={handleFilterChange("publisher")}
          searchable
          clearable
          flex="1"
          miw="0"
        />
        <Select
          placeholder="Developer"
          data={filterOptions?.developers ?? []}
          value={filters.developer}
          onChange={handleFilterChange("developer")}
          searchable
          clearable
          flex="1"
          miw="0"
        />
        <Select
          placeholder="Sort By"
          data={sortOptions}
          value={filters.sortBy}
          onChange={handleFilterChange("sortBy")}
          clearable
          flex="1"
          miw="0"
        />
        <Button
          color="dark.7"
          bd="1px solid dark.5"
          leftSection={<IconX size={16} />}
          onClick={handleClear}
        >
          Clear
        </Button>
      </Group>
    </Stack>
  );
}
