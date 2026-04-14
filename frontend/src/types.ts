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

export interface GetFeaturedPublishersResult {
  id: number;
  name: string;
  logo: string;
  banner: string;
  game_count: number;
}