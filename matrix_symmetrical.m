function  sym = matrix_symmetrical(A)
    model1 = 0.5*(A+A');
    model2 = (A*A')^0.5;
    model3 = (A'*A)^0.5;
    eig_A = mean(eig(A));
    eig_model1 = mean(eig(model1));
    eig_model2 = mean(eig(model2));
    eig_model3 = mean(eig(model3));
    delta_model1 = abs(eig_model1 - eig_A);
    delta_model2 = abs(eig_model2 - eig_A);
    delta_model3 = abs(eig_model3 - eig_A);
    switch min([delta_model1 delta_model2 delta_model3])
        case delta_model1
            sym = model1;
        case delta_model2
            sym = model2;
        case delta_model3
            sym = model3;
    end
end