Some electronic music implemented in BQN with [BQNoise](https://github.com/mlochbaum/BQNoise).

Runs with [dzaima/BQN](https://github.com/dzaima/BQN). See config.bqn to configure paths.

There are ports of material previously written in J as well as newer music and edits made with BQN. To compose I run a program that plays the output file in an endless loop, and write the output file to change what's playing (it's important to put it in a tmpfs directory like /tmp to avoid hitting the disk here). I keep a dzaima/BQN session open with run.bqn loaded to re-run only the necessary lines: for example, initialize with `run ← ⟨"g.bqn"⟩ •Import "/path/to/Music/run.bqn"` and reload with `Run@`. I hope to eventually get the tooling in a usable state so it can be added here, and to add some scripts that are better for learning BQN and/or synthesis.

To avoid confusion, the BSD-0 license for this repository applies to musical content as well as code. If while working with these scripts you somehow produce something you'd feel okay about publishing, you have no need to fear any copyright claims from me.
