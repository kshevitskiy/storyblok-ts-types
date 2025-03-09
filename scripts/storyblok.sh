
#!/bin/bash
# 
# Permissions
# chmod +x scripts/storyblok.sh

# Load environment variables from .env.local
export $(cat .env.local | xargs)

node -v

# Ensure STORYBLOK_SPACE_ID is set
if [ -z "$STORYBLOK_SPACE_ID" ]; then
  echo "STORYBLOK_SPACE_ID is not set in .env.local"
  exit 1
fi

# Ensure the directory exists before running the command
mkdir -p "__storyblok__"

# Pull components from Storyblok and save them to a JSON file
echo "Pulling Storyblok components for space ID: $STORYBLOK_SPACE_ID"
npx storyblok pull-components --space $STORYBLOK_SPACE_ID --file-name schema --path __storyblok__/

# Check if the __storyblok__/components.schema.json file was created successfully
if [ ! -f "__storyblok__/components.schema.json" ]; then
  echo "Failed to pull Storyblok components. __storyblok__/components.schema.json not found."
  exit 1
fi

# Generate TypeScript types from the pulled components JSON file
echo "Generating TypeScript types from __storyblok__/components.schema.json"

# Specify your desired paths for source and destination files
SOURCE_FILE_PATHS="__storyblok__/components.schema.json"
DESTINATION_FILE_PATH="types/storyblok.d.ts"
TYPE_NAMES_PREFIX="Acme"
TYPE_NAMES_SUFFIX="Sb"

# Run the generate-typescript-typedefs command
npx storyblok generate-typescript-typedefs \
  --sourceFilePaths $SOURCE_FILE_PATHS \
  --destinationFilePath $DESTINATION_FILE_PATH \
  --typeNamesPrefix $TYPE_NAMES_PREFIX \
  --typeNamesSuffix $TYPE_NAMES_SUFFIX

echo "TypeScript types generated successfully!"