import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ExplicitSolutionsEquilibriumProblemsSolidCanonicalLaneLean

structure BoundaryValueSolverPackage where
  domain : Type u
  differentialOperator : (domain -> ℝ) -> (domain -> ℝ)
  boundaryCondition : (domain -> ℝ) -> Prop
  solutionExistence : Prop
  solutionUniqueness : Prop

structure BoundaryValueSolverEvidence (B : BoundaryValueSolverPackage) where
  solutionExistenceClosed : B.solutionExistence
  solutionUniquenessClosed : B.solutionUniqueness

def BoundaryValueSolverClosed (B : BoundaryValueSolverPackage) : Prop :=
  B.solutionExistence ∧ B.solutionUniqueness

theorem boundary_value_solver_closed_from_evidence (B : BoundaryValueSolverPackage)
    (E : BoundaryValueSolverEvidence B) : BoundaryValueSolverClosed B := by
  exact And.intro E.solutionExistenceClosed E.solutionUniquenessClosed

end ExplicitSolutionsEquilibriumProblemsSolidCanonicalLaneLean
end HautevilleHouse
