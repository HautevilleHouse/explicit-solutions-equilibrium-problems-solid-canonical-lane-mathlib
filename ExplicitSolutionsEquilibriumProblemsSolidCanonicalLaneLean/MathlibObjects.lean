import ExplicitSolutionsEquilibriumProblemsSolidCanonicalLaneLean.TheoremStatement
import CanonicalLaneMathlibCore

namespace HautevilleHouse
namespace ExplicitSolutionsEquilibriumProblemsSolidCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure SolidEquilibriumSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure SolidEquilibriumAdmittedObject where
  space : SolidEquilibriumSpace
  equilibriumCondition : Prop
  solutionStable : Prop
  solutionModel : Type
  modelTopology : TopologicalSpace solutionModel
  explicitSolution : Prop
  conclusion : explicitSolution

structure SolidEquilibriumEndgameState where
  object : SolidEquilibriumAdmittedObject

def SolidEquilibriumWitnessClosed (O : SolidEquilibriumAdmittedObject) : Prop :=
  O.explicitSolution

end ExplicitSolutionsEquilibriumProblemsSolidCanonicalLaneLean
end HautevilleHouse
