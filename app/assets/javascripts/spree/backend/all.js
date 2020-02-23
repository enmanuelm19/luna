//= require jquery3
//= require select2
//= require spree

function formatState (state) {
  if (!state.id) {
    return state.text;
  }
  var $state = $(
    '<span style="'+ state.text +'"> ' + state.text + '</span>'
  );
  return $state;
};
$("#color-variant").select2({
  templateResult: formatState
});
