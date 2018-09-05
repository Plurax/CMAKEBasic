#include "catch.hpp"
#include "PROJECTNAME/BaseClass.h"
#include "string.h"

using namespace std;

TEST_CASE( "PROJECTNAME BaseClass Method tests", "[PROJECTNAMEBaseClass]" ) {

  BaseClass cl;

  SECTION("Method one returns 1") {
    REQUIRE( (cl.one()) == 1);
  }
}
