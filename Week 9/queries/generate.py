questions = []
for i in range(1, 49):
    answer = open(f'{i}.sql', 'r').read()
    questions.append(f'-- Question {i}\n{answer}\n\n')
open('prac.sql', 'w').writelines(questions)