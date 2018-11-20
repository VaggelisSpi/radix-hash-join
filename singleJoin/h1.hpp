#include "structs.hpp"

uint64_t h1(uint64_t value);
uint64_t * calculateHistogram(Relation * rel);
uint64_t * calculateStartingPositions(uint64_t * histogram);
void printHistogram(uint64_t * histogram);
Relation * order(Relation * rel, uint64_t * startingPositions);
Relation * bucketify(Relation * rel,
                  uint64_t ** histogram,
                  uint64_t ** startingPositions);