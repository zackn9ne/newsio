# encoding: utf-8
# https://www.twilio.com/user/account/developer-tools/api-explorer/message-create
# curl -X POST 'https://api.twilio.com/2010-04-01/Accounts/ACbbd0943e17312304cbdd5b07f0891fa4/Messages.json'  \

#get everyhing ready
require 'httparty'
require 'dotenv'
require 'nokogiri'

class Twilio
    Dotenv.load

    # The Constants
    VERSION = '2010-04-01'
    ID = ENV['ID']
    TOKEN = ENV['TOKEN']
    MY_TWILIO_SANDBOX_NUMBER = ENV['NUM']
    BASE_URI = "https://api.twilio.com/#{VERSION}/Accounts/#{ID}"
    SMS_PATH = '/Messages.json'

    def self.send_sms(recipient,message)
        url = BASE_URI + SMS_PATH

        options = {
            # with form parameters...
            body: {
                From: MY_TWILIO_SANDBOX_NUMBER,
                To: recipient,
                Body: message
            },

            # with basic authentication..
            basic_auth: {
                username: ID,
                password: TOKEN
            }
        }

        # Make a POST request to <this URL>...
        return HTTParty.post(url, options)
    end

end

object = Twilio.new
puts 'sending coming up..' 
#puts Twilio.url
sms_recipient = "+15104097763"
text_block = "Friendship 
By Emily Gould
(Farrar, Straus & Giroux)

Near the end of Emily Gould’s engaging debut novel Friendship, a jaded older woman gives protagonist Amy Schein this advice:
    
    “Honey, I was just like you. I lived my twenties in New York City, thought I’d be a little Joanie Didion, packing my suitcase for reporting jobs with a leotard and a bottle of bourbon and two pairs of nylons or whatever... Do you know what’s glamorous about living in New York City and having no money? After you’re thirty, exactly nothing.”

The passage is perfectly representative of a novel that lives in that place where “shrill, seething ambition” collides with ugly reality; it’s smart and funny, but also wrenchingly accurate. There’s an edge of cruelty in play, a tinge of acidity that runs through what otherwise might seem like another carefree jaunt through the well-trodden precincts of hipster angst.
    
    As most denizens of these parts have probably gathered by now— Friendship having been down an extraordinarily long pre-publication runway, courtesy of FSG and others—Gould’s novel charts the bond between two young women navigating the professional and personal tectonics of late-twenties life in Brooklyn circa 2007. In some ways the book is dangerously underpowered: In lieu of nuanced psychological depth, Schein and her perennial second-fiddle wing-person Bev Tunney are assigned sets of quirks and tics, and the relentlessly slangy, chattery dialogue grows wearisome, although I’m haunted by the suspicion that it is actually hyper-accurate socio-linguistic mimicry. If so, God help us.
    
    Three elements of Gould’s novel, though, power it past its limitations and save it from being simply updated Candace Bushnell. The first is that the plot, after chirping along somewhat predictably for two-hundred-odd pages, suddenly veers off in a direction that struck me as genuinely harrowing and unpredictable. The second is the obvious but somehow still essential fact that this book is proudly and unapologetically about two women who do not end up competing for or otherwise sacrificing their integrity in the pursuit of men. This may seem unremarkable, but such depictions are, somewhat inexplicably, quite rare: A casual and profoundly unscientific survey suggests that the number of books that pass the famous Bechdel test is dismally low. In a perfect world, a book that offers a warm and emotionally honest depiction of a friendship between young women should not need to be cause for celebration. In ours, it is.
    
    The third element of Friendship that I found deeply admirable, even heroic, is the subtle but unmistakable current of bracing feminist anger that thrums just under its otherwise breezy surface. It’s nothing so crude as that the men in the novel are creeps, although several are. It’s that Bev and Amy exist in a world where double standards and cultural and structural biases still reign, a realization which salts the narrative in subtle and unmistakable ways. If such a concept is somehow distasteful to you, then go read a book about the Civil War or something. There will always be plenty of those, even in Brooklyn."
