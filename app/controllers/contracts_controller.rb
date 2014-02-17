class ContractsController < ApplicationController
  before_action :set_pupil, only: [:download]

  def index
    authorize! :manage, Pupil
    @pupils = Pupil.enrolled
  end

  def download
    authorize! :manage, Pupil
    filename = "contrato_#{@pupil.first_name.downcase}_#{@pupil.last_name.downcase}.pdf"
    generate_pdf(filename, @pupil)
    send_file("#{Rails.root}/#{filename}", filename: filename, type: "application/pdf")
  end

  private
    def set_pupil
      @pupil = Pupil.find(params[:contract_id])
    end

    # def modality_params
    #   params.require(:modality).permit(:name, :description)
    # end

    def generate_pdf(filename, pupil)
      Prawn::Document.generate(filename) do
        text "CONTRATO DE PRESTAÇÃO DE SERVIÇOS EDUCACIONAIS EM DANÇA"
        text "Dados do Contratante"
        text "Aluno: #{pupil.first_name} #{pupil.last_name}"
        text "Contratante: #{pupil.first_name} #{pupil.last_name}"
        text "Endereço: #{pupil.user.try(:street)}, #{pupil.user.try(:district)}, " +\
          "#{pupil.user.try(:city)}, #{pupil.user.try(:state)}, #{pupil.user.try(:zip_code)}"
        text "CPF: #{pupil.user.try(:cpf)} RG: #{pupil.user.try(:rg)}"
        text "Telefone(s): #{pupil.user.phone_numbers.collect { |p| p.number }}"
        text "E-mail: #{pupil.user.try(:email)}"
        text "Dados do Contratado"
        text "ESPAÇO DANÇAS MANÁ, localizado na Rua 58, Quadra 47, Casa 02, Vinhais, São Luís/MA," +\
          "inscrito no CNPJ nº 10.724.129/0001-04, representada por DYANNE MIRELLE BARBOSA SANTANA" +\
          "portadora do CP F nº 074.016.854-18."
        text "DO OBJETO E DAS CONDIÇÕES"
        text "Cláusula 1º: A Contratante firma com o Contratado a matrícula no(s) curso(s) de: BALLET CLÁSSICO (____); DANÇA CONTEMPORÂNEA (____); SAPATEADO (____); ALONGAMENTO (____); JAZZ (____); DANÇA DE SALÃO (____); DANÇA DE RUA (____); DANÇA DO VENTRE (____); DANÇA SENSUAL (____)."
        text "Cláusula 2ª: O presente contrato compreende apenas a prestação de serviços educacionais em dança, não estão incluídos no valor deste curso: taxa de exames; outros cursos extracurriculares; materiais; uniformes; figurinos; dentre outros materiais e serviços, que serão cobrados separadamente pelo Contratado."
        text "Cláusula 3ª: Os cursos oferecidos pelo Contratado terão duração de ___ (______) meses, de ___________ à ___________ de 2013, assim como o presente contrato."
        text "Cláusula 4ª: A formação e a continuidade das turmas dos cursos oferecidos pelo Contratado dependerá do número mínimo de alunos de _____ por turma, a serem preenchidos dentro do prazo máximo de 2 (dois) meses, contados a partir do início das atividades."
        text "§1º: O não atingimento do número mínimo de alunos por turma implicará no remanejamento do aluno para outra turma compatível em nível, carga horária e preço, de acordo com o interesse do Contratante."
        text "§2º: Caso não seja de interesse do Contratante fazer o remanejamento na hipótese do parágrafo anterior, este poderá requerer o cancelamento da sua matrícula sem o pagamento de qualquer multa contratual, desde que este requerimento ocorra antes da data de vencimento da mensalidade."
        text "Cláusula 5ª: A Contratada se obriga a oferecer ao Contratante apenas as aulas especificadas na carga horária e nos horários definidos na tabela em anexo."
        text "§1º: A reposição de aulas perdidas só será possível se houver vaga em outra turma em nível compatível aquele cursado pelo Contratante. Caso contrário o Contratante não terá direito a repor a aula."
        text "§2º: Os alunos horistas poderão remarcar as aulas com até 5 (cinco) horas de antecedência do horário previamente marcado."
        text "§3º: O aluno horista que não remarcar a aula no prazo estabelecido no parágrafo anterior perderá o direito de repor a aula previamente marcada."
        text "Cláusula 6ª: O contrato de prestação de serviço é personalíssimo em relação ao aluno acima discriminado."
        text "Cláusula 7ª: O curso contratado não possui diplomação."
        text "Cláusula 8ª: O Contratante aceita os programas de ensino adotados, acatando o regimento interno do Contratado, normas disciplinares e o agrupamento dos alunos de acordo como o seu nível técnico."
        text "DO PAGAMENTO DA COBRANÇA"
        text "Cláusula 9ª: O curso tem o custo total de R$ __________ (_______________________________________).Parágrafo Único: O valor curso pode ser pago em até ___ (_______) parcelas de __________(_________________________)"
        text "Cláusula 10ª: A cobrança tanto das parcelas quanto do valor total do curso será feita por meio de boleto bancário."
        text "§1º: O(s) boleto(s) pode(m) ser pago(s) na própria sede da Contratada: em espécie e em cartão na modalidade débito. As modalidades aqui descritas não excluem as outras disponibilizadas pela instituição financeira que emite o boleto de cobrança."
        text "§2º: O pagamento no cartão na modalidade crédito é apenas permitido para o pagamento integral do valor do curso."
        text "§3°: O pagamento da mensalidade em espécie e dentro da data do vencimento confere ao aluno desconto de 4% na mesma."
        text "§4°: O pagamento integral do valor do curso pago em espécie confere ao aluno desconto de 5%."
        text "Cláusula 11ª: O Contratante deseja pagar o curso em (____) parcela(s) de R$ __________ (_______________________________) e estabelece como dia do vencimento da(s) parcela(s) o dia ____ do mês (de cada mês)."
        text "Cláusula 12ª: Os juros e multa diária pelo atraso no pagamento serão estabelecidos pela instituição financeira que realiza a emissão do(s) boleto(s) de pagamento."
        text "Cláusula 13ª: O atraso no pagamento por prazo superior a 30 (trinta) dias implicará na suspensão do acesso as aulas e na inscrição do nome do inadimplente no cadastro de protesto, SPC e Serasa."
        text "DA RECISÃO CONTRATUAL"
        text "Cláusula 14ª: A rescisão do contrato pode ser feita unilateralmente pelo Contratado, quando não houverem sido alcançadas as condições estabelecidas na Cláusula 4ª e no seu §1º, do presente contrato."
        text "Parágrafo Único: O contrato também pode ser reincidido unilateralmente pelo Contratado quando o contratante não obedecer aos ditames da Cláusula 8ª."
        text "Cláusula 15ª: A rescisão pode ser feita sem custas adicionais pelo Contratante, desde que seja requerida até a data do vencimento da parcela vincenda."
        text "DISPOSIÇÕES GERAIS"
        text "Cláusula 16ª: O ingresso dos alunos nas turmas será precedido de avaliação física."
        text "§1º: O Contratante poderá dispensar a avaliação física desde que ateste por escrito que encontra-se em condições de saúde para a prática de exercícios físicos."
        text "§2º: É de inteira responsabilidade do Contratante informar aos professores eventuais doenças, lesões ou sequelas."
        text ""
        text ""
        text ""
        text ""
        text "São Luís, _____ de ______________________ de 2013."
        text "Contratante:________________________  Contratado: ________________________"
        text "Testemunha: ______________________  Testemunha: ______________________"
        text "CPF:                                CPF:"
        text "Quadro de Turmas da Matrícula"
      end
    end
end
