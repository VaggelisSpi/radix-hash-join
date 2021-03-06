CC = g++
OBJS = main.o ./join/memmap.o ./join/stringList.o \
		./join/parse.o ./join/inputManager.o ./join/stats.o \
		./join/intermediate.o ./join/predicates.o \
		./singleJoin/h1.o ./singleJoin/h2.o ./singleJoin/join.o \
		./singleJoin/structs.o ./singleJoin/result.o ./threads/jobs.o \
		./threads/scheduler.o ./threads/threads.o ./join/optimizer.o
SERIAL_OBJS = ./singleJoin/h1.o ./singleJoin/h2.o ./singleJoin/join.o \
		./singleJoin/structs.o ./singleJoin/result.o ./threads/jobs.o\
		./threads/scheduler.o ./threads/threads.o ./testMain/serialJoin.o
ODD_EVEN_OBJS = ./singleJoin/h1.o ./singleJoin/h2.o ./singleJoin/join.o \
		./singleJoin/structs.o ./singleJoin/result.o ./threads/jobs.o\
		./threads/scheduler.o ./threads/threads.o ./testMain/oddEvenJoin.o
RANDOM_OBJS = ./singleJoin/h1.o ./singleJoin/h2.o ./singleJoin/join.o \
		./singleJoin/structs.o ./singleJoin/result.o ./threads/jobs.o\
		./threads/scheduler.o ./threads/threads.o ./testMain/randomJoin.o
RESULT_OBJS = ./singleJoin/result.o ./testMain/resultTest.o \
			 ./singleJoin/structs.o ./join/intermediate.o
PARSE_OBJS = ./testMain/testParse.o ./join/parse.o
FILTER_OBJS = testMain/filterTest.o ./join/memmap.o ./join/stringList.o ./join/parse.o \
		./singleJoin/result.o ./singleJoin/structs.o ./join/inputManager.o \
		./join/intermediate.o ./join/predicates.o
SELF_JOIN_OBJS = testMain/selfJoinTest.o ./join/memmap.o ./join/stringList.o \
		./join/parse.o ./join/inputManager.o \
		./join/intermediate.o ./join/predicates.o \
		./singleJoin/h1.o ./singleJoin/h2.o ./singleJoin/join.o \
		./singleJoin/structs.o ./singleJoin/result.o ./threads/jobs.o \
		./threads/scheduler.o ./threads/threads.o
PARSER_OBJS = testMain/parserTest.o  ./join/memmap.o ./join/stringList.o ./join/parse.o \
		./singleJoin/result.o ./singleJoin/structs.o ./join/inputManager.o \
		./join/intermediate.o ./join/predicates.o

FLAGS = -g3 -Wall -O2 -std=c++11 -lm -pthread

all:$(OBJS)
	$(CC) -o main $(OBJS) $(FLAGS)

./join/stringList.o:./join/stringList.cpp
	$(CC) -c ./join/stringList.cpp $(FLAGS) -o ./join/stringList.o

./join/memmap.o:./join/memmap.cpp
	$(CC) -c ./join/memmap.cpp $(FLAGS) -o ./join/memmap.o

./join/inputManager.o:./join/inputManager.cpp
	$(CC) -c ./join/inputManager.cpp $(FLAGS) -o ./join/inputManager.o

./join/predicates.o:./join/predicates.cpp
	$(CC) -c ./join/predicates.cpp $(FLAGS) -o ./join/predicates.o

./join/intermediate.o:./join/intermediate.cpp
	$(CC) -c ./join/intermediate.cpp $(FLAGS) -o ./join/intermediate.o

./join/stats.o:./join/stats.cpp
	$(CC) -c ./join/stats.cpp $(FLAGS) -o ./join/stats.o

./singleJoin/h1.o:./singleJoin/h1.cpp
	$(CC) -c ./singleJoin/h1.cpp $(FLAGS) -o ./singleJoin/h1.o

./singleJoin/h2.o:./singleJoin/h2.cpp
	$(CC) -c ./singleJoin/h2.cpp $(FLAGS) -o ./singleJoin/h2.o

./singleJoin/join.o:./singleJoin/join.cpp
	$(CC) -c ./singleJoin/join.cpp $(FLAGS) -o ./singleJoin/join.o

