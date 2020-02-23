//= require jquery3
//= require select2
//= require spree

function formatState (state) {
  console.log("state", state)
  if (!state.id) {
    return state.text;
  }
  var $state = $(
    '<span style="'+ state.text +'"> ' + state.text + '</span>'
  );
  return $state;
};
var selectVariant = document.getElementById('color-variant');
if (selectVariant) {
  console.log("select", selectVariant)
}
selectVariant.select2({
  templateResult: formatState
});
