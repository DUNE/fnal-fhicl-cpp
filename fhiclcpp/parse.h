#ifndef FHICLCPP_PARSE_H
#define FHICLCPP_PARSE_H

// ======================================================================
//
// parse
//
// ======================================================================

#include "cetlib/filepath_maker.h"
#include "fhiclcpp/fwd.h"
#include <istream>
#include <sstream>
#include <string>

namespace fhicl {

  bool
    parse_value_string( std::string const & s
                      , extended_value    & v
                      , std::string       & unparsed
                      );

  void
    parse_document( std::string const   & filename
                  , cet::filepath_maker & maker
                  , intermediate_table  & result
                  );

  void
    parse_document( std::istream        & is
                  , cet::filepath_maker & maker
                  , intermediate_table  & result
                  );

  inline void
    parse_document( std::string const  & s
                  , intermediate_table & result
                  )
  {
    std::istringstream is(s);
    cet::filepath_maker m;
    parse_document(is, m, result);
  }

  // backwards compatibility only; function name is deprecated
  inline bool
    parse_value( std::string const & s
               , extended_value    & v
               , std::string       & unparsed
               )
  { return parse_value_string(s, v, unparsed); }

}  // namespace fhicl

// ======================================================================

#endif
