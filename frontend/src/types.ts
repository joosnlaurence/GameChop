export interface Achievements {
  earned: number;
  total: number;
}

export interface Game {
  id: number;
  title: string;
  price?: number;
  image: string;
  publisher?: string;
  developer?: string;
  genres?: string[];
  wishlisted?: boolean;
  inLibrary?: boolean;
  achievements?: Achievements;
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