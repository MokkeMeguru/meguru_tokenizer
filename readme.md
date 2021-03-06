# meguru tokenizer

# installation and initialization

```shell
pip install meguru_tokenizer
sudachipy link -t full
```

# Abstruction of Usage

1.  Preprocess Using Each Tokenizer
    e.g. sentencepiece preprocess / sudachi preprocess
2.  Tokenize in your code using its Tokenizer
    - basis    
      see. [official docs](https://mokkemeguru.github.io/meguru_tokenizer/index.html)
    - Tensorflow    
	  see. [tutorial](./tutorials/01_tokenize_tf.ipynb)
    - TODO: PyTorch

# RealWorld Example

```python
import meguru_tokenizer.whitespace_tokenizer import WhitespaceTokenizer
import pprint

sentences = [
    "Hello, I don't know how to use it?",
    "Tensorflow is awesome!",
    "it is good framework.",
]

# define tokenizer and vocaburary
tokenizer = WhitespaceTokenizer(lower=True)
vocab = Vocab()

# build vocaburary
for sentence in sentences:
    vocab.add_vocabs(tokenizer.tokenize(sentence))
vocab.build_vocab()

# set vocaburary into tokenizer to enable encoding
tokenizer.vocab = vocab

# save vocaburary information
vocab.dump_vocab(Path("vocab.txt"))
print("vocabs:")
pprint.pprint(vocab.i2w)

# tokenize
print("tokenized sentence")
pprint.pprint(tokenizer.tokenize_list(sentences))

# [['hello', ',', 'i', 'do', "n't", 'know', 'how', 'to', 'use', 'it', '?'],
#  ['tensorflow', 'is', 'awesome', '!'],
#  ['it', 'is', 'good', 'framework', '.']]

# encode
print("encoded sentence")
pprint.pprint([tokenizer.encode(sentence) for sentence in sentences])

# [[7, 8, 9, 10, 11, 12, 13, 14, 15, 5, 16], [17, 6, 18, 19], [5, 6, 20, 21, 22]]

print("decoded sentence")
pprint.pprint([tokenizer.decode(tokens) for tokens in encodes])
# ["hello , i do n't know how to use it ?",
#  'tensorflow is awesome !',
#  'it is good framework .']

vocab_size = len(vocab)

# restore the vocaburary from dumped file
print("reload from dump file")
vocab = Vocab()
vocab.load_vocab(Path("vocab.txt"))
assert vocab_size == len(vocab)

tokenizer = WhitespaceTokenizer(vocab=vocab)
pprint.pprint([tokenizer.encode(sentence) for sentence in sentences])

# [[7, 8, 9, 10, 11, 12, 13, 14, 15, 5, 16], [17, 6, 18, 19], [5, 6, 20, 21, 22]]

# vocaburary with minimum frequency limitation
vocab = Vocab()
for sentence in sentences:
    vocab.add_vocabs(tokenizer.tokenize(sentence))
vocab.build_vocab(min_freq=2)
assert vocab_size != len(vocab)

# vocaburary with maximum voaburary size
vocab = Vocab()
for sentence in sentences:
    vocab.add_vocabs(tokenizer.tokenize(sentence))
vocab.build_vocab(vocab_size=10)
assert 10 == len(vocab)
```
