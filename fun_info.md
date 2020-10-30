- Linus Torvalds, the creator and principle maintainer of the linux kernel, took a break from the community to work on his personality (he was known for brutally disagreeing with the community developers, in impolite emails.. search quotes on google).  

+ Microsoft Edge is one of the most secured browsers. Running on Windows, the browser runs on virtualized sub-OS container, isolated from the 'host' kernel with hardware support. Thus attacks through this surface are much harder to achieve, opposed to the common browsers on Windows (e.g. chrome \ firefox).  Also, since Edge isn't that common for web browsing, it is much less researched (for better or worse).


- Whatsapp (Facebook) signed an agreement with Google so that chats backups from android will be uploaded to the google user's Drive (cloud storage) with unlimited quota (up until now the backups counted towards the user's space in Drive). However, note that backups are uploaded without Whatsapp encryption.

- Intel introduced an SSD drive that can store 32 TB and has the size of a ruler.

+ Python is not really interpreted (executed line by line),  it's compiled to byte-code which then translated to machine code by the interpreter. You may view the byte-code commands of a function or source code using the built-in library: dis.

- a riddle, what will be the output of the following program:
#include <stdio.h>
void f() {
       char a;
       9[&a] -= 5;
}
int main(void) {
     printf("hello\n");
     f();
     printf("world\n");
     return 0;
}
- a solution to the previous riddle. The riddle was adjusted for compilation in our machines. The output would be hello and then the program would enter an infinite loop. This is caused by overriding the return address from f to main  (saved in in the stack).

+ There are rumors that WhatsApp will start putting ads in the application. There are equivalent messaging applications like Telegram which is open source on its client side, free, ads-free and popular in Israel. I enjoy telegram, but it doesn't encrypt messages end-to-end (except secret chats, but those can't be viewed from PC so it's inconvenient). If you search for a liable fast messaging app which is also secured and in favor of privacy - use Signal. 
Signal is completely open-sourced, peer-reviewed by security researchers and I really like it - however in Israel it is less common, so I ended up removing it. 

- credit to Mr. M-M: if you 'import this' in python, you'll see the zen of python- a poem by python's creator about preferred programming style. The source code of 'this' module reveals that the poem is coded with Caesar cipher (a really weak encryption based on substituting each letter by some-constant-distant letter from it in the alphabet).

+ If a local variable's address is returned from a function the gcc compiler converts them into null pointers. However, you can override this behavior by copying the local address to an other local pointer and return it. [credit: https://twitter.com/AmarSaar/status/1094606841068294145]

+ Yesterday the USB 4 was announced. It'll be ~7 times more faster than non-thunderbolt current USB connections (40 GB/s!). The USB 4 architecture is based on Thunderbold 3 (which is not an open standard, Intel's propriety).

+ A trivial yet useful percentages calculations trick: x% of y == y% of x. 
E.g. 18% of 50 is equal to 50% of 18 (which is easier to calculate) and the answer is 9. Thank you, commutative of multiplication. 

