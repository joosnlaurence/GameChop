import { 
  createTheme, 
  defaultVariantColorsResolver, 
  type VariantColorsResolver 
} from "@mantine/core";

const variantColorResolver: VariantColorsResolver = (input) => {
  const defaultResolvedColors = defaultVariantColorsResolver(input);

  if(input.variant === 'subtle') {
    return {
      ...defaultResolvedColors,
      background: 'transparent',
      hover: 'var(--mantine-color-dark-5)'
    };
  }

  return defaultResolvedColors;
}

export const theme = createTheme({
  variantColorResolver,
  fontFamily: 'Inter, sans-serif',
  primaryColor: 'violet',
  white: '#E4E7F1',
  colors: {
    dark: [
      '#E4E7F1',
      '#C1C4D0',
      '#9EA2B0',
      '#7B8090',
      '#585E70',
      '#353C50',
      '#1E2433',
      '#141929',
      '#0F1322',
      '#0A0E1A',
    ],
  },
  defaultRadius: '10px'
});