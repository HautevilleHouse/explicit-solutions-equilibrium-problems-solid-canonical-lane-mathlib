import ExplicitSolutionsEquilibriumProblemsSolidCanonicalLaneLean.AdmissibleClass
import ExplicitSolutionsEquilibriumProblemsSolidCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace ExplicitSolutionsEquilibriumProblemsSolidCanonicalLaneLean

structure TheoremStatement where
  sourceKey : String
  theoremName : String
  theoremObject : String
  classicalBoundary : String
  equilibriumConstrainedStatement : String
  certificateLane : String
  carriedRemainder : String

deriving Repr, DecidableEq

end ExplicitSolutionsEquilibriumProblemsSolidCanonicalLaneLean
end HautevilleHouse
