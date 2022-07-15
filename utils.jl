using StatsModels: @formula
import StatsModels as sm

""" Equivalent to modelmatrix but returns a DataFrame"""
function modelframe(formula::sm.FormulaTerm, data)
    f = formula
    f = sm.apply_schema(f, sm.schema(f, data))
    resp, pred = sm.modelcols(f, X);
    DataFrame(pred, sm.coefnames(f)[2])
end