//= require jquery
//= require rails-ujs
//= require_tree .
//= require add_bet
//= require notifications
//= require zebra-datepicker

window.zebra_datepicker_common = {
  days: ["Domingo", "Segunda", "Terça", "Quarta", "Quinta", "Sexta", "Sábado"],
  days_abbr: ["Dom", "Seg", "Ter", "Qua", "Qui", "Sex", "Sáb"],
  months: [
    "Janeiro",
    "Fevereiro",
    "Março",
    "Abril",
    "Maio",
    "Junho",
    "Julho",
    "Agosto",
    "Setembro",
    "Outubro",
    "Novembro",
    "Dezembro"
  ],
  months_abbr: [
    "Jan",
    "Fev",
    "Mar",
    "Abr",
    "Mai",
    "Jun",
    "Jul",
    "Ago",
    "Set",
    "Out",
    "Nov",
    "Dez"
  ],
  show_select_today: "Hoje",
  lang_clear_date: "Limpar",
  format: "d/m/Y",
  readonly_element: false
};

$(document).ready(function() {
    $(".datepicker").Zebra_DatePicker(zebra_datepicker_common);
});
