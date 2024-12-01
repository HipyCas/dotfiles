# The find command queries the store for available packages. With the --private flag, which requires the user to be logged-in to the store (see 'snap help login'), it instead searches for private snaps that the user. A green check mark (given color and unicode support) after a publisher name indicates that the publisher has been verified.
export def find [
  query: string,
  --private                               # Search private snaps.
  --narrow                                # Only search for snaps in "stable"
  --section: string@snap-sections         # Restrict the search to a given section.
  --list-sections                         # List sections available
  --color: string@snap-options = "auto"   # Use a little bit of color to highlight some things. (default: auto)
  --unicode: string@snap-options = "auto" # Use a little bit of Unicode to improve legibility. (default: auto)
] {
  ^snap find $query (if $private { --private } else { () }) (if $narrow { --narrow } else { () }) --color $color --unicode $unicode (if $section != null { $"--section=($section)" } else { () }) | lines | split column -r '\s{2,}' | headers | upsert Notes { |s| if $s.Notes == "-" { null } else { $s.Notes } }
}



def snap-options [] {
  ["auto" | "never" | "always"]
}

def snap-sections [] {
  [nothing, "art-and-design", "books-and-reference", "development", "devices-and-iot", "education", "entertainment", "featured", "finance", "games", "health-and-fitness", "music-and-audio", "news-and-weather", "personalisation", "photo-and-video", "productivity", "science", "security", "server-and-cloud", "social", "utilities"]
}
