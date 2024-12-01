# The find command queries the store for available packages. With the --private flag, which requires the user to be logged-in to the store (see 'snap help login'), it instead searches for private snaps that the user. A green check mark (given color and unicode support) after a publisher name indicates that the publisher has been verified.
export def slist [
  query: string,
  --private                               # Search private snaps.
  --narrow                                # Only search for snaps in "stable"
  --section: string@snap-sections         # Restrict the search to a given section.
  --list-sections                         # List sections available
  --color: string@snap-options = "auto"   # Use a little bit of color to highlight some things. (default: auto)
  --unicode: string@snap-options = "auto" # Use a little bit of Unicode to improve legibility. (default: auto)
] {
  flatpak list --columns=name,application,size | lines | split column -r '[ ]{2,}|\t+' | rename name id size | upsert size {|pkg| ($pkg.size | str replace , . | str replace bytes b | into filesize )}
}

