import re

with open('/home/liaowenjie/.openclaw-multi/shared/paper-project-2/final/paper.tex', 'r', encoding='utf-8') as f:
    text = f.read()

text = text.replace('Consequently, the generated signals', 'As a result, the generated signals')
text = text.replace('Consequently, the synthesized', 'This leads to the synthesized')
text = text.replace('Consequently, deep learning', 'Therefore, deep learning')

text = text.replace('Conversely, signal processing', 'In contrast, signal processing')
text = text.replace('Conversely, samples drawn', 'On the other hand, samples drawn')

text = text.replace('Subsequently, we explore', 'Following this stage, we explore')

text = text.replace('Finally, conclusions are drawn', 'Lastly, conclusions are drawn')
text = text.replace('Finally, we examine', 'As a culmination, we examine')
text = text.replace('Finally, a Bayesian Embedding', 'In the final stage, a Bayesian Embedding')

# Since "Initially" was not in the text but "First" was used in the same context:
text = text.replace('First, a Physics-Informed', 'As the first step, a Physics-Informed')
text = text.replace('We first briefly discuss', 'To begin with, we briefly discuss')

with open('/home/liaowenjie/.openclaw-multi/shared/paper-project-2/final/paper.tex', 'w', encoding='utf-8') as f:
    f.write(text)

print("Done")