puts 'total charachter count is..'
puts text_block.length

text_block2 = "The Craigwatch Story
Like most people I learn best from failure, so when I received a Cease and Desist from Craigslist the other day and decided to end my long-running service Craigwatch, I looked back to see what could be learned.

I won't give you a whole graphing calculator story, but I will try to give you a bit of context. Much like Linux, Craigwatch started as a service I wrote for myself. I knew that Craigslist users had a general honor system whereby the first person to accept the terms of an ad would be given the item, and I knew that I didn't have the time or energy to sit around refreshing Craigslist all day until something I was looking for was posted. So, in late 2008, Craigwatch was born.

Since Craigwatch was just for me, and I wasn't a very good programmer, it had no public interface. One day a friend said to me: \"Beau, how are you so good at getting stuff off Craigslist?/\" So I told him and he said \"Can I use that too?\" And I wrote a little login form and put it on my website. A while later my friend came to me and said \"Hey, Craigwatch is working great! Can my friend use it as well?\" So I added a registration form to the website. Then I left it there.

I went on with my life, slowly getting better at programming and constantly finding good deals. In 2012 I quit my job, got rid of all my stuff, and bought a one-way ticket to Indonesia. No more using Craigwatch for me! I knew the script was still running on my server but I figured I'd leave it there as a public service. I went on with my travels. In mid 2013 my server started crashing. For a long time I had watched my server memory dwindle and dwindle and always known it was Craigwatch; random people had been finding it and signing up.

I had three options: fix the script, buy a better server, or shutdown Craigwatch altogether. Since I hadn't made any money in over a year, and less than a handful of people donated to Craigwatch in amounts not even close to covering my existing server cost or two hours worth of my time, and my time was especially scarce (not to mention internet) when traveling the way I was, I was conflicted.

When I found myself with a free day in the capitol of Mongolia, I decided I'd take a crack at fixing the script. I made some optimizations, but alas, it was no use. The service was sending well over 100,000 emails per month and the script was taking longer to run than the interval between runs. Improved DNS settings, more efficient scraping calls—there was nothing to be done but parallelize the watch function and sending of emails. That would require a whole new engine and a lot of work.

The service had been down for about a week and people were starting to email me. Perhaps it was the thrill of a challenge, or the desire to see how much had passed me by in the programming world, but I determined to fix the service. I hunkered down and got it done, and regarded the new engine as the best code I'd ever written. Then the service went nuts, emailing people as fast as it could. I had to shut it down and fix it fast, because I couldn't risk loosing all the \"internet cred\" I'd worked so hard to build up with spam filters (perhaps the hardest task I ever faced with Craigwatch Further reading & more reading). I fixed the issues and emailed the users.

Emails, everywhere... but you probably already knew that. Due to several different errors, Craigwatch had gone out of control and I was in an internet desert and couldn't do anything about it. All the bugs should be fixed now AND I've made the engine hyper-intelligent and self-aware (how could that possibly go wrong) so in the future if it starts sending out too many emails it should self-destruct (really just shut down, but self-destruct sounds cooler). There are necessarily situations in which it could go crazy without turning itself off, but hopefully those won't happen.

I continued traveling and more random people kept signing up for Craigwatch. I watched as my server resources were exhausted. \"I'll have to upgrade my server or shut down Craigwatch\" I thought. Having now made no money in the last two years, and having received no donations for Craigwatch in the last year, paying to upgrade my server on Craigwatch's behalf didn't strike me as particularly enticing. So I thought I'd toe the line: upgrade my server but start charging for Craigwatch.

I suppose running Craigwatch had always brought me some sense of moral good, so I decided a \"freemium\" model whereby you could have five watches which were checked every ten minutes for free, or unlimited watches which were checked every five minutes for a small price, would be best. I also decided that I'd grandfather in everyone that was already using the service. One important thing remained before I could start charging however: that I open-sourced the code.

