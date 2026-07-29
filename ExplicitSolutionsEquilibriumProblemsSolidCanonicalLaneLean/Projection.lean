import ExplicitSolutionsEquilibriumProblemsSolidCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace ExplicitSolutionsEquilibriumProblemsSolidCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

def equilibriumProjection : Projection SolidEquilibriumEndgameState :=
  { toFun := fun x => x,
    idempotent := by intro x; rfl
  }

theorem equilibrium_projection_idempotent (x : SolidEquilibriumEndgameState) :
    equilibriumProjection.toFun (equilibriumProjection.toFun x) = equilibriumProjection.toFun x := by
  exact equilibriumProjection.idempotent x

end ExplicitSolutionsEquilibriumProblemsSolidCanonicalLaneLean
end HautevilleHouse