+ Watch this amazing video[https://drive.google.com/file/d/1NhN6ofpiLWoZY71MBvsSYyW-j0meUd57/view], it demonstrates a natural image synthesizing capability, based on GAN & style transfer - which are both very interesting usages of neural networks. For the full paper see attributes_hallucination [https://arxiv.org/pdf/1808.07413.pdf].

+ Opposed to "regular" big cameras, smartphone cameras have a major disadvantage in zooming since the focal-length is restricted to short lengths (the smartphone is thin). Lately, to improve this issue, new smartphones come out with some kind of inner-periscope such that the sensor is perpendicular to the lens, thus giving it longer focal-length than the space it would have otherwise. 

+ There is a site that randomly shows a synthesized face made with GAN. Most of them look quite real, sometimes you can tell they're not (teeth are most likely to fail there). Have a look and test your capability to identify nature vs machine-learning products: 
https://thispersondoesnotexist.com/

+ Last week Google published a doodle celebrating J.S. Bach, that allows the user to insert a monophonic melody and then an AI ( that trained on ~300 Bach's chorales for few hours) harmonizes it. There were negative reviews regarding the capabilities of this AI (e.g. how it ignored basic music composition rules) but although it is not the state of the art - this is my favorite doodle so far.
For more information regarding the AI model: https://magenta.tensorflow.org/coconet

+ Easy way to estimate the integral of a function is to take the mean of the function on many uniformly sampled values. For example, to calculate ? sin(x)dx in range [0,1]  you can import numpy as np; print(np.sin(np.random.rand(10000)).mean()); and the result will be 0.45858..., comparing to the real answer which is 0.45969... (the antiderivative of sin(x) is -cos(x) so in our range the integral equals -cos(1)+cos(0)).  
This is called monte-carlo integration, and can be applied to integrate more complex functions. Also, the estimation can be more accurate as more samples are used (by the weak law of large numbers).

+ How was the black hole imaged, in a nutshell: the size and distance of the black hole requires a telescope the size of ~earth so a network of 10 radio antennas on different locations used together with a VLBI and calibration algorithms to gather lots of data. If we had radio antennas anywhere on earth it would be enough to get the image, but we only have 10 sample points, on a moving planet (so those points turn into splines - still not enough). The data creates a complex set of constrains for many possible images. To choose which to reconstruct from the search space, a model was trained to predict which is the most likely to be of a black hole. Much of the challenge was to avoid biasing the model into synthetic assumptions.

+ Compiler-bombs are small code sources that produce very large compiled files. For the sake of fun only, the goal is to create the smallest source code that will generate more than 4GB of compiled code. We'll start with c. While most of you may think macros will do the trick, a better and shorter bomb can be created by:
echo "main[-1u]={1};" >> bomb.c
gcc -mcmodel=medium bomb.c -o bomb
(don't try at home... or work)
How? It is not mandatory for 'main'  to be a function, but rather exist in the compiled output (here it is an untyped array allowed by c). Regarding the size, since the array is initialized with its first element to 1 and the rest to zero, the compiler actually saves the entire array, at the size of the higher edge of an unsigned int. the mcmodel flag is to allow an array larger than 2GB to be saved in memory without restrictions.
In the next episode: a python's bomb.  credit [https://codegolf.stackexchange.com/questions/69189/build-a-compiler-bomb]

+ As promised, this time we'll build a compiler bomb in python. Python code is compiled into some byte-code which is then executed. Those are the .pyc files that python generates (python3 builds them in __pycache__ dir). Our bomb will be in python3:
echo "(1<<19**8,)*2" > bomb.py
python3 -m py_compile bomb.py
(don't try at home or work)
Explanation: we exploited python3's constant folding that happens as part of its compilation optimizations. This will save the explicit constant number instead of the calculation into the pyc file. 1<<19**8, just below 2**32, is the number with length that is contained by the maximum in python which is 4B. With it, we created 2GB and since tuples are immutable, multiplying them is also calculated in the constant folding therefore we can generate this 4GB pyc.

+ Microsoft is going to release WSL2 in the upcoming June. An integrated linux sub-system inside Windows, that unlike its predecessor, will run with native linux kernel on a lightweight virtual machine. I use WSL(1) quite much (mainly for ssh, small developments, and searching things with grep), and I'm eager to see the next one.

+ Whatsapp had a buffer overflow in their implementation for SRTCP (secure real time transport protocol) used for VOIP (calls). This had been exploited and allowed remote code execution by malware linked to the Israeli NSO. In general, I started convincing my friends into using Telegram. It's not invulnerable and I'm not completely happy with its encryption but at least it doesn't have Facebook behind it and its client app is open sourced. Try it.

+ SpaceX launched 60 small satellites as part of project Starlink, that would eventually supply space based internet telecommunications. This is the first launch out of many - the goal is to get ~12K of those satellites such that they'll cover the entire earth and enable cheap and fast internet connection anywhere. 

+ Yesterday Mr. Y said he has an app that allows him to send WhatsApp messages without having to save the target number as a contact. This is quite useful and there is an easy way to do so without an app: save the link https://api.whatsapp.com/send?phone=972512312328 somewhere in your smartphone (I did it in a Google Keep note). Press it to chat with the number at the end of the link (change it to any number you need).

+ A python's riddle: what will be the output of the following line in python:  True == False in [False] 
Answer: the output is False, it's a bit confusing because you might think that it translates to (True==False) in [False] which is  True, or rather True == (False in [False]) but actually it's translates into  True == False and False in [False] .

+ Our keyboard layout (QWERTY) was actually designed to slow our typing speed. It was firstly used for a manual typing machine that was sensitive for too fast presses as keys jammed together so the layout was developed to create a delay between common keys. With that, I'm so used to this QWERTY layout that even if I change to a faster one (such as Dvorak) I don't think I'll type faster in the first few years.

- To access linux FS from your windows machine, use your linux machine and look for the mountaddress of the mount you need in /proc/mounts/ (e.g. grep "beta/shared" /proc/mounts) . Then use the IP in the windows machine and navigate inside (e.g. \\1.1.1.1\beta\shared\alpha\mr_r).

+ "Magic: the gathering" is a popular card game. Recently, researchers built a reduction from an arbitrary Turing-machine into a legal "Magic" game setup, such that the first player wins if and only if the Turing machine halts - making the game at least as hard as the halting problem. This is the first game that was proven to be undecidable (or harder than NP). Also, it makes "Magic" Turing complete.        [The paper: https://arxiv.org/abs/1904.09828]

+ Scientists from Harvard recently developed a 2cm camera that is sensitive to light polarization. Most of the cameras can only sense light intensities, and using the polarization feature of the light can significantly aid with objects distinguishing and 3D reconstruction.   [reference: https://science.sciencemag.org/content/365/6448/eaax1839]

+ Whatsapp had a buffer overflow in their implementation for SRTCP (secure real time transport protocol) used for VOIP (calls). This had been exploited and allowed remote code execution by malware linked to the Israeli NSO. In general, I started convincing my friends into using Telegram. It's not invulnerable and I'm not completely happy with its encryption but at least it doesn't have Facebook behind it and its client app is open sourced. Try it.

+ SpaceX launched 60 small satellites as part of project Starlink, that would eventually supply space based internet telecommunications. This is the first launch out of many - the goal is to get ~12K of those satellites such that they'll cover the entire earth and enable cheap and fast internet connection anywhere. 

+ The new British £50 note, the highest value for a single note in the British currency, will feature Alan Turing. However, It'll be released in about two years from now. [reference: https://www.telegraph.co.uk/science/2019/07/15/alan-turing-face-new-50-note-first-lgbt-community/]

+ Security researchers from Ben-Gurion university published a paper that describe an attack on Mobileye's ADAS. The attack is based on a drone projecting a spoofed speed traffic sign, in order to make ADAS treat it as the current speed limit. While I'm flattered that they chose our product, I'm not impressed at all. They claim to present "a major threat to autonomous vehicles which rely on these systems". As far as I know, AV won't only rely on vision sensing from TSR to determine the current driving speed, so I don't see this threat as a valid risk. Also, to project a sign with a drone is not very different than just placing a fake traffic sign somewhere. 
[the paper: https://arxiv.org/abs/1906.09765]

+ [https://upload.wikimedia.org/wikipedia/commons/thumb/4/42/Cassandra1.jpeg/800px-Cassandra1.jpeg]
This is Cassandra. She was an oracle in ancient Greece, that was cursed by Apollo such that no one believed her prophecies. She was called after the widely used open-sourced noSQL DB system. The painting itself was drawn by Evelyn De-Morgan, a British painter who is the daughter in law of Augustus De-Morgan - the boolean algebra mathematician that invented De-Morgan rules that we all use.

+ Another article was published that shows an attack on TSR technologies in cars [reference: https://arxiv.org/abs/1907.00374], but this one is interesting because it resulted number of adversary traffic signs that can affect many different cars on different real-world settings (viewing angles, shading and light, etc). Attacking neural network's classifiers is quite a fascinating subject, and if you're interested to know more I once published a short paper (in Hebrew) about it: https://www.digitalwhisper.co.il/files/Zines/0x60/DW96-1-ToasterTruck.pdf .

+ Russell's paradox:  . An example in our terms, assume I have the following policy: I do the code-review for all team-alpha developers who don't do a code-review for themselves, and only for them. Now - what happens when I (an alpha-team member) need a code-review for my merge request? If I'll review myself then under my policy I can't perform the code-review, but if I won't code-review myself I belong to those who should be reviewed by me.
The 'solution' is to allow the definition of sets basing on existing members only.

+ Yesterday Google released an open-sourced android/ios framework for on-device real-time hands tracking and gesture recognition. By 3D reconstructing 21 keypoints of an hand, one of the immediate applications is signal-language understanding (or, live translation of signal-language to speech).

- 'Zao' is a new Chinese app that takes a photo of your face and places it instead of a an actor's face in a short clip (using GAN), and I guess it will spread to Israel soon. As in 'FaceApp', that was popular recently because it generated an image of how would you look when you're old (amazing technology IMO) - sniffing the packets shows that they only take your uploaded photo + metadata on your phone (OS, model, IMEI, etc). With that, I suggest to avoid using this 'Zao' because the uploaded photo (and resulted clip) is accessible to anyone with the link, and also China doesn't have a good reputation for human-rights and privacy defending.

+ Mr. M shared a comic post with me that concluded that the most efficient way to deliver large amounts of data is using butterflies migration that carry DNA encoded information in the capacity of all the internet [1]. Humor aside, it relies and points to an actual academic research of encoding data into DNA, where researchers encoded (and decoded) an operating system with bunch of movies into molecules of DNA [2]. Last week, a paper from the Technion & IDC had been published to Nature and showed an improved method to store information on the DNA medium, making the buzz around the capability for storing YouTube entirely on a spoon [3].
[1] https://blog.xkcd.com/2019/08/26/how-to-send-a-file/
[2] https://science.sciencemag.org/content/355/6328/950
[3] https://www.nature.com/articles/s41587-019-0240-x

+ Image segmentation is the task of assigning a semantic label to each and every pixel in the image. Using neural networks can solve this task, however annotating the training data is a hard task. Therefore, domain-adaptation techniques are used (e.g. taking data+trained net for daylight scenes and training it to segment night scenes without any new labeled data). The current state of the art DA method is bidirectional-learning, where, among other things, the researchers took synthetic data from the video game GTA 5 and adapted it to CityScapes benchmark (real world urban images) and reached 91% accuracy of road identification![ reference: https://arxiv.org/abs/1904.10620 ] 

+ Using free spotify and annoyed by the advertisements for simpletons? My solution is to automatically set spotify to mute while it is playing an advertisement, and unmute when it is back to playing music. You can do that using javascript code that will check every half-second if the next button is disabled, then virtually click on the mute button, and vice versa. Run this automatically when you're on spotify's domain with a browser extension (such as TamperMonkey).  A less interesting solution is to pay for spotify premium and condemn piracy.

+ When visualizing data by generating an image we sometimes use color maps to enrich our perception but it could lead to false conclusions. For example, depth estimations or 'images' from lidar are originally gray (every pixel has intensity that describes its distance from the sensor) - and when visualizing them with a rainbow color map there might be artificial edges due to the color spectrum. See how the light-blue or bright yellow form a detectable 'edge' in the following spectrum: [Jet color map]
That's why special color maps such as Turbo developed, that still gives rich representation of colors and still avoid those artificial edges: [Turbo color map]

+ Python 3.8 had been released last week. Some of the new features: the walrus operator (:=) to assign partial expression outcome for later use in the larger expression, improvements for some modules (such as for type-hinting or asyncio), an addition of metadata module for importlib package (which will hopefully aid a bit with solving the modules-importing problems that I've encountered many times).

+ Google achieved "quantum supremacy", which means that they successfully ran a benchmark computation that should take ~10,000 years with the strongest supercomputer by ~200 seconds with their programmable superconducting quantum processor. Although the benchmark result takes that much time to achieve with traditional methods, it was design so that we can still validate its correctness.  With that, IBM says that Google overestimated their success and that using optimization methods and special hardware for the benchmark test would take the best traditional supercomputer about 3 days, but Google basically replied that IBM should try to do it before claiming that. The paper was published a week ago on Nature [https://www.nature.com/articles/s41586-019-1666-5], but was leaked about a month beforehand via NASA's website.

+ Scientists had discovered a way to turn carbon-dioxide into methanol in a cheap way that requires cuprous-oxide, water, and light. Thus, inventing an "artificial leaf" that turns CO2 into an alternative fuel (much like a leaf that, given light and water, turns CO2 to glucose for fueling itself). Hopefully, This would help slowing the climate change and supply green fuel while doing so.
[ reference: https://www.nature.com/articles/s41560-019-0490-3 ]

+ A paper from Haifa University shows a method to recover the true colors of underwater scenes, and by that removing the underwater "effect" and making the photos look as if they were pictured above surface. This method works a machine-learning model that is given with multiple photos of the same scene from different angles and distances, and produces the color recovery by estimating the haze back-scatter and light scatter in the 3D scene.
[ reference: http://openaccess.thecvf.com/content_CVPR_2019/papers/Akkaynak_Sea-Thru_A_Method_for_Removing_Water_From_Underwater_Images_CVPR_2019_paper.pdf ]

+ Credit to Ms. S-A.: researchers at Tokyo university demonstrated the ability to dynamically project 8-bit video on non-rigid surface (e.g. a shirt of a walking man). It looks cool, as if the surface itself has the video implemented (see the demo in the reference link). For that, they used a 8-bit image projector that can work at 1000 fps with 3 ms delay, along with a camera and a fast tracking algorithm of infra-red dot markers that are invisibly drawn on the surface.
[ reference: http://www.k2.t.u-tokyo.ac.jp/vision/DPM/ ]

+ Russian researchers reconstructed viewed/imagined images from brain waves. This ability that sounds like thoughts-reading is very fascinating but it is far from what they've accomplished. They trained neural networks that received EEG outputs, extracted the features from them and then a decoder-generator to receive this latent representation and reconstruct images. However, it is limited to a small predefined set of categories, and requires the participant to view them on real time.
[ reference: https://www.biorxiv.org/content/10.1101/787101v3.full ]

+ In re:Invent, Amazon announced "AWS DeepComposer" [1] which is a piano-keyboard designed for developers to educate about machine-learning. The user can play a melody with the keyboard, then it's uploaded to the aws cloud where GAN is applied to add other tracks (e.g. bass, synth, drums, etc) that fits the melody. The idea is similar to that in the doodle of Bach [2] but hopefully improved. And.. during the conference, Mr. M got one of these!
[0] - https://aws.amazon.com/deepcomposer/
[1] - https://www.google.com/doodles/celebrating-johann-sebastian-bach

+ The mantis shrimp is a magnificent animal. First, its eye-sight is considered to be the most evolved among creatures: each of his eyes is independent and separated to 3 independent components, making each single eye trinocular with depth perception. Also - its eyes can distinguish 12 different wavelengths (including polarized light and ultra violet), compared to us humans that can distinguish 3 ( R/G/B ). In addition to the eyes, it has special claws that allow it to attack its prey in a speed of ~83 KM/h (from standing). This is so powerful that water evaporate around it causing a shock wave shooting force of ~1500 newtons.

+ The three-body problem is an old physics question of predicting the movements of a system containing three bodies (e.g. the sun, earth and moon). Turns out it is a chaotic system which is hard to predict. Recently I encountered two papers about it: first, researchers from the Hebrew University and Colombia University claimed to find a statistical solution to this problem [0]. Second, another group from 4 universities claimed to train a neural network that is able of predicting 3-body systems up to 100 million times faster than any previous computer simulation [1]. 
references:
[0] https://www.nature.com/articles/s41586-019-1833-8#Abs1
[1] https://arxiv.org/abs/1910.07291

+ Researchers from Michigan University discovered a way to modulate light such that a microphone receives an acoustic signal. Practically, they demonstrated that by making Google's Home & Apple's Siri & Amazon's Alexa to respond to "voice commands" sent from another building, by aiming laser at the devices' mic. They exploited this vulnerability in some of those smart-home devices to unlock doors without anything but visual sight of the device (using a telescope). 
[ reference: https://lightcommands.com/20191104-Light-Commands.pdf ]

+ In a kind of opposite to the last, researcher from the Hebrew University had developed a way (in 2002..) to retrieve the music from a vinyl record based on image scan of that record. [reference: https://www.cs.huji.ac.il/~springer/DigitalNeedle/index.html].

+ GPT-2 is a transformer-based language model trained on 8 million web-pages so that it could predict the next word given a sequence of text. However, although its purpose was essay generation, a ML researcher thought of GPT-2 as a general pattern-recognition program with text-based I/O. Surprisingly, it was kind of working - he trained GPT-2 on musical notes translated to ASCII, and GPT-2 generated nice music. Or, GPT-2 was trained on textual representation of many chess games (the text contains only moves, for each turn a source and destination x,y) and GPT-2 could play chess - but not that good (probably because it needs to reconstruct the state of the game-map). 
[ reference: https://slatestarcodex.com/2020/01/06/a-very-unlikely-chess-game/?fbclid=IwAR1ylv16xb36dr5fTUN3ETzTi9JI7SyNCfjy8TUWc_nCxhVcxFZY1-KemLA ]

+ An oscilloscope is a device that visualizes voltage over time or over other voltage source, mainly used for debugging electrical devices or circuits. In addition to it original purpose, one can also generate special electrical signals in such way to draw things on the oscilloscope. For example, a sine signal of changing voltage by that function will show a wave of sine on the screen (and you can "hear what you see"). However much more complex drawings can be done, e.g. a forest of dancing mushrooms. See the following video to hear what a dancing mushroom sounds like: https://www.youtube.com/watch?v=rtR63-ecUNo

+ Everything in python is an object (primitives, functions, etc). Many objects are instances of a classes, but classes themselves are instances of metaclasses. When you state `class A: ` it's translated to a call to the builtin function type, a metaclass that returns a class. You can modify a the metaclass of a class (e.g. as done for abstract classes via ABC). In addition, type can be used to dynamically create classes. So everything is an object, which is either an instance of a class or an instance of a metaclass. The only exception is type. type is its own metaclass (a "metametaclass"), and that's done by a special condition in the implementation of CPython.
[ reference: https://docs.python.org/3/reference/datamodel.html#metaclasses ]

+ Researchers from Facebook introduced a technique to mark parts of a training dataset as 'radioactive' (adding crafted noise) and thus identify what data was used to train some machine learning model, without affecting the accuracy of the model. That is, given a blackbox trained model, they can check whether it was trained on some specific dataset they previously made radioactive. This can protect datasets from misuse, help identifying bias in trained models, and aid researching/debugging neural networks.
[ reference: https://ai.facebook.com/blog/using-radioactive-data-to-detect-if-a-data-set-was-used-for-training/ ]

+ Deep quantum neural networks, apart from a nice combination of buzz words, is researched nowadays as a preparation toward the overcoming of the thermodynamical limits of computation in classical machine learning. The idea is to have an NN architecture composed of quantum neurons - qurons that is trainable. The referenced research introduces a quantum training method that theoretically can make a model generalize from significantly less data and be robust to noisy training data as well.
[ reference: https://www.nature.com/articles/s41467-020-14454-2 ]

+ Ground-penetrating-radar can be used to allow good localization of a vehicle in mapped areas under any weather conditions (except earthquakes!). At first researched by MIT, then progressed to a commercial company called WaveSense - it provides an accurate localization up to 4cm in real time using the signals of the underground geological features, compared to a baseline of mapped areas (e.g. be used for REM/AV). 
[ reference: https://archive.ll.mit.edu/publications/technotes/LGPR.html ]

+ Lately I hear more and more about "Transformer", an ML model used for NLP. Basically, it is a composition of encoder-decoder networks with self-attention layers, that can handle sequence information in parallel. Recently, "T5" was published- a large transformer (~10^10 parameters) that was fine-tuned to many different NLP tasks such as translation, summarization, question answering, sentiment analysis and more. Trained on a large corpus scraped from internet pages (filtered to high quality text only- ~750GB), T5 could succeed in so many tasks by applying transfer-learning to a text-to-text problem domain from each of these tasks.
[ reference: https://ai.googleblog.com/2020/02/exploring-transfer-learning-with-t5.html ]

+ A group called SurfingAttack introduced a method of transmitting ultrasonic voice commands to smartphones that are placed on a table, through a disc that is attached underneath the table. While the attack itself doesn't seem very risky in my opinion, the idea to transmit the voice commands via solid materials instead of the air is nice, and since it's ultrasonic it's hard to detect (until the smartphone acknowledges).
[ reference: https://surfingattack.github.io/papers/NDSS-surfingattack.pdf ]