I've always been a huge proponent of the open source movement and I would have open-sourced Craigwatch long ago except I was embarrassed about the code, and then I was too busy traveling to maintain an open source project. In April 2014 I decided to do it. I planned to share the code with everyone when I told them about the new structure, but that day never came.

In mid 2014 I decided it was time to return to the United States, at least for a while. Immediately after the initial madness of being back subsided, I figured I'd add the payment processing to Craigwatch. Before I could even get the code in place I received a strongly worded Cease and Desist from the lawyers of Craigslist. They didn't know about my plans, it was just good timing.

My heart wasn't heavy, there was no sinking feeling. Actually, it felt like a weight had been lifted off my shoulders. For years I had wasted energy keeping the service going—a service I didn't even use—and then I didn't have to anymore. Toward the end people would even write in complaining and wasting my time because they were too lazy to figure things out themselves. The day I got the C&D I shut down the service and put a cool message over the home page, but one thing still remained: to notify the users.

I was conflicted. I wanted to write something funny and whimsical as I had always done, but I couldn't find the words. At the same time I wanted to scorn the ungrateful users who had done nothing to keep it going. Part of me wanted to damn the trend in Western civilization, much the way the Onion—which shared the same birthplace as Craigwatch—did when they stopped printing papers. Instead I did none of those things:

Dear Craigwatch User,
Due to a cease and desist letter issued to me by Craigslist, I've shut down this service.
~Beau

Then something unexpected (at least to me) happened: emails started flooding in. My users began emailing me to say how much they appreciated the service and how sad they were to see it go. Someone posted my story on Chilling Effects. Someone else offered to help fight it.

Doh! Sorry to hear. Thanks for all your work over the years. Always been a great help, and haven’t been bale to find another thing that worked as well.

Thanks for providing such a valuable service for all this time! We'll miss Craigwatch!

Oh no! Well it was incredibly useful while it lasted, Thanks!

Thanks for providing the service while you could. A couple of years ago I got a great deal on a milling machine that I never would have found without Craigwatch.

    Sorry; I know it was a labor of love. I hope your experience doing craigwatch opens doors for you...

    i sent craigslist a message saying their stupid.

    Then I got to thinking: \"Did I give up on Craigwatch too easy? Should I have made more of an effort for my users?\" Part of me wanted to respond to all the kind words with \"Thanks, but a bit late. That would have been nice to hear three years ago.\" But of course I was touched. After all, how often do people stop to comment on something that isn't broken? How often do we thank the leaders when things are going smoothly? In this modern day of simple, confidential communication, we all probably assume everyone else is thanking people for their good work, so we don't have to.

    Expressing gratitude has been shown to increase happiness [1], and we could all probably stand to do it a bit more. This experience will serve as a valuable reminder to thank the unseen people that help me every day. Donating to open source services is one good way to say thanks, but even an email to an unknown developer will probably go further than you'd expect. In retrospect, if a very few kind people hadn't bothered to write or donate, I probably would have shut Craigwatch down years ago.

    So thanks. Thanks to everyone who commented and contributed, and thanks for everyone's kind words at the end. I truly appreciate your support, the opportunity you've given me, and the lessons you've helped me learn. I need nothing more for Craigwatch or the work I've put into it, and if you'd like to do something on my behalf you can thank another developer or donate to a free service that you use."

puts text_block2.length
#Max says mediate on ruby string docs and use slice
#RUBY string class something like .split to split up the array in >2000 chunks
truncated_text_block = text_block[0..1999] 
truncated_text_block2 = text_block[1999..9999]
start_banner = "****START****"

td_tb2 = start_banner + text_block2[0..1979]
td_tb2a = text_block2[1999..3999]
td_tb2b = text_block2[3999..5999]
td_tb2c = text_block2[5999..7999]
td_tb2d = text_block2[7999..9999]
#RUBY wardialing dot each loop |each|
Twilio.send_sms(sms_recipient, truncated_text_block)
#Twilio.send_sms(sms_recipient, truncated_text_block2)
#Twilio.send_sms(sms_recipient, truncated_text_block) 
#END
