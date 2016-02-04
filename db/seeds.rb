
User.destroy_all

User.create handle: "Winged Earth", email: "andy@candy.com", password: "password", city: "Pasadena", state: "CA", featured: true
User.create handle: "Bubble Lab", email: "jenn@candy.com", password: "password", city: "Pasadena", state: "CA", featured: true
User.create handle: "Casey", email: "casey@candy.com", password: "password", city: "Pittsford", state: "NY", featured: true
User.create handle: "Erie University", email: "erie@candy.com", password: "password", city: "Rochester", state: "NY", featured: true
User.create handle: "Darius", email: "darius@candy.com", password: "password", city: "Ithaca", state: "NY", featured: false

User.find_by(handle: "Winged Earth").chambers.create name: "New Englander", description: "New English books.", featured: true
User.find_by(handle: "Winged Earth").chambers.create name: "The SoCal Room", description: "Books of interest to Southern Californians", featured: true
User.find_by(handle: "Winged Earth").chambers.create name: "Electronica", description: "Some resources on good electronica, ambient, experimental, breakbeat, drum & bass, etc.", featured: true

newenglander_id = Chamber.find_by(name: "New Englander").id
socal_id = Chamber.find_by(name: "The SoCal Room").id
electronica_id = Chamber.find_by(name: "Electronica").id

User.find_by(handle: "Winged Earth").access_types.find_by(chamber_id: newenglander_id).update_attributes(:curates => true)
User.find_by(handle: "Winged Earth").access_types.find_by(chamber_id: socal_id).update_attributes(:curates => true)
User.find_by(handle: "Winged Earth").access_types.find_by(chamber_id: electronica_id).update_attributes(:curates => true)


User.find_by(handle: "Bubble Lab").chambers.create name: "Graphic Design", description: "Design books. Check em out.", featured: false
User.find_by(handle: "Bubble Lab").chambers.create name: "Modern", description: "Art books on 1910s-1940s art movements.", featured: false

graphicdesign_id = Chamber.find_by(name: "Graphic Design").id
modern_id = Chamber.find_by(name: "Modern").id

User.find_by(handle: "Bubble Lab").access_types.find_by(chamber_id: graphicdesign_id).update_attributes(:curates => true)
User.find_by(handle: "Bubble Lab").access_types.find_by(chamber_id: modern_id).update_attributes(:curates => true)


User.find_by(handle: "Erie University").chambers.create name: "Esoteric Chamber", description: "mostly books on occultism, spiritualism, theosophy, and cool stuff like that", featured: true
User.find_by(handle: "Erie University").chambers.create name: "Upstate NY", description: "History, Fiction, and Culture of Upstate NY", featured: true
User.find_by(handle: "Erie University").chambers.create name: "Science", description: "A great deal of information about an emerging field known as Science", featured: true
User.find_by(handle: "Erie University").chambers.create name: "Philosophy House", description: "A lot of old dead dudes talking about stuff.", featured: true

esoteric_id = Chamber.find_by(name: "Esoteric Chamber").id
upstate_id = Chamber.find_by(name: "Upstate NY").id
science_id = Chamber.find_by(name: "Science").id
philosophy_id = Chamber.find_by(name: "Philosophy House").id



User.find_by(handle: "Erie University").access_types.find_by(chamber_id: esoteric_id).update_attributes(:curates => true)
User.find_by(handle: "Erie University").access_types.find_by(chamber_id: upstate_id).update_attributes(:curates => true)
User.find_by(handle: "Erie University").access_types.find_by(chamber_id: science_id).update_attributes(:curates => true)
User.find_by(handle: "Erie University").access_types.find_by(chamber_id: philosophy_id).update_attributes(:curates => true)


Chamber.find_by(name: "New Englander").books.create title: "Last of the Mohicans",
author: "James Fenimore Cooper",
genre: "Fiction",
description: "The Last of the Mohicans: A Narrative of 1757 (1826) is a historical novel by James Fenimore Cooper.\
It is the second book of the Leatherstocking Tales pentalogy and the best known to contemporary audiences.\
The Last of the Mohicans is set in 1757, during the French and Indian War (the Seven Years' War), when France and\
Great Britain battled for control of North America. During this war, both the French and the British used Native\
American allies, but the French were particularly dependent, as they were outnumbered in the Northeast frontier areas\
by the more numerous British colonists.\
The novel is primarily set in the upper New York wilderness, detailing the transport of the two daughters of\
Colonel Munro, Alice and Cora, to a safe destination at Fort William Henry. Among the caravan guarding the women are\
the frontiersman Natty Bumppo, the Major Duncan Heyward, and the Indians Chingachgook and Uncas, the former of whom\
is the novel's title character. These characters are sometimes seen as a microcosm of the budding American society,\
particularly with regards to their racial composition.",
book_uri: "https://www.gutenberg.org/ebooks/27681.epub.images?session_id=6669282a1dbab0f7387104d1d52250495f4398be",
image_uri: "https://www.gutenberg.org/cache/epub/27681/pg27681.cover.medium.jpg",
featured: true

Chamber.find_by(name: "New Englander").books.create title: "The Deerslayer",
author: "James Fenimore Cooper",
genre: "Fiction",
description: "The Deerslayer, or The First Warpath (1841) was the last of James Fenimore Cooper's \
Leatherstocking Tales to be written. Its 1740-1745 time period makes it the first installment chronologically\
 and in the lifetime of the hero of the Leatherstocking tales, Natty Bumppo. The novel's setting on Otsego\
  Lake in central, upstate New York, is the same as that of The Pioneers, the first of the Leatherstocking Tales\
   to be published (1823). The Deerslayer is considered to be the prequel to the rest of the series. \
   Fenimore Cooper begins his work by relating the astonishing advance of civilization in New York State, which \
   is the setting of four of his five Leatherstocking Tales.",
book_uri: "https://www.gutenberg.org/ebooks/3285.epub.images?session_id=50726096bd41a6efe525b5d9a48633d4614777a1",
image_uri: "http://explorepahistory.com/kora/files/1/2/1-2-2B8-25-ExplorePAHistory-a0b0f4-a_349.jpg",
featured: true

Chamber.find_by(name: "New Englander").books.create title: "Beyond Good and Evil",
author: "Friedrich Nietzsche",
genre: "philosophy",
description: "Beyond Good and Evil: Prelude to a Philosophy of the Future\
is a book by philosopher Friedrich Nietzsche, first published in 1886.\
It draws on and expands the ideas of his previous work, Thus Spoke \
Zarathustra, but with a more critical and polemical approach.In Beyond \
Good and Evil, Nietzsche accuses past philosophers of lacking critical \
sense and blindly accepting dogmatic premises in their consideration of \
morality. Specifically, he accuses them of founding grand metaphysical \
systems upon the faith that the good man is the opposite of the evil \
man, rather than just a different expression of the same basic \
impulses that find more direct expression in the evil man. The work \
moves into the realm `beyond good and evil` in the sense of leaving \
behind the traditional morality which Nietzsche subjects to a \
destructive critique in favour of what he regards as an affirmative \
approach that fearlessly confronts the perspectival nature of \
knowledge and the perilous condition of the modern individual.",
book_uri: "http://www.gutenberg.org/ebooks/4363.epub.images",
image_uri: "https://upload.wikimedia.org/wikipedia/commons/1/1b/Nietzsche187a.jpg",
featured: true



User.all.each do |u|
  u.books << Book.find_by(title: "Last of the Mohicans")
end



