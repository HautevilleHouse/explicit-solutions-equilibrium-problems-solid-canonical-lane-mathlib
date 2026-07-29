import ExplicitSolutionsEquilibriumProblemsSolidCanonicalLaneLean.ExplicitSolutionTheoremStatement
import CanonicalLaneMathlibCore
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace ExplicitSolutionsEquilibriumProblemsSolidCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure ExplicitSolutionSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure EquilibriumAdmittedObject where
  space : ExplicitSolutionSpace
  eqSystem : Prop
  equilibriumExplicitlySolved : Prop
  solutionModel : Type
  solutionTopology : TopologicalSpace solutionModel
  solutionExplicitlyClosed : Prop
  conclusion : solutionExplicitlyClosed

structure EquilibriumEndgameState where
  object : EquilibriumAdmittedObject

def EquilibriumWitnessClosed (O : EquilibriumAdmittedObject) : Prop :=
  O.solutionExplicitlyClosed

end ExplicitSolutionsEquilibriumProblemsSolidCanonicalLaneLean
end HautevilleHouse
