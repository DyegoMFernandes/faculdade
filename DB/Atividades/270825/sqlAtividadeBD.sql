create view v_notasalunos as
SELECT notas.nota_id,
		alunos.alu_nome,
        notas.at_id,
        notas.notas_valor
	FROM notas
    left join alunos on (alunos.alu_id = notas.alu_id);