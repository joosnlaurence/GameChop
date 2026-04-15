export interface Achievements {
  earned: number;
  total: number;
}

export interface Achievement {
  id: number;
  title: string;
  description: string;
  achieved: boolean;
}

export interface Hardware {
  id: number;
  os: string;
  cpu: string;
  mem: string;
  gpu: string;
  storage: string;
  recommended: number;
}

export interface Game {
  game_id: number;
  title: string;
  summary?: string;
  thumbnail: string;
  release_date?: string;
  price?: number;
  genres?: string[];
  publishers?: string[];
  developers?: string[];
  wishlisted?: boolean;
  inLibrary?: boolean;
  achievements?: Achievements;
}

export interface GetGameListingResult {
  game_id: number;
  title: string;
  summary: string;
  thumbnail: string;
  release_date: string;
  price: number;
  genres: string[];
  publishers: string[];
  developers: string[];
}

export interface GetGameDetailsResult {
  id: number;
  title: string;
  summary: string;
  thumbnail: string;
  release_date: string;
  price: number;
  genres: string[]; 
  publishers: string[]; 
  developers: string[]; 
  achievements: Achievement[],
  previews: {preview_id: number, url: string}[],
  requirements: {minimum: Hardware, recommended: Hardware}
}

export interface LibraryGame {
  game_id: number;
  title: string;
  thumbnail: string;
  price: number;
  purchased: boolean;
  wishlisted: boolean;
  earned_achievements: number;
  total_achievements: number;
}

export interface GetUserLibraryResult {
  owned: LibraryGame[];
  wishlisted: LibraryGame[];
}

export interface GetFeaturedPublishersResult {
  id: number;
  name: string;
  logo: string;
  banner: string;
  game_count: number;
}

export interface GameFilters {
  search: string;
  genre: string | null;
  publisher: string | null;
  developer: string | null;
  sortBy: string | null;
}

export const DEFAULT_FILTERS: GameFilters = {
  search: '',
  genre: null,
  publisher: null,
  developer: null,
  sortBy: null,
};

export interface GetGameFiltersResult {
  genres: string[];
  publishers: string[];
  developers: string[];
}