./singleJoin/result.o:./singleJoin/result.cpp
	$(CC) -c ./singleJoin/result.cpp $(FLAGS) -o ./singleJoin/result.o

main.o:main.cpp
	$(CC) -c main.cpp $(FLAGS) -o main.o

./singleJoin/structs.o:./singleJoin/structs.cpp
	$(CC) -c ./singleJoin/structs.cpp $(FLAGS) -o ./singleJoin/structs.o

serialJoin:$(SERIAL_OBJS)
	$(CC) -o serialJoin $(SERIAL_OBJS) $(FLAGS)

./testMain/serialJoin.o:./testMain/serialJoin.cpp
	$(CC) -c ./testMain/serialJoin.cpp $(FLAGS) -o ./testMain/serialJoin.o

oddEvenJoin:$(ODD_EVEN_OBJS)
	$(CC) -o oddEvenJoin $(ODD_EVEN_OBJS) $(FLAGS)

./testMain/oddEvenJoin.o:./testMain/serialJoin.cpp
	$(CC) -c ./testMain/oddEvenJoin.cpp $(FLAGS) -o ./testMain/oddEvenJoin.o

randomJoin:$(RANDOM_OBJS)
	$(CC) -o randomJoin $(RANDOM_OBJS) $(FLAGS)

./testMain/randomJoin.o:./testMain/randomJoin.cpp
	$(CC) -c ./testMain/randomJoin.cpp $(FLAGS) -o ./testMain/randomJoin.o

resultTest:$(RESULT_OBJS)
	$(CC) -o resultTest $(RESULT_OBJS) $(FLAGS)

./testMain/resultTest.o:./testMain/resultTest.cpp
	$(CC) -c ./testMain/resultTest.cpp $(FLAGS) -o ./testMain/resultTest.o

filterTest:$(FILTER_OBJS)
	$(CC) -o filterTest $(FILTER_OBJS) $(FLAGS)

./testMain/filterTest.o:./testMain/filterTest.cpp
	$(CC) -c ./testMain/filterTest.cpp $(FLAGS) -o ./testMain/filterTest.o

selfJoinTest:$(SELF_JOIN_OBJS)
	$(CC) -o selfJoinTest $(SELF_JOIN_OBJS) $(FLAGS)

./testMain/selfJoinTest.o:./testMain/selfJoinTest.cpp
	$(CC) -c ./testMain/selfJoinTest.cpp $(FLAGS) -o ./testMain/selfJoinTest.o

./testMain/testParse.o:./testMain/testParse.cpp
	$(CC) -c ./testMain/testParse.cpp $(FLAGS) -o ./testMain/testParse.o

testParse:$(PARSE_OBJS)
	$(CC) -o testParse $(PARSE_OBJS) $(FLAGS)

./testMain/parserTest.o:./testMain/parserTest.cpp
	$(CC) -c ./testMain/parserTest.cpp $(FLAGS) -o ./testMain/parserTest.o

parserTest:$(PARSER_OBJS)
	$(CC) -o parserTest $(PARSER_OBJS) $(FLAGS)

./join/parse.o:./join/parse.cpp
	$(CC) -c ./join/parse.cpp $(FLAGS) -o ./join/parse.o

./threads/jobs.o:./threads/jobs.cpp
	$(CC) -c ./threads/jobs.cpp $(FLAGS) -o ./threads/jobs.o

./threads/scheduler.o:./threads/scheduler.cpp
	$(CC) -c ./threads/scheduler.cpp $(FLAGS) -o ./threads/scheduler.o

./threads/threads.o:./threads/threads.cpp
	$(CC) -c ./threads/threads.cpp $(FLAGS) -o ./threads/threads.o

./join/optimizer.o:./join/optimizer.cpp
	$(CC) -c ./join/optimizer.cpp $(FLAGS) -o ./join/optimizer.o

clean:
	rm -rf ./*/*.o *.o ./*/*/*.o a.out main randomJoin serialJoin testParse \
		oddEvenJoin resultTest ./*/*.gch *.gch ./*/*/*.gch filterTest parserTest \
		selfJoinTest